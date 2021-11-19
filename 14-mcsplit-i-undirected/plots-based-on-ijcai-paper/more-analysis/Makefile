all: kup-vs-kdown-mcsplain.txt kup-vs-kdown-mcs33ved.txt realkdown-vs-kdown-sip.txt

realkdown-vs-kdown-sip.txt:
	python kup-vs-kdown.py sip 3 5 ~ --sip-kdown | sed '1s/kup/realkdown/' > realkdown-vs-kdown-sip.txt

kup-vs-kdown-mcsplain.txt:
	python kup-vs-kdown.py mcsplain 7 8 ~ > kup-vs-kdown-mcsplain.txt

kup-vs-kdown-mcs33ved.txt:
	python kup-vs-kdown.py mcs33ved 6 7 ~ > kup-vs-kdown-mcs33ved.txt

clean:
	rm -f plots/*.pdf
	rm -f kup-vs-kdown*.txt
	rm -f realkdown-vs-kdown-sip.txt
