%{ 
        int yylex(void); 
        void yyerror(char *);
        #include<stdio.h> 
%}
 
%token INT FLOAT CHAR ID

%% 
program: 
        program STATEMENT         { printf("Valid Expression \n"); } 
        |  
        ;

STATEMENT:
        DATATYPE VARLIST ';'
        ;

DATATYPE:
        INT
        |FLOAT
        |CHAR
        ;

VARLIST:
        ID
        |ID ',' VARLIST
        ;

%% 

void yyerror(char *s) { 
   fprintf(stderr, "%s\n", s); 
} 

int main(void) { 
    yyparse(); 
    return 0; 
} 

