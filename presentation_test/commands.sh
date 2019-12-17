# Convert to pdf
pandoc test.md -t beamer -o myslides.pdf 

# Convert to html presentation with reveal.js
pandoc -t revealjs -s -o myslides.html test.md  -V revealjs-url=https://revealjs.com
