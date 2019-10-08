/* LEX code to replace a word with another 
taking input from file */

/* Definition section */
/* variable replace_with and replace can be 
accessed inside rule section and main() */

%{ 
#include<stdio.h> 
#include<string.h> 

char player1 [] = "Rohit"; 
char player2 [] ="Virat";
char player3 [] ="Yuvi"; 
char score1=0;
char score2=0,score3=0,buffer[20];
int count1=0,count2=0,count3=0;
int sum1=0,sum2=0,sum3=0;
float avr1=0,avr2=0,avr3=0;
%} 

/* Rule Section */
/* Rule 1 compares the matched token with the 
word to replace and replaces with another word 
on successful match else simply writes the 
content of input file to output file */
/* Rule 2 matches everything other than string 
like whitespace, digits, special symbols etc 
and writes it to output file */

%% 
[a-zA-Z]+ { if(strcmp(yytext, "Rohit")==0) 
		 strcpy(buffer,"Rohit");
	    else if(strcmp(yytext, "Yuvi")==0)
		strcpy(buffer,"Yuvi");
	    else if(strcmp(yytext, "Virat")==0)
		strcpy(buffer,"Virat"); }	

[0-9]+	{ if(strcmp(buffer, "Rohit")==0){
		 score1=atoi(yytext);
		sum1=score1+sum1;
		count1++;}
				
	    else if(strcmp(buffer, "Yuvi")==0){
		score2=atoi(yytext);
		sum2=score2+sum2;
		count2++;}
	    else if(strcmp(buffer,"Virat")==0){
		score3=atoi(yytext);
		sum3=score3+sum3;
		count3++;  } }	 
.		 fprintf(yyout, "%s", yytext); 
%% 


int yywrap() // hey us
{ 
	return 1; 
} 

/* code section */
int main(int agrc, char **argv) 
{ 
		extern FILE *yyin; 
		
		/* open the input file 
		in read mode */
	yyin=fopen( argv[1], "r"); 	
		yylex(); 
	avr1=(sum1/(float)count1);
	avr2=((float)sum2/count2);
	avr3=(sum3/(float)count3);
	printf("Rohit total run = %d and average = %f\n", sum1 ,avr1);
	printf("Yuvi total run = %d and average = %f\n", sum2 ,avr2);
	printf("Virat total run = %d and average = %f\n", sum3 ,avr3);
} 

