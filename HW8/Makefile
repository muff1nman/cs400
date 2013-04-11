all: calc

calc : simpleCalc.tab.c simpleCalc.tab.h simpleCalc.c
	gcc simpleCalc.tab.c simpleCalc.tab.h simpleCalc.c -lm -o calc

simpleCalc.c: simpleCalc.l
	flex -L -o simpleCalc.c simpleCalc.l

simpleCalc.tab.c: simpleCalc.y
	bison -d simpleCalc.y

clean:
	@rm -f simpleCalc.tab.c simpleCalc.c simpleCalc.tab.h *.gch calc a.out *.o
