#!/usr/bin/env bash

PREVIEW_TEMPLATE=${HOME}/.config/tikzviewer/preview_template.tex

while inotifywait -e close_write $1; do
    echo "event triggered"
    sed s,_FILENAME_,$1, $PREVIEW_TEMPLATE > /tmp/render.tex
    pdflatex /tmp/render.tex -halt-on-error -interaction=nonstopmode
    echo $?
done
