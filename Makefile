# PATH for libraries is guessed
RPACKAGE = smudgeplot
$(eval PATH := $(shell Rscript -e "noquote(.libPaths())" | tail -1 | cut -f 2 -d ' '))

ifndef INSTAL_PREFIX
    INSTAL_PREFIX = /usr/local
endif

R_INSTALLATION = $(PATH)/$(RPACKAGE)
HET_KMERS_INST = $(INSTAL_PREFIX)/bin/hetkmers.py
SMUDGEPLOT_INST = $(INSTAL_PREFIX)/bin/smudgeplot.R

.PHONY : install
install : $(R_INSTALLATION) $(HET_KMERS_INST) $(SMUDGEPLOT_INST)

$(INSTAL_PREFIX)/bin/% : %
	install -C $< $(INSTAL_PREFIX)/bin

$(INSTALLATION) : R/*
	Rscript install.R
