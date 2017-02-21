module Routes exposing (..)

import Home exposing (sobre)
import Archives exposing (conteudo)
import CV exposing (conteudo)
import Errop exposing (conteudo)
import Myposts.Artigo1
import Myposts.Artigo2
import Myposts.Artigo3


home : String
home =
    "#"


artigo : int -> String
artigo i =
    "#artigo/" ++ toString i


arquivos : String
arquivos =
    "#arquivos"


cv : String
cv =
    "#CV"


verify : String -> String
verify url =
    case url of
        "" ->
            sobre

        "#arquivos" ->
            Archives.conteudo

        "#gamification" ->
            Myposts.Artigo1.conteudo

        "#gitflow" ->
            Myposts.Artigo2.conteudo

        "#recursao" ->
            Myposts.Artigo3.conteudo

        "#CV" ->
            CV.conteudo

        _ ->
            Errop.conteudo
