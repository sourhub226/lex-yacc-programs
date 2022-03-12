%{
    #include<stdio.h>
    #include<stdlib.h>
    #include"y.tab.h"
    void yyerror(char *);
    
%}

%%
"while" {return WHILE;}
[-+*=(){};] {return *yytext;}
[a-zA-Z][a-zA-Z0-9_]* {return ID;}
[0-9]+ {return NUM;}
"<" {return L;}
">" {return G;}
"<=" {return LE;}
">=" {return GE;}
"==" {return EQ;}
"!=" {return NEQ;}
"++" {return INCR;}
"--" {return DECR;}
[\n] {return NL;} 
[ \t] ;
. {yyerror("Invalid while loop");}
%%

int yywrap(){}