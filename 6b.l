%{
    #include<stdio.h>
    #include "y.tab.h"
%}

%%
'#' return PRE;
int|float|char|bool|void|for|do|while|if|else|return|main { 
    printf("keyword is %s\n",yytext);
    return KEY;
    }
[+|-|*|/|=|<|>] { 
    printf("operator is %s\n",yytext);
    return OP;
    } 
[a-z A-Z][a-z A-Z 0-9]* { 
    printf("identifier is %s\n",yytext);
    return ID;
    }
[0-9]+ return DIGIT;
;
%%
