%{
        #include<stdio.h>
        #include<string.h>
        void yyerror(char*);
        void Gen(char*);
        int j=0,l=0;
        char temp[50];
        extern FILE *yyin;
%}

%union {
    char *string_value;
}

%type <string_value> EXP START
%token <string_value> ID
%token <string_value> INTEGER

%%
STMT : 
        STMT START
        |
        ;
START :
        ID '=' EXP { sprintf(temp,"\n%s=%s",$1,$3); $$="t"; Gen(temp); sprintf(temp,"\tmov %s,%s",$1,$3); Gen(temp); }
        ;
EXP : 
        EXP '+' EXP {sprintf(temp,"\nt%d=%s+%s",j,$1,$3); Gen(temp);sprintf(temp,"\t mov R%d,%s | add R%d,%s | mov t%d,R%d",l,$1,l,$3,j,l);sprintf($$, "t%d", j);l++;j++;Gen(temp);}
        | EXP '-' EXP {sprintf(temp,"\nt%d=%s-%s",j,$1,$3); Gen(temp);sprintf(temp,"\tmov R%d,%s | sub R%d,%s | mov t%d,R%d",l,$1,l,$3,j,l);sprintf($$, "t%d", j);l++;j++;Gen(temp);}
        | EXP '*' EXP {sprintf(temp,"\nt%d=%s*%s",j,$1,$3); Gen(temp);sprintf(temp,"\tmov R%d,%s | mul R%d,%s | mov t%d,R%d",l,$1,l,$3,j,l);sprintf($$, "t%d", j);l++;j++;Gen(temp);}
        | ID { $$=$1; }
        | INTEGER { $$=$1; }
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
        return 1;
}