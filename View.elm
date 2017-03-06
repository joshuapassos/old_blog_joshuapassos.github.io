module View exposing (..)

import Html exposing (..)
import Model exposing (..)
import Html.Attributes exposing (..)
import Markdown


view : Model -> Html msg
view model =
    node "div" [] [ hbody model ]


hbody : Model -> Html msg
hbody model =
    div [] [ hnav, hpage model, hfooter ]


hnav : Html msg
hnav =
    nav [ class "navbar navbar-toggleable-md navbar-light bg-faded container-fluid" ]
        [ a [ class "navbar-brand", href "#" ]
            [ text "λ" ]
        , div [ class "collapse navbar-collapse", id "navbarSupportedContent" ]
            [ ul [ class "navbar-nav mr-auto" ]
                [ li [ class "nav-item active" ]
                    [ a [ class "nav-link", href "#" ]
                        [ text "Home "
                        , span [ class "sr-only" ]
                            [ text "(current)" ]
                        ]
                    ]
                , li [ class "nav-item" ]
                    [ a [ class "nav-link", href "#arquivos" ]
                        [ text "Arquivos" ]
                    ]
                , li [ class "nav-item" ]
                    [ a [ class "nav-link", href "#CV" ]
                        [ text "CV" ]
                    ]
                , li [ class "nav-item" ]
                    [ a [ class "nav-link", href "#stats" ]
                        [ text "Status" ]
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
            [ div [] [ (Markdown.toHtml [] model.conteudo) ]
            ]
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
