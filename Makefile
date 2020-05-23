all: main.pdf frontAndBackCoversOnly.pdf

# consider all bib files and tex files from root + tex files from subfolders
main.pdf: *.tex *.bib **/*.tex 
#	-shell-escape is compulsory if you are using the minted LaTeX package (because it calls the pygmentize Linux package)
	pdflatex -shell-escape main.tex
	biber main
#	makeglossaries main # uncomment if you are using glossaries package
	pdflatex -shell-escape main.tex
	pdflatex -shell-escape main.tex
#	three compilations so that all refs are correct

frontAndBackCoversOnly.pdf: *.tex **/*.tex
	pdflatex frontAndBackCoversOnly.tex
	pdflatex frontAndBackCoversOnly.tex

clean: 
	rm -f *.aux *.log *~ *.bbl *.blg *.dvi *.toc *.out *.bcf *.run.xml *.acn *.acr *.alg *.glg *.glo *.gls *.ist *.lof *.lot *.maf *.mtc*

Clean: clean
	rm -rf main.pdf frontAndBackCoversOnly.pdf

