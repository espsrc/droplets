#!/bin/bash
  
echo "Usage: bash compile_presentation.sh my_file.md"

IN_FILE=$1
SUBSTRING=${IN_FILE%.*}
OUT_FILE_PDF=${SUBSTRING}.pdf
OUT_FILE_HTML=${SUBSTRING}.html

# Convert to pdf
pandoc $IN_FILE -t beamer -o $OUT_FILE_PDF

# Convert to html presentation with reveal.js
pandoc -t revealjs -s -o $OUT_FILE_HTML $IN_FILE -V revealjs-url=https://revealjs.com

