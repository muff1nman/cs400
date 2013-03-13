all: words.out

words.out: words.c
	gcc words.c -o words.out

words.c: words.l
	flex -L -o words.c words.l

clean:
	@rm -rf *.c
	@rm -rf *.out


