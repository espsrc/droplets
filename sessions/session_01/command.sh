pandoc README.md -t beamer -o session01.pdf -H head.tex
pandoc -t revealjs -s -o session01.html README.md  -V revealjs-url=https://revealjs.com
