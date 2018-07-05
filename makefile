all: s1-languages.html s2-problems.html s3-gc-safe-pointers.html

pdf: s1-languages.pdf s2-problems.pdf s3-gc-safe-pointers.pdf

%.html: %.pmd
	pweave --format=md2html $<
	# Hack to remove padding from first line of code blocks
	sed -i -e "s/padding: 2px 4px//g" $@

%.pdf: %.html
	chromium-browser --headless --print-to-pdf=$@ $<
	
clean:
	rm -f *.html *.pdf
	rm -rf figures
	rm -rf __pycache__