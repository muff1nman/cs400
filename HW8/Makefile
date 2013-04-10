all: simpleCalc.tab.c

simpleCalc.tab.c: simpleCalc.y lex.yy.c
	bison simpleCalc.y

lex.yy.c: simpleCalc.l
	flex simpleCalc.l

clean:
	@rm -f *.c
