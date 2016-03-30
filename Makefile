# Problems must have format prob1.tex
# Use `make` to make all
# Use `make clean` to clean *.pdf and the OUTPUT_DIR
# Use `make open` to open with PDF_READ

PDF_CREATE=pdflatex
PDF_READ=evince

TEX_FILES=resume.tex
PDF_FILES=resume.pdf
OUTPUT_DIR=.pdflatex_out

.PHONY: clean all open rerun touch

all: $(PDF_FILES)

rerun: touch all

touch:
	touch $(TEX_FILES)

%.pdf: %.tex
	mkdir -p $(OUTPUT_DIR)
	$(PDF_CREATE) -output-directory $(OUTPUT_DIR) $<
	mv $(OUTPUT_DIR)/$@ .

open: all
	$(PDF_READ) .pdf &> /dev/null &

clean:
	@rm -f $(PDF_FILES) $(OUTPUT_DIR)/*
