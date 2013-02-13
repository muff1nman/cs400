all: a.out

a.out :  calc.c calc.tab.o types.o functions.o additional.o
	gcc calc.c calc.tab.o types.o functions.o additional.o -Wall -g

calc.tab.o: calc.tab.h calc.tab.c types.h functions.h
	gcc -c calc.tab.c -Wall -g

types.o: types.h types.c
	gcc -c types.c -Wall -g

functions.o : functions.h functions.c
	gcc -c functions.c -Wall -g

additional.o : additional.h additional.c
	gcc -c additional.c -Wall -g

test:
	./a.out ../input.txt
	diff ../output.tst calc.tkn

test_function:
	gcc test_function.c functions.c -o test_function.out

test_scrub:
	gcc additional.c test_scrub.c -o test_scrub.out

clean:
	@rm -f a.out *.o *.tkn
