#!/bin/bash

for filename in *.svg; do
    name=$(basename -s .svg $filename)
    cat $name.svg | ~/Programs/inkscape/Inkscape-0a00cf5-x86_64.AppImage --pipe --export-filename=$name.pdf
done

