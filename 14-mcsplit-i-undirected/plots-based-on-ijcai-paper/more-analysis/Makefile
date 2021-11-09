all: kup-vs-kdown-mcsplain.txt kup-vs-kdown-mcs33ved.txt

kup-vs-kdown-mcsplain.txt:
	python kup-vs-kdown.py mcsplain 7 8 ~ > kup-vs-kdown-mcsplain.txt

kup-vs-kdown-mcs33ved.txt:
	python kup-vs-kdown.py mcs33ved 6 7 ~ > kup-vs-kdown-mcs33ved.txt

clean:
	rm plots/*.pdf
	rm kup-vs-kdown*.txt
