%{  
    #include<stdio.h>
    #include<stdlib.h>
    int yylex();
    void yyerror(char *s);
%}

%token WHILE NL L G LE GE EQ NEQ INCR DECR NUM ID

%%
program:    program start NL {printf("Valid while loop\n");}
            |
            ;
start:      WHILE '(' cond ')' '{' stmt ';' '}' 
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
stmt:       ID '=' exp
            | inc
            ;
inc:        ID INCR
            | ID DECR
            | INCR ID
            | DECR ID
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