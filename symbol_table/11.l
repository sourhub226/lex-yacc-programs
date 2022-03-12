%{
    #include<stdio.h>
    #include "y.tab.h"
    int yyval;
    int c;
%}

%%
int {return INT;}
float {return FLOAT;}
char {return CHAR;}
"," {return COMMA;}
";" {return SC;}
[a-z]+ {c = yytext[0]; yylval = c; return ID;}
\n {return NL;}
%%