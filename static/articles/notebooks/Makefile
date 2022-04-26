.PHONY: clean veryclean

%.html : %.org
	 org-babel -html $^

%.pdf : %.org
	 org-babel -pdf $^

clean:
	rm -f *.tex *.tex~ *.png *blx.bib *.bbl *.synctex.gz references.html

veryclean:
	rm -f *.pdf *.html
	rm -f *.tex *.tex~ *.png *blx.bib *.bbl *.synctex.gz references.html
