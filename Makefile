# Compiler settings
LATEX = latexmk
FLAGS = -pdf -interaction=nonstopmode -shell-escape -synctex=1

# File names
SOURCE = resume.tex
OUTPUT = PRAJWAL_MURTHY_RESUME.pdf

all: $(OUTPUT) optimize check-metadata

# Live compilation mode
watch:
	$(LATEX) -pvc $(FLAGS) -jobname=$(basename $(OUTPUT)) $(SOURCE)

$(OUTPUT): $(SOURCE)
	$(LATEX) $(FLAGS) -jobname=$(basename $(OUTPUT)) $(SOURCE)

optimize: $(OUTPUT)
	qpdf --linearize $(OUTPUT) $(basename $(OUTPUT))_optimized.pdf
	mv $(basename $(OUTPUT))_optimized.pdf $(OUTPUT)

check-metadata: $(OUTPUT)
	@echo "Checking PDF metadata..."
	@pdfinfo $(OUTPUT)
	@echo "PDF optimization check complete."

clean:
	$(LATEX) -C
	rm -f *.aux *.log *.out *.pdf *.fls *.fdb_latexmk *.synctex.gz