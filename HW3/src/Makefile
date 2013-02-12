all: a.out

a.out :  calc.c calc.tab.o
	gcc calc.c calc.tab.o

calc.tab.o: calc.tab.h calc.tab.c
	gcc -c calc.tab.c

test:
	./a.out ../input.txt
	diff ../output.tst calc.tkn

clean:
	@rm -f a.out *.o *.tkn
