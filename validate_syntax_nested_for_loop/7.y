%{  
    #include<stdio.h>
    #include<stdlib.h>
    int yylex();
    void yyerror(char *s);
%}

%token FOR NL L G LE GE EQ NEQ INCR DECR NUM ID

%%
program:    program start NL {printf("Valid nested for loop\n");}
            |
            ;
start:      FOR '(' init ';' cond ';' inc ')' '{' stmt '}'
            ;
init:       ID '=' exp
            ;
cond:       ID relop ID
            | ID relop NUM
            | NUM relop ID
            | NUM relop NUM
            ;
relop:      L
            | G
            | LE
            | GE
            | EQ
            | NEQ
            ;
inc:        ID INCR
            | ID DECR
            | INCR ID
            | DECR ID
            ;
stmt:       start
            |ID '=' exp ';'
            ;
exp:        exp '+' exp 
            | exp '-' exp 
            | exp '*' exp 
            | NUM 
            | ID
            ;

%%
void yyerror(char *s)
{
    fprintf(stderr,"%s",s);
}

int main()
{
    yyparse();
}