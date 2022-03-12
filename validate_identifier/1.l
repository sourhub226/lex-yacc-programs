%{ 
    #include <stdio.h> 
%}

%%
[a-zA-Z_][a-zA-Z0-9_]* {printf("Valid Identifier\n");}
[0-9_][a-zA-Z0-9_]* {printf("Invalid Identifier\n");}
[ \t\n]+ ;
. {printf("\nLex Error\n");}
%% 

int yywrap(void) { 
    return 1; 
} 

int main(){
    yylex();
}