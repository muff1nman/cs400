all: words.out pascal.out complex.out

words.out: words.c
	gcc words.c -o words.out

words.c: words.l
	flex -L -o words.c words.l

pascal.out: pascal.c
	gcc pascal.c -o pascal.out

pascal.c: pascal.l
	flex -L -o pascal.c pascal.l

complex.out: complex.c
	gcc complex.c -o complex.out

complex.c: complex.l
	flex -L -o complex.c complex.l

clean:
	@rm -rf *.c
	@rm -rf *.out


