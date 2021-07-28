FILE = Manual

DEP1=./Manual
PDFLATEX=pdflatex

TEXDEP=$(DEP1).tex

pdf: $(FILE).pdf
	$(PDFLATEX) $(FILE).tex
	
all: $(FILE).pdf
$(FILE).pdf: $(FILE).tex $(TEXDEP) $(FILE).bbl
	$(PDFLATEX) $(FILE).tex  && pdflatex $(FILE).tex
$(FILE).bbl: $(FILE).tex $(TEXDEP) 
	$(PDFLATEX) $(FILE) && biber $(FILE)
	
		
.PHONY: clean proper

clean:
	rm -f *.bbl
	rm -f *.blg
	rm -f *.bcf
	rm -f *.xml		
	rm -f *.glo
	rm -f *.gls
	rm -f *.idx
	rm -f *.ilg
	rm -f *.ind
	rm -f *.lof
	rm -f *.log
	rm -f *.lot
	rm -f *.out
	rm -f *.toc
	rm -f *.spl
	rm -f *.*-stamp *.*-stamp2
	rm -f *.synctex.gz
	rm -f ./Latex-Figures/*.aux ./Latex-Figures/*.log ./Latex-Figures/*.gz	
	rm -f $(FILE).dvi
	rm -f $(FILE).ps
	rm -f $(FILE)-figure*

proper:
	make clean
	rm -f *.aux
	rm -f *.auxlock
	rm -f $(FILE).pdf
