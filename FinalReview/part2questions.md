1. Why is a union used for yylval in some Bison/Flex files?
    - It allows for different types to be used as tokens.  For example you can
      have tokens of type integer and string and set yylval with either type.
2. Why shouldn’t the variable yytext be referenced in the Bison input file?
    - yytext is used by the lexer as a buffer and can be modified at any time so it
      is not a good idea
3. What is meant when Bison issues a shift/reduce, reduce/reduce, shift/shift
   conflict warning?
    - shift/reduce
        - This conflict appears when bison can either reduce based on the
          current token and contents of the stack or it can shift based on the
          next token coming up. Bison will choose to shift.
    - reduce/reduce
        - This conflict appears when there are two or more production rules that
          can apply to a given input. Bison will choose the first rule
          encountered.
    - shift/shift
        - 
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
       - Advantages:  It is very efficient from an addressing perspective and
         there is no overhead for addressing.  In addition they are convenient
         for  subprograms that need a sense of history. 
       - Disadvantages: There is reduced flexibility and a program with static
         variables alone cannot support recursion.  Also, subprograms cannot
         share storage. 
   - stack-dynamic 
       - Advantages:  By using this type of binding, programs can use recursion.
         In addition, with this type of storage, locals can share the same
         storage i.e. storage conservation.  
       - Disadvantages: are that there is additional overhead from memory
         address calculation and from allocation and deallocation during
         runtime.  Also subprograms cannot be history sensitive. more
         inefficient memory references
   - explicit heap-dynamic 
       - Advantages: are that dynamic structures can be allowed to grow and
         shrink during runtime. Also, pointers can be easily passed between
         method calls without having to pass an entire structure of memory.  
       - Disadvantages: are that it is difficult to use references and pointers
         correctly.  Also, heap management is complex and costly (inefficient)
   - implicit heap-dynamic 
       - Advantages: are that variables are very flexible and that they can be
         safer than explicit heap management because programmer errors are less
         common.  
       - Disadvantages: are that there is additional overhead to deal with the
         dynamic attributes and there is less error detection by the compiler.
6. What type of variables, in terms of lifetimes, are “needed” in order to
   support recursive functions? Explain why this is so.
    - Stack Dynamic variables are needed to support recursive functions because
      recursive functions need to have their own versions of local variables and
      this is conviently represented by stack dynamica variables whose lifetimes
      align with function calls.
7. Why are stack-dynamic variables generally referred to as “automatic”
   variables.
    - They are automatically allocated and deallocated upon calling a function
      and upon return to the callee scope.
8. What is meant when a language is described as “strongly typed”?
    - 6.13
    - It means that type errors are always checked for and detected either at
      compilation or during run time. 
9. What is meant by “dynamic type binding”? What are some of the advantages and
   disadvantages?
    - 5.4.2.2
    - The type of a variable is not specified in the declaration statement and
      variables are not bound to a specific type until they are assigned a
      value.  In addition, the type of a variable can change during execution.
      It is also harder to type check.
10. What is the difference between “load time” binding and “runtime” binding?
    Give an example of each.
    - Runtime binding is an association of a type or value to a variable during
      program execution whereas load time binding is when a program is loaded
      into memory to be run.
    - In javascript a variable is bound to a type during runtime
        var a = "hello";
        a = 23
    - In C++ a variable is bound to an actual physical memory location during
      load time.

11. What is meant by “type coercion”? Describe the difference between implicit
    and explicit coercion.
    - type coercion is implicit type conversion.
    - The difference between implicit and explicit is that one the compiler does
      automatically based on the operands and the other is done on purpose by
      the programmer.
12. What is the difference between a formal parameter and an actual parameter?
    - A formal parameter describes the type and name of a parameter that can be
      passed into a function whereas an actual parameter is the actual variable
      and its value used to pass in during program execution.
13. What is the difference between a positional parameter and a keyword
    parameter? What are some advantages and disadvantages of each?
    - A positional parameter is determined by its location relative to the other
      parameters passed into a function, whereas keyword parameters are named
      and can appear in any order when calling the function.
    - The advantage of using a positional parameter is that it can be concise
      when the list of values is short. It also is safe and can easily be
      checked.
    - A disadvantage of using positional parameters is that it is difficult to
      omit parameters.
    - The advantage of using keyword parameters is that it can make remembering
      the parameters easier when the list of parameters is long.  You can also
      specify parameters in any order
    - 
14. Strictly speaking, what is the difference between a procedure and a
    function?
    - A function resembles a mathematical function and ideally has no
      side-effects and exibits referential transparency.  A procedure on the
      other hand is more similar to a sub-program and may not guarentee
      referential transparency.
15. What is meant by “pass-by-value”? What are the advantages and disadvantages?
    - pass-by-value means that before a function call, a duplicate copy of the
      value is made to be passed into the function rather than just a pointer or
      reference to a memory location being passed.

    - The advantages are that it is safer, because the callee function's copy
      will not get modified. Also, it is easier to work with from a programmers
      perpective.
    - The disadvantages are that it can be slower because the entire value has
      to be copied which can be slow especially for large objects. ANYTHING
      ELSE?
    - CHECK
16. In C, the statement printf(“%f”, x); works the same way regardless of
    whether x is a float or a double. Why?
    - It treats both as a double and is able to coerce any float values to
      doubles as this is a widening operation and there is no loss of data.
17. In C, parameters are always passed by value. Yet the concept of
    “pass-by-reference” is generally used to describe how arrays and strings are
    passed to a function. Resolve the apparent discrepancy in terms of the
    difference between semantics and how semantics are implemented.
    - It is true that every function call is pass-by-value, yet strings and
      arrays are not passed in as their entire representation, rather a pointer
      to a starting memory location is passed which is still considered a
      "value" although in the function that pointer can be deferenced to get the
      full array or string.
18. In C, when an array is passed to a function and the formal parameter is not
    declared merely as a pointer to the type of data stored in the array, the
    declaration must include the number of elements in each dimension except
    one, which may be left blank. Which dimension is optional and why is it not
    necessary?
    - The inner most dimension (first) is optional.  This is because the
      compiler needs to know the size of elements so that it can perform pointer
      arithmetic on the array to get individual elements.
19. What is printed by the C statement: printf(“%s”, &(1+2)[”Hello World”]+3);
    - World
20. In C, how are arguments corresponding to an ellipsis as the formal parameter
    list handled?
    - They are converted to the desired type at runtime which often needs to be
      specified as well.  In the case of printf, the format specifiers take care
      of this job.

