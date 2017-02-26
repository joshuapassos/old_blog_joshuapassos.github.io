module Model exposing (..)


type alias Model =
    { conteudo : String
    , titulo : String
    , data : String
    , url : String
    }


model : Model
model =
    { titulo = "Index", data = "", url = "", conteudo = "Carregando" }
