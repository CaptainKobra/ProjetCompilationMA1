//import java_cup.runtime.*; uncommet if you use CUP
import java.util.ArrayList;
import java.io.File;

%%// Options of the scanner
%class Lexer	//Name
%unicode			//Use unicode
%line				//Use line counter (yyline variable)
%column			//Use character counter by line (yycolumn variable)


%standalone

////////
//CODE//
////////
%init{
%init}

%{
   ArrayList<Symbol> listOfSymbols = new ArrayList<Symbol>();
   int indexSymbols = 0;
   ArrayList<Symbol> listOfVariables = new ArrayList<Symbol>();
   int indexVariables = 0;
   ArrayList<String> variablesNames = new ArrayList<String> ();  

%}

%eof{
    System.out.println( "\n" + "Variables");
    for(int i=0; i < indexVariables; i++){
    System.out.println( listOfVariables.get(i).getValue().toString() + " "+ listOfVariables.get(i).getLine());}
%eof}


////////////////////////////////
//Extended Regular Expressions//
////////////////////////////////

AlphaUpperCase = [A-Z]
AlphaLowerCase = [a-z]
Alpha          = {AlphaUpperCase}|{AlphaLowerCase}
Number        = (([1-9][0-9]*)|0)
Numeric        = [0-9]
AlphaLowerCaseNumeric   = {AlphaLowerCase}|{Numeric}

Varname = {AlphaLowerCase}{AlphaLowerCaseNumeric}*
Progname = {AlphaUpperCase}{Alpha}*{AlphaLowerCase}{Alpha}*
Commentary1 = "::".*"\n"
Commentary2 = "%%"(.|"\n")*"%%"
EndOfLine      = "\r"?"\n"

%%//Identification of tokens and actions

//Gestion des commentaires
{Commentary1}  {}
{Commentary2}  {}
//Mots clés
"BEGIN"        {listOfSymbols.add(new Symbol(LexicalUnit.BEGIN,yyline, yycolumn,yytext()));
                System.out.println(listOfSymbols.get(indexSymbols).toString());
                indexSymbols++;}
"ENDIF"        {listOfSymbols.add(new Symbol(LexicalUnit.ENDIF,yyline, yycolumn,yytext()));
                System.out.println(listOfSymbols.get(indexSymbols).toString());
                indexSymbols++;}
"ELSE"         {listOfSymbols.add(new Symbol(LexicalUnit.ELSE,yyline, yycolumn,yytext()));
                System.out.println(listOfSymbols.get(indexSymbols).toString());
                indexSymbols++;}
"IF"           {listOfSymbols.add(new Symbol(LexicalUnit.IF,yyline, yycolumn,yytext()));
                System.out.println(listOfSymbols.get(indexSymbols).toString());
                indexSymbols++;}
"THEN"         {listOfSymbols.add(new Symbol(LexicalUnit.THEN,yyline, yycolumn,yytext()));
                System.out.println(listOfSymbols.get(indexSymbols).toString());
                indexSymbols++;}
"DO"           {listOfSymbols.add(new Symbol(LexicalUnit.DO,yyline, yycolumn,yytext()));
                System.out.println(listOfSymbols.get(indexSymbols).toString());
                indexSymbols++;}
"END"          {listOfSymbols.add(new Symbol(LexicalUnit.END,yyline, yycolumn,yytext()));
                System.out.println(listOfSymbols.get(indexSymbols).toString());
                indexSymbols++;}
"WHILE"        {listOfSymbols.add(new Symbol(LexicalUnit.WHILE,yyline, yycolumn,yytext()));
                System.out.println(listOfSymbols.get(indexSymbols).toString());
                indexSymbols++;}
"PRINT"        {listOfSymbols.add(new Symbol(LexicalUnit.PRINT,yyline, yycolumn,yytext()));
                System.out.println(listOfSymbols.get(indexSymbols).toString());
                indexSymbols++;}
