
all: final

.PHONY: dissertation clean ch-introduction ch-appendices
# Main ------------------------------------------------------------------------
final: 
	latexmk -pdf dissertation.tex

ch01:
	latexmk -pdf ch-introduction.tex

ch14:
	pdflatex ch-mcsplit.tex #latexmk -pdf ch-mcsplit.tex

ch50:
	latexmk -pdf ch-trie.tex

chAA:
	latexmk -pdf ch-appendices.tex

# Clean -----------------------------------------------------------------------
clean:
	git clean -f -X
