SCRIPTS=    common.sh reflektion.sh seminarium.sh
SCRIPTS+=   prosammail.py

.PHONY: all
all: prosam-grading.pdf ${SCRIPTS}

INCLUDE_MAKEFILES=./makefiles
include ${INCLUDE_MAKEFILES}/noweb.mk

Makefile: prosam-grading.nw
	${NOTANGLE.mk}
.INTERMEDIATE: prosam-grading.tex
prosam-grading.pdf: prosam-grading.nw
	${NOWEAVE.pdf}
${SCRIPTS}: prosam-grading.nw
	${NOTANGLE}
	chmod +x $@

.PHONY: clean
clean:
	${RM} prosam-grading.tex prosam-grading.aux prosam-grading.fdb_latexmk
	${RM} prosam-grading.fls prosam-grading.log prosam-grading.pdf
	${RM} ${SCRIPTS}
