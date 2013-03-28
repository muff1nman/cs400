It is difficult to recognize complex numbers within the parser with the given
syntax because complex numbers are composed of three different terminal elements
that can exist on their own. Not only that but complex numbers are only valid
based on the surrounding information.  For example it should not be possible for
two complex numbers to be side by side without a separating sum or sub token
i.e. <code>3+4i-2+5i</code>.  In this case the sentence should be parsed as a real,
operator, imaginary, operator, real, operator, and imaginary.  To summarize, it
is difficult to do this because the complex number depends on the context in
which it is found.

Doing this recognition in the lexer and even in the parser is actually quite
worthless as it provides no extra semantic value over a lex or parse session
consisting of only imaginary, real and operator values.  This is because that if
these are valid on their own they will have the same value as if they were to be
recognized as complex values. 

Yet, requirements are requirements so I would argue that the only sane course
would be to only allow implicit declarations of complex values but denoting them
in the form:

    #C(<REAL>,<REAL>)

This removes any doubt about what should be treated as complex or as just real,
operators and imaginary numbers.  This has been implemented in my lexer. Try it
out.

Also note that I have decided it is more correct to not recognize negative
numbers and instead treat them as unary sub operators in most cases except for
when within the complex idiom.
