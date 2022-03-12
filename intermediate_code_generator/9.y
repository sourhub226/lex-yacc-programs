%{
        #include<stdio.h>
        #include<string.h>
        void yyerror(char*);
        void Gen(char*);
        char temp[50];
        int i=0;
        int j=0;
%}

%union
{
        char *string_value;
}

%type <string_value> EXP
%type <string_value> COND
%type <string_value> START
%type <string_value> STMT
%token <string_value> ID
%token <string_value> OP
%token IF

%%
START : 
        IF '(' COND ')' '{' STMT '}' { sprintf(temp,"\nl%d=if(%s){%s}",i,$3,$6); $$="t";i++;Gen(temp); }
        ;
STMT :
        START
        |ID '=' EXP ';' STMT { sprintf(temp,"\nt%d=%s=%s",j,$1,$3); sprintf($$, "t%d", j); j++; Gen(temp); }
        |
        ;
EXP : 
        EXP '+' EXP { sprintf(temp,"\nt%d=%s+%s",j,$1,$3); sprintf($$, "t%d", j); j++; Gen(temp); }
        | EXP '-' EXP { sprintf(temp,"\nt%d=%s-%s",j,$1,$3); sprintf($$, "t%d", j); j++; Gen(temp); }
        | EXP '*' EXP { sprintf(temp,"\nt%d=%s*%s",j,$1,$3); sprintf($$, "t%d", j); j++; Gen(temp); }
        | ID { $$=$1; }
        ;
COND :
        ID OP ID { sprintf(temp,"\nt%d=%s%s%s",j,$1,$2,$3);sprintf($$, "t%d", j); j++; Gen(temp); }
        ;
%%

void Gen(char *val)
{
        FILE *f;
        f=fopen("output.txt","a");
        fputs(val,f);
        fclose(f);
}

int yywrap() { return 1; }

void yyerror(char *s)
{
        return;
}

int main() {
        yyparse();
}