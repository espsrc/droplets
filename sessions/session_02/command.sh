pandoc README.md -t beamer -o session02.pdf -H head.tex
pandoc -t revealjs -s -o session02.html README.md  -V revealjs-url=https://revealjs.com