"READ"         {listOfSymbols.add(new Symbol(LexicalUnit.READ,yyline, yycolumn,yytext()));
                System.out.println(listOfSymbols.get(indexSymbols).toString());
                indexSymbols++;}
//Symbols et opérateurs
"("            {listOfSymbols.add(new Symbol(LexicalUnit.LPAREN,yyline, yycolumn,yytext()));
                System.out.println(listOfSymbols.get(indexSymbols).toString());
                indexSymbols++;}
")"            {listOfSymbols.add(new Symbol(LexicalUnit.RPAREN,yyline, yycolumn,yytext()));
                System.out.println(listOfSymbols.get(indexSymbols).toString());
                indexSymbols++;}
"-"            {listOfSymbols.add(new Symbol(LexicalUnit.MINUS,yyline, yycolumn,yytext()));
                System.out.println(listOfSymbols.get(indexSymbols).toString());
                indexSymbols++;}
"+"            {listOfSymbols.add(new Symbol(LexicalUnit.PLUS,yyline, yycolumn,yytext()));
                System.out.println(listOfSymbols.get(indexSymbols).toString());
                indexSymbols++;}
"*"            {listOfSymbols.add(new Symbol(LexicalUnit.TIMES,yyline, yycolumn,yytext()));
                System.out.println(listOfSymbols.get(indexSymbols).toString());
                indexSymbols++;}
"/"            {listOfSymbols.add(new Symbol(LexicalUnit.DIVIDE,yyline, yycolumn,yytext()));
                System.out.println(listOfSymbols.get(indexSymbols).toString());
                indexSymbols++;}
"="            {listOfSymbols.add(new Symbol(LexicalUnit.EQUAL,yyline, yycolumn,yytext()));
                System.out.println(listOfSymbols.get(indexSymbols).toString());
                indexSymbols++;}
"<"            {listOfSymbols.add(new Symbol(LexicalUnit.SMALLER,yyline, yycolumn,yytext()));
                System.out.println(listOfSymbols.get(indexSymbols).toString());
                indexSymbols++;}
">"            {listOfSymbols.add(new Symbol(LexicalUnit.GREATER,yyline, yycolumn,yytext()));
                System.out.println(listOfSymbols.get(indexSymbols).toString());
                indexSymbols++;}
":="           {listOfSymbols.add(new Symbol(LexicalUnit.ASSIGN,yyline, yycolumn,yytext()));
                System.out.println(listOfSymbols.get(indexSymbols).toString());
                indexSymbols++;}
","            {listOfSymbols.add(new Symbol(LexicalUnit.COMMA,yyline, yycolumn,yytext()));
                System.out.println(listOfSymbols.get(indexSymbols).toString());
                indexSymbols++;}
//Expressions      
{Progname}     {listOfSymbols.add(new Symbol(LexicalUnit.PROGNAME,yyline, yycolumn,yytext()));
                System.out.println(listOfSymbols.get(indexSymbols).toString());
                indexSymbols++;}
{Varname}      {listOfSymbols.add(new Symbol(LexicalUnit.VARNAME,yyline, yycolumn,yytext()));
                System.out.println(listOfSymbols.get(indexSymbols).toString());
                indexSymbols++;
                if(!(variablesNames.contains(yytext()))){
                    variablesNames.add(yytext());
                    listOfVariables.add(new Symbol(LexicalUnit.VARNAME,yyline, yycolumn,yytext()));
                    indexVariables++;
                    }}
{Number}       {listOfSymbols.add(new Symbol(LexicalUnit.NUMBER,yyline, yycolumn,yytext()));
                System.out.println(listOfSymbols.get(indexSymbols).toString());
                indexSymbols++;}
{EndOfLine}    {}
"\0"          {listOfSymbols.add(new Symbol(LexicalUnit.EOS,yyline, yycolumn,yytext()));
                System.out.println(listOfSymbols.get(indexSymbols).toString());
                indexSymbols++;}
.              {}



