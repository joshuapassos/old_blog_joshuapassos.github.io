#!/bin/sh
elm-make  Main.elm --output main.js
minify main.js
http-server &
google-chrome http://127.0.0.1:8080
