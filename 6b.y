%{
    #include<stdio.h>
    #include<stdlib.h>
    int id=0,key=0,op=0,digit=0;
    extern FILE*yyin;
%}

%token PRE KEY OP ID DIGIT 

%%
input: 
DIGIT input{digit++;}
|ID input{id++;}
|KEY input{key++;}
|OP input{op++;}
|ID {id++;}
|KEY {key++;}
|OP {op++;}
;
%%


int main(int argc,char ** argv)
{

    yyin=fopen(argv[1],"r");
    yyparse();
    printf("keyword=%d\n,identifier=%d\n,operator=%d\n,digit=%d\n",key,id,op,digit);
}
void yyerror()
{
    printf("invalid");
}
