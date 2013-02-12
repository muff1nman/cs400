all: a.out

a.out :  calc.c calc.tab.o types.o
	gcc calc.c calc.tab.o types.o

calc.tab.o: calc.tab.h calc.tab.c types.h
	gcc -c calc.tab.c

types.o: types.h types.c
	gcc -c types.c

test:
	./a.out ../input.txt
	diff ../output.tst calc.tkn

clean:
	@rm -f a.out *.o *.tkn
