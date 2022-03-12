%{
    #include "y.tab.h"
    #include <stdio.h>
%}

%%
[\t ]+ 
[-+*=\n,;(){}] { return *yytext; }
[a-zA-Z]+ { 
    yylval.string_value = strdup(yytext );
    return ID;
};
[0-9]+ { 
    yylval.string_value = strdup(yytext );
    return INTEGER;
};
%%