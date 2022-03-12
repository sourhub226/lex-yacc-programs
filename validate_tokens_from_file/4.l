%{ 
    #include <stdio.h> 
%}

%% 
[+*/%-] {printf("Valid Operator\n");}
if|else|while|int|switch|for|char {printf("Valid Keyword\n");}
[-+]?[0-9]* {printf("Valid Integer\n");}
[-+]?[0-9]*[.][0-9]+ {printf("Valid Float\n");}
[a-z0-9]+@[a-z]+\.[a-z]{2,3} {printf("Valid Email\n");}
[a-zA-Z_][a-zA-Z0-9_]* {printf("Valid Identifier\n");}
[0-9_][a-zA-Z0-9_]* {printf("Invalid Identifier\n");}
[ \t\n]+ ;
%% 

int yywrap(){return(1);}

int main(){
    yyin=fopen("input.txt","r");
    yylex();
}

