all: s1-languages.pdf

s1-languages.pdf: s1-languages.md
	pandoc s1-languages.md -o s1-languages.pdf