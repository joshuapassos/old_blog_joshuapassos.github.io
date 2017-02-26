module Main exposing (..)

import Http
import Navigation
import View exposing (view)
import Routes exposing (verif)
import Model exposing (Model, model)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UrlChange location ->
            ( model
            , getPost (verif location.hash)
            )

        NewPost (Ok vl) ->
            ( { titulo = model.titulo, data = model.data, url = model.url, conteudo = vl }, Cmd.none )

        NewPost (Err _) ->
            ( model, Cmd.none )


type Msg
    = NewPost (Result Http.Error String)
    | UrlChange Navigation.Location


getPost : String -> Cmd Msg
getPost url =
    Http.send NewPost <| Http.getString url


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


init : Navigation.Location -> ( Model, Cmd Msg )
init location =
    ( { titulo = "Index", data = location.hash, url = (toString location), conteudo = "Carregando" }
    , getPost (verif location.hash)
    )


main : Program Never Model Msg
main =
    Navigation.program UrlChange
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
