AUX_DIR=./aux 
# You want latexmk to *always* run, because make does not have all the info.
# Also, include non-file targets in .PHONY so they are run regardless of any
# file of the given name existing.
.PHONY: all clean cleanall plaquettes circuits

# The first rule in a Makefile is the one executed by default ("make"). It
# should always be the "all" rule, so that "make" and "make all" are identical.
all: $(AUX_DIR) plaquettes circuits main.pdf

# CUSTOM BUILD RULES

# -pdf tells latexmk to generate PDF directly (instead of DVI).
# -pdflatex="" tells latexmk to call a specific backend with specific options.
# -use-make tells latexmk to call make for generating missing files.

# -interaction=nonstopmode keeps the pdflatex backend from stopping at a
# missing file reference and interactively asking you for an alternative.

$(AUX_DIR):
	mkdir -p $(AUX_DIR)

plaquettes:
	$(MAKE) -C plaquettes

circuits: 
	$(MAKE) -C circuits

main.pdf: main.tex plaquettes circuits
	latexmk -pdf -pdflatex="pdflatex -interaction=nonstopmode" -use-make -auxdir=$(AUX_DIR) $<

clean:
	$(MAKE) -C circuits clean	
	$(MAKE) -C plaquettes clean
	rm -rf $(AUX_DIR)

cleanall: clean
	$(MAKE) -C circuits cleanall
	$(MAKE) -C plaquettes cleanall
	rm -f main.pdf
