# Compiler settings
LATEX = pdflatex
FLAGS = -interaction=nonstopmode -shell-escape

# File names
SOURCE = resume.tex
OUTPUT = PRAJWAL_MURTHY_RESUME.pdf

all: $(OUTPUT) optimize check-metadata

$(OUTPUT): $(SOURCE)
	$(LATEX) $(FLAGS) -output-format=pdf -jobname=$(basename $(OUTPUT)) $(SOURCE)
	$(LATEX) $(FLAGS) -output-format=pdf -jobname=$(basename $(OUTPUT)) $(SOURCE)

optimize: $(OUTPUT)
	qpdf --linearize $(OUTPUT) $(basename $(OUTPUT))_optimized.pdf
	mv $(basename $(OUTPUT))_optimized.pdf $(OUTPUT)

check-metadata: $(OUTPUT)
	@echo "Checking PDF metadata..."
	@pdfinfo $(OUTPUT)
	@echo "PDF optimization check complete."

clean:
	rm -f *.aux *.log *.out *.pdf