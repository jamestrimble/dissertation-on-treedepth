
all: final

.PHONY: dissertation clean ch-introduction ch-appendices
# Main ------------------------------------------------------------------------
final: 
	latexmk -pdf dissertation.tex

ch01:
	latexmk -pdf ch-introduction.tex

ch14:
	latexmk -pdf ch-mcsplit.tex
	#pdflatex ch-mcsplit.tex # for speed?

ch14a:
	latexmk -pdf ch-swapping.tex
	#pdflatex ch-swapping.tex # for speed?

ch14b:
	#latexmk -pdf ch-si.tex
	pdflatex ch-si.tex # for speed?

ch15:
	latexmk -pdf ch-universalgraphs.tex
	#pdflatex ch-universalgraphs.tex # for speed?

ch40:
	latexmk -pdf ch-conclusion.tex

ch50:
	latexmk -pdf ch-trie.tex

ch70:
	latexmk -pdf ch-bute.tex

chAA:
	latexmk -pdf ch-appendices.tex

# Clean -----------------------------------------------------------------------
##clean:
##	git clean -f -X
