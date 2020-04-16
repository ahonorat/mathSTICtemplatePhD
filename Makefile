all: main.pdf

main.pdf: *.tex *.bib couverture/*.tex
#	-shell-escape is compulsory if you are using the minted LaTeX package (because it calls the pygmentize Linux package)
	pdflatex -shell-escape main.tex
	biber main
#	makeglossaries main # uncomment if you are using glossaries package
	pdflatex -shell-escape main.tex
	pdflatex -shell-escape main.tex
#	three compilations so that all refs are correct

clean: 
	rm -f *.aux *.log *~ *.bbl *.blg *.dvi *.toc *.out *.bcf *.run.xml *.acn *.acr *.alg *.glg *.glo *.gls *.ist *.lof *.lot *.maf main.mtc* main.pdf
