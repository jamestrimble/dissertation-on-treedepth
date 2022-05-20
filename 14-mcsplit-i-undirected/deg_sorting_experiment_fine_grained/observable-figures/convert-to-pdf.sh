#!/bin/bash

for name in bars10 winners10 bars10directed winners10directed; do
    cat $name.svg | ~/Programs/inkscape/Inkscape-0a00cf5-x86_64.AppImage --pipe --export-filename=$name.pdf
done

