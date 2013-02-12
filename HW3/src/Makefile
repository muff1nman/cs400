all: a.out

a.out :  calc.c calc.tab.o types.o functions.o
	gcc calc.c calc.tab.o types.o functions.o

calc.tab.o: calc.tab.h calc.tab.c types.h functions.h
	gcc -c calc.tab.c

types.o: types.h types.c
	gcc -c types.c

functions.o : functions.h functions.c
	gcc -c functions.c

test:
	./a.out ../input.txt
	diff ../output.tst calc.tkn

clean:
	@rm -f a.out *.o *.tkn
