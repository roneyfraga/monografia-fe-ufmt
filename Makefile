# Definição de variáveis
source      = principal
latex       = pdflatex
bibtex      = bibtex
makeindex   = makeindex
ghostscript = gs
pdfviewer	= zathura

all: build clean

latexmk:
	latexmk -pdf -pvc $(source).tex

open:
	$(pdfviewer) $(source).pdf  &

# Compila o código fonte
build:
	@echo "Compilando arquivos..."
	$(latex) $(source).tex
	$(makeindex) $(source).idx
	$(bibtex) $(source).aux
	$(latex) $(source).tex
	$(latex) $(source).tex
	$(latex) $(source).tex
	# @echo "Comprimindo o arquivo pdf..."
	# @$(ghostscript) -q -dNOPAUSE -dBATCH -dSAFER \
	# 	-sDEVICE=pdfwrite \
	# 	-dEmbedAllFonts=true \
	# 	-dSubsetFonts=true \
	# 	-sOutputFile=$(source)_compressed.pdf \
	# 	$(source).pdf
	@echo "Terminado."

# Remove arquivos temporários
clean:
	@echo "Limpando arquivos temporarios..."
	@find . -type f -iname "*.aux" -delete
	@find . -type f -iname "*.log" -delete
	@find . -type f -iname "*.fdb_latexmk" -delete
	@find . -type f -iname "*.*~" -delete
	@rm -f *.bak *.ps *.l* *.idx *.bbl *.brf *.glo *.dvi *.toc *.blg *.ilg *.ind *.out *.wsp *.fls *.synctex*
	@echo "Terminado."
