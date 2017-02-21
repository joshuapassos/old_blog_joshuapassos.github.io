module View exposing (..)

import Markdown
import Routes exposing (..)
import Html exposing (..)
import String
import List
import Maybe
import Html.Attributes exposing (..)
import Material.Layout as Layout
import Material.Button as Button
import Navigation exposing (..)
import Json.Decode exposing (list, string)
import Task exposing (Task, andThen, mapError, succeed, fail)
import Home exposing (sobre)


view : Model -> Html msg
view model =
    node "html" [] [ hbody model, hhead ]


type alias Model =
    { urll : Navigation.Location
    , conteudo : String
    }


notFound : Html msg
notFound =
    h1 [] [ text "Page not found" ]


hhead : Html msg
hhead =
    header
        []
        [ node "link"
            [ href "/css/index.css", rel "stylesheet" ]
            []
        , node "link"
            [ href "/lib/bootstrap.min.css", rel "stylesheet", type_ "text/css" ]
            []
        , node "link"
            [ href "/lib/bootstrap-material-design.min.css", rel "stylesheet", type_ "text/css" ]
            []
        , node "link"
            [ href "/lib/ripples.min.css", rel "stylesheet", type_ "text/css" ]
            []
        , node "link"
            [ href "icon.png", rel "icon" ]
            []
        , node "link"
            [ href "/css/default.min.css", rel "stylesheet" ]
            []
        , node "meta"
            [ charset "utf-8" ]
            []
        , node "title"
            [ attribute "ng-bind" "titulo" ]
            [ text "Project Josh" ]
        , node "meta"
            [ content "Project Josh" ]
            []
        , node "meta"
            [ content "icon.png" ]
            []
        , node "meta"
            [ content "Site pessoal de Joshua" ]
            []
        ]


hbody : Model -> Html msg
hbody model =
    body [] [ hnav, hpage model, hfooter ]


hstatus : Html msg
hstatus =
    div [ class "navbar alert alert-dismissible alert-success", id "contact" ]
        [ div [ align "center", class "col-md-12" ]
            [ a []
                [ img [ attribute "height" "290", src "https://wakatime.com/share/@joshuapassos/47b27e58-11b3-4ea6-bbd4-a7c36799f50d.png", attribute "width" "400" ]
                    []
                , text " "
                ]
            , a []
                [ img [ attribute "height" "290", src "https://wakatime.com/share/@joshuapassos/e7226eee-6532-48c9-9729-cfbcb661c685.png", attribute "width" "400" ]
                    []
                ]
            ]
        ]


hnav : Html msg
hnav =
    div [ class "navbar navbar-inverse" ]
        [ div [ class "container-fluid" ]
            [ div [ class "navbar-header" ]
                [ a [ class "navbar-brand", href (Routes.home) ]
                    [ text "λ" ]
                ]
            , div [ class "navbar-collapse collapse navbar-inverse-collapse" ]
                [ ul [ class "nav navbar-nav" ]
                    [ li [ class "active" ]
                        [ a [ href (Routes.home) ]
                            [ text "Home" ]
                        ]
                    , li [ class "" ]
                        [ a [ href (Routes.arquivos) ]
                            [ text "Archives" ]
                        ]
                    ]
                , ul [ class "nav navbar-nav navbar-right" ]
                    [ li []
                        [ a [ href (Routes.cv) ]
                            [ text "CV" ]
                        ]
                    , li []
                        [ a [ href "#", id "toggle" ]
                            [ text "Stats" ]
                        ]
                    ]
                ]
            ]
        ]


hpage : Model -> Html msg
hpage model =
    div [ class "container-fluid" ]
        [ hpost model ]


hpost : Model -> Html msg
hpost model =
    div [ class "container-fluid col-md-12", id "post" ]
        [ div [ class "jumbotron", id "text" ]
            [ div [] <|
                Markdown.toHtml Nothing model.conteudo
            ]
        ]


hinfo : Html msg
hinfo =
    div [ class "alert alert-dismissible alert-info" ]
        [ button [ class "close", attribute "data-dismiss" "alert", type_ "button" ]
            [ text "×" ]
        , strong []
            [ text "Esse artigo foi escrito: {{datap}}" ]
        , br []
            []
        , strong []
            [ text "{{tags}}" ]
        ]


hleftmenu : Html msg
hleftmenu =
    div [ class "well well-lg col-md-2", align "center" ]
        [ p []
            [ strong []
                [ text "Categorias" ]
            ]
        , ul [ class "nav nav-pills nav-stacked", attribute "style" "max-width: 300px;" ]
            [ li [] [ a [ href "https://github.com" ] [ text "teste" ] ] ]
        ]


hfooter : Html msg
hfooter =
    footer [ class "footer" ]
        [ div [ align "center", class "container" ]
            [ p [ class "text-muted" ]
                [ node "h7"
                    []
                    cafelove
                ]
            ]
        ]


cafelove : List (Html msg)
cafelove =
    [ text "Made with "
    , text "C"
    , sub []
        [ text "8" ]
    , text "H"
    , sub []
        [ text "10" ]
    , text "N"
    , sub []
        [ text "4" ]
    , text "O"
    , sub []
        [ text "2" ]
    , text "+ ♥"
    , text " by: "
    , a [ href "https://github.com/joshuapassos", target "_blank" ]
        [ text "Joshua Passos" ]
    ]
