module Routes exposing (..)


verif : String -> String
verif url =
    case url of
        "" ->
            "sobre.md"

        "#artigos" ->
            "artigos.md"

        "#gamification" ->
            "myposts/Gamification.md"

        "#zswap" ->
            "myposts/zswap.md"

        "#gitflow" ->
            "myposts/gitflow.md"

        "#recursao" ->
            "myposts/recursao.md"

        "#CV" ->
            "cv.md"

        "#stats" ->
            "stats.md"

        _ ->
            "sobre.md"
