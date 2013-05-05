1. Why is a union used for yylval in some Bison/Flex files?
    - It allows for different types to be used as tokens.  For example you can
      have tokens of type integer and string and set yylval with either type.
2. Why shouldn’t the variable yytext be referenced in the Bison input file?
    - yytext is used by Bison as a buffer and can be modified at any time so it
      is not a good idea
3. What is meant when Bison issues a shift/reduce, reduce/reduce, shift/shift
   conflict warning?
    - ?
4. Describe the following attributes of a variable: Name, Address, Value, Type,
   Lifetime, and Scope.
    - Name
        - Is used to identify the variable throughout the program and oftentimes
          has a restriction on what characters can form a name.
    - Address
        - The machine address of the memory location at which the variable is
          stored
    - Value
        - The actual contents of the memory block for the variable.
    - Type
        - The type determines what values the variable can store and may
          determine how the compiler and/or runtime will interpret the value.
    - Lifetime
        - This is the time that a variable is bound to a certain address.  It
          begins when the variable is set to an address and ends when the
          address is unbound from the variable.
    - Scope
        - Determines where the variable can be read and/or writen in the
          program.
5. Describe the advantages and disadvantages of static, implicit heap-dynamic,
   explicit heap-dynamic, and stack-dynamic (a.k.a., automatic variables).
   - static 
       - Advantages:  It is very efficient from an addressing perspective and there is no overhead for addressing.  In addition they are convenient for  subprograms that need a sense of history. 
       - Disadvantages: There is reduced flexibility and a program with static variables alone cannot support recursion.  Also, subprograms cannot share storage. 
   - stack-dynamic 
       - Advantages:  By using this type of binding, programs can use recursion. In addition, with this type of storage, locals can share the same storage.  
       - Disadvantages: are that there is additional overhead from memory address calculation and from allocation and deallocation during runtime.  Also subprograms cannot be history sensitive.
   - explicit heap-dynamic 
       - Advantages: are that dynamic structures can be allowed to grow and shrink during runtime. Also, pointers can be easily passed between method calls without having to pass an entire structure of memory.  
       - Disadvantages: are that it is difficult to use references and pointers correctly.  Also, heap management is complex and costly.
   - implicit heap-dynamic 
       - Advantages: are that variables are very flexible and that they can be safer than explicit heap management because programmer errors are less common.  
       - Disadvantages: are that there is additional overhead to deal with the dynamic attributes and there is less error detection by the compiler.
6. What type of variables, in terms of lifetimes, are “needed” in order to
   support recursive functions? Explain why this is so.
    - Stack Dynamic variables are needed to support recursive functions because
      recursive functions need to have their own versions of local variables and
      this is conviently represented by stack dynamica variables whose lifetimes
      align with function calls.
7. Why are stack-dynamic variables generally referred to as “automatic”
   variables.
    -
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

