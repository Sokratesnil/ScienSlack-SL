#LaTeX用MakeFile
MAINNAME = SL
MAINFILE = $(MAINNAME).tex
SLIDE = $(MAINNAME).pdf
HANDOUT = $(MAINNAME)_handout.pdf
LATEX = latexmk -c -gg -lualatex
SETTINGS = mysettings.sty

.DEFAULT_GOAL = all

.PHONY: all slide handout
all: $(SLIDE) $(HANDOUT)
slide: $(SLIDE)
handout: $(HANDOUT)

$(SLIDE): $(MAINFILE) $(SETTINGS) title.tex
	$(LATEX) $<
	make clean

$(HANDOUT): $(MAINNAME)_handout.ltx $(MAINFILE) $(SETTINGS) title.tex
	$(LATEX) $<
	make clean

.PHONY: clean
clean:; rm -f *.aux *.nav *.out *.snm *.toc *~ *.dvi *.fls *.fdb_latexmk *.synctex.gz *.blg
