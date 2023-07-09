LIB = pdflatex

all: create clean

# The build target executable:
create: resume.tex
	$(LIB) -jobname=PRAJWAL_SOMENDYAPANAHALLI_VENKATESHMURTHY_RESUME resume.tex

# To remove generated files
clean:
	$(RM) *.log *.out *.aux
