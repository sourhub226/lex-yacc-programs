%{
        #include<stdio.h>
        #include<string.h>
        char* temp[50];
%}

%token ID INT FLOAT CHAR SC NL COMMA

%%
PROGRAM: 
        PROGRAM START NL {printf("Valid Decalaration Statement.\n");}
        |
        ;
START: 
        INT INTVAR
        |FLOAT FLOATVAR
        |CHAR CHARVAR
        ;
INTVAR: 
        ID SC { sprintf(temp,"\n%c\tint\t%d",$1,sizeof(int));Gen(temp); }
        | ID COMMA INTVAR { sprintf(temp,"\n%c\tint\t%d",$1,sizeof(int));Gen(temp); }
        ;
FLOATVAR: 
        ID SC { sprintf(temp,"\n%c\tfloat\t%d",$1,sizeof(float));Gen(temp); }
        | ID COMMA FLOATVAR { sprintf(temp,"\n%c\tfloat\t%d",$1,sizeof(float));Gen(temp);}
        ;
CHARVAR: 
        ID SC { sprintf(temp,"\n%c\tchar\t%d",$1,sizeof(char));Gen(temp); }
        | ID COMMA CHARVAR { sprintf(temp,"\n%c\tchar\t%d",$1,sizeof(char));Gen(temp);}
        ;
%%

void yyerror()
{
        printf("Error\n");
}

int yywrap()
{
        return 1;
}

void Gen(char *val)
{
        FILE *fo ;
        fo=fopen("output.txt","a");
        fputs(val,fo);
        fclose(fo);
}

int main()
{
        yyparse();
}