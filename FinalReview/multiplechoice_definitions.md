A. Closure
    - is a subprogram and the referencing environment where it was defined 
    - pg 430
B. Lexeme
    - the lowest-level syntactic units
    - pg 115
    - note that 
C. Syntactical analysis
    - See Parser.
    - What is the difference?
D. First class function
    - functions are treated like regular variables and is required to support
      higher order functions in a language
    - <a href="http://en.wikipedia.org/wiki/First-class_function">Wikipedia</a>
E. Currying
    - Takes a function that requires more than one argument and returns a new
      function that requires one (or possibly just less) arguments
    - pg 706
F. Right-most derivation
    - pg 120
    - see Left-most derivation
G. Token
    - A category of possible Lexemes
    - pg 115
H. Sentence
    - pg 115
    - also called a statement
    - the strings of a language.
    - only composed of lexemes
I. Parser
    - pg 177
    - also called syntax analyzers
    - Checks the input program to see if it is syntacically correct
    - Produces a parse tree which can then be used for translation.
J. Lexer
    - pg 170, 198, 25
    - A lexical analyzer is a pattern matcher that isolates the small-scale
      parts of a program, which are called lexemes
    - The lexical analyzer gathers the characters of the source program into
      lexical units. The lexical units of a program are identifiers, special
      words, operators, and punctuation symbols. The lexical analyzer ignores
      comments in the source program because the compiler has no use for them.
K. Finite automaton
    - pg 171
    - A state transition diagram, or just state diagram, is a directed graph.
      The nodes of a state diagram are labeled with state names. The arcs are
      labeled with the input characters that cause the transitions among the
      states. An arc may also include actions the lexical analyzer must perform
      when the transition is taken. State diagrams of the form used for lexical
      analyzers are representations of a class of mathematical machines called
      finite automata. Finite automata can be designed to recognize members of a
      class of languages called regular languages. Regular grammars are
      generative devices for regular languages. The tokens of a programming
      language are a regular language, and a lexical analyzer is a finite
      automaton.
    - pg 117
    - Two of these grammar classes, named context-free and regular, turned out
      to be useful for describing the syntax of programming languages. The forms
      of the tokens of programming languages can be described by regular
      grammars. The syntax of whole programming languages, with minor
      exceptions, can be described by context-free grammars.
L. Regular grammar
    - see Finite Automaton
M. Context-free grammar
    - pg 117
    - Two of these grammar classes, named context-free and regular, turned out
      to be useful for describing the syntax of programming languages. The forms
      of the tokens of programming languages can be described by regular
      grammars. The syntax of whole programming languages, with minor
      exceptions, can be described by context-free grammars.
    - pg 118
    - It is remarkable that BNF is nearly identical to Chomsky’s generative
      devices for context-free languages, called context-free grammars. In the
      remainder of the chapter, we refer to context-free grammars simply as
      grammars. Furthermore, the terms BNF and grammar are used
      interchangeably.
N. Pushdown automaton
    - pg 193
    - see todo
O. Production rule
    - pg 117
    - A metalanguage is a language that is used to describe another language.
      BNF is a metalanguage for programming languages. BNF uses abstractions for
      syntactic structures. A simple Java assignment statement, for example,
      might be represented by the abstraction <assign> (pointed brackets are
      often used to delimit names of abstractions). The actual definition of
      <assign> can be given by 

            <assign> → <var> = <expression>

      The text on the left side of the arrow, which is aptly called the
      left-hand side (LHS), is the abstraction being defined. The text to the
      right of the arrow is the definition of the LHS. It is called the
      right-hand side (RHS) and con- sists of some mixture of tokens, lexemes,
      and references to other abstractions. (Actually, tokens are also
      abstractions.) Altogether, the definition is called a rule, or production.
      In the example rule just given, the abstractions <var> and <expression>
      obviously must be defined for the <assign> definition to be useful.
P. Higher order function
    - One that accepts a function as an argument or returns a function.
Q. Lexical scope
    - search powerpoints?
R. Regular expression
    - pattern matching
S. Pairwise-disjoint
    - see todo
    - pg 188
T. Alphabet
    - set of characters that can be used in the language
U. Lexical analysis
    - TODO
V. Referential transparency
    - 7.2.2.2
    - pg 327
    - any two expressions in the program that have the same value can be
      substituted for one another anywhere in the program, without affecting the
      action of the program. The value of a referentially transparent function
      depends entirely on its parameters.
    - Furthermore, the value of the function cannot depend on the order in which
      its parameters are evaluated.
X. Grammatical ambiguity
    - A grammar that generates a sentential form for which there are two or more
      distinct parse trees is said to be ambiguous
Y. Left-most derivation
    - pg 120
    - the replaced nonterminal is always the left-most nontermianl in the
      previous line.
Z. Dynamic scope
    - 5.5.6
    - see todo
