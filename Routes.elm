module Routes exposing (..)


verif : String -> String
verif url =
    case url of
        "" ->
            "sobre.md"

        "#arquivos" ->
            "arquivos.md"

        "#gamification" ->
            "myposts/Gamification.md"

        "#gitflow" ->
            "myposts/gitflow.md"

        "#recursao" ->
            "myposts/gitflow.md"

        "#CV" ->
            "cv.md"

        "#stats" ->
            "stats.md"

        _ ->
            "sobre.md"
