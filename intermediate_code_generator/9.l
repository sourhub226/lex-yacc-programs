%{
    #include "y.tab.h"
    #include <stdio.h>
%}

%%
if {return IF;}
[\t ]+
[-+*(){}=;\n] {return *yytext;}
[a-zA-Z0-9]+ {yylval.string_value = strdup(yytext);return ID;}
">"|"<"|">="|"<="|"!="|"==" {yylval.string_value = strdup(yytext);return OP;}
%%

