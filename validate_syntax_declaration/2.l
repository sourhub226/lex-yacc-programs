%{ 
        #include <stdlib.h> 
        void yyerror(char *); 
        #include "y.tab.h" 
%}

%% 
"int"   {return INT;} 
"float" {return FLOAT;} 
"char"  {return CHAR;} 
[,;]    { return *yytext;}
[ \t\n]+ ;
[a-zA-Z_][a-zA-Z0-9_]* {return ID;}
. {printf("\nLex Error");}
%% 

int yywrap(void) { 
    return 1; 
} 
