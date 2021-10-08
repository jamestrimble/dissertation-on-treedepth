all: sea-paper.pdf

sea-paper.pdf: sea-paper.tex bib.bib
	latexmk -pdf sea-paper.tex

read:
	evince sea-paper.pdf &

clean:
	rm -f *.bbl *.aux *.blg *.fdb_latexmk *.fls *.log sea-paper.pdf tmp.*
