module Main exposing (..)

import View exposing (..)
import Navigation
import Routes exposing (..)
import Home exposing (sobre)


type Msg
    = UrlChange Navigation.Location


init : Navigation.Location -> ( Model, Cmd Msg )
init location =
    ( { urll = location, conteudo = Routes.verify location.hash }
    , Cmd.none
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UrlChange location ->
            ( { model
                | urll = location
                , conteudo = Routes.verify location.hash
              }
            , Cmd.none
            )


viewLocation : Navigation.Location -> String
viewLocation lx =
    lx.pathname ++ lx.hash


main : Program Never Model Msg
main =
    Navigation.program UrlChange
        { init = init
        , view = View.view
        , update = update
        , subscriptions = (\_ -> Sub.none)
        }



-- MODEL
-- UPDATE
-- VIEW
