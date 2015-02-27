SRC=p.tex
PICS=
TETEXSRC=../sty
USE_PDFTEX=1

include ../Makefile.common

all::p.pdf

p.pdf: revision.tex $(PICS) nourl-stamp

# if anyone knows better way to just tell to don't include crap urls,
# be my guest to implement it. Alternative way is simply to rename url
# -> xURL or smth within .bib but that somewhat breaks their usability
# within GUIsh bib-editors
nourl-stamp: p.bbl
	sed -i  -e '/\(^\\newline\\url.*\|pubmed\|\.pdf\)/d' $^
	touch $@

pics: $(PICS)

clean::
	rm -f nourl-stamp $(PICS)
