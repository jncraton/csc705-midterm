all: s1-languages.html

%.html: %.pmd
	pweave --format=md2html $<
	# Hack to remove padding from first line of code blocks
	sed -i -e "s/padding: 2px 4px//g" $<

$(SRC).pdf: $(SRC).html
	chromium-browser --headless --print-to-pdf=$(SRC).pdf $(SRC).html
	
clean:
	rm -f *.html *.pdf
	rm -rf figures
	rm -rf __pycache__