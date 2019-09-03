#!/bin/bash

file=$(readlink -f "$1")
dir=$(dirname "$file")
base="${file%.*}"

cd "$dir" || exit

textype() { \
	command="latexmk -pdf -interaction=nonstopmode"
	( sed 5q "$file" | grep -i -q 'xelatex' ) && command="xelatex"
	$command --output-directory="$dir" "$base" &&
	grep -i addbibresource "$file" >/dev/null &&
	biber --input-directory "$dir" "$base" &&
	$command --output-directory="$dir" "$base" &&
	$command --output-directory="$dir" "$base"
	}

case "$file" in
	*\.rmd) echo "require(rmarkdown); render('$file')" | R -q --vanilla ;;
	*\.tex) textype "$file" ;;
	*\.md) pandoc "$file" --pdf-engine=pdflatex -o "$base".pdf --verbose;;
	*\.py) python "$file" ;;
	*\.go) go run "$file" ;;
	*) sed 1q "$file" | grep "^#!/" | sed "s/^#!//" | xargs -r -I % "$file" ;;
esac
