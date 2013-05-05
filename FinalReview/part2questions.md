1. Why is a union used for yylval in some Bison/Flex files?
2. Why shouldn’t the variable yytext be referenced in the Bison input file?
3. What is meant when Bison issues a shift/reduce, reduce/reduce, shift/shift
   conflict warning?
4. Describe the following attributes of a variable: Name, Address, Value, Type,
   Lifetime, and Scope.
5. Describe the advantages and disadvantages of static, implicit heap--dynamic,
   explicit heap-dynamic, and stack-dynamic (a.k.a., automatic variables).
6. What type of variables, in terms of lifetimes, are “needed” in order to
   support recursive functions? Explain why this is so.
7. Why are stack-dynamic variables generally referred to as “automatic”
   variables.
8. What is meant when a language is described as “strongly typed”?
9. What is meant by “dynamic type binding”? What are some of the advantages and
   disadvantages?
10. What is the difference between “load time” binding and “runtime” binding?
    Give an example of each.
11. What is meant by “type coercion”? Describe the difference between implicit
    and explicit coercion.
12. What is the difference between a formal parameter and an actual parameter?
13. What is the difference between a positional parameter and a keyword
    parameter? What are some advantages and disadvantages of each?
14. Strictly speaking, what is the difference between a procedure and a
    function?
15. What is meant by “pass-by-value”? What are the advantages and disadvantages?
16. In C, the statement printf(“%f”, x); works the same way regardless of
    whether x is a float or a double. Why?
17. In C, parameters are always passed by value. Yet the concept of
    “pass-by-reference” is generally used to describe how arrays and strings are
    passed to a function. Resolve the apparent discrepancy in terms of the
    difference between semantics and how semantics are implemented.
18. In C, when an array is passed to a function and the formal parameter is not
    declared merely as a pointer to the type of data stored in the array, the
    declaration must include the number of elements in each dimension except
    one, which may be left blank. Which dimension is optional and why is it not
    necessary?
19. What is printed by the C statement: printf(“%s”, &(1+2)[”Hello World”]+3);
20. In C, how are arguments corresponding to an ellipsis as the formal parameter
    list handled?

