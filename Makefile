# Put bib.md last so that ref section gets a title
SOURCE_CHAPTERS := intro.md results.md bib.md

BIB := references.bib

PANDOC := pandoc

# Need --number-sections so that section xrefs work.
PANDOC_OPTS_ALL := -smart --number-sections 

#filters must be in this order so that section/fig/table/eqn AND bibtex works as expected
PANDO_PDF_OPTS :=  --filter pandoc-crossref --filter pandoc-citeproc --default-image-extension=pdf $(PANDOC_OPTS_ALL)

all: test.pdf

test.pdf: $(SOURCE_CHAPTERS) $(BIB) Makefile
	$(PANDOC) $(PANDO_PDF_OPTS) -o $@ $(SOURCE_CHAPTERS)

clean:
	rm -f test.pdf
