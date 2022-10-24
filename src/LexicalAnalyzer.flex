//import java_cup.runtime.*; uncommet if you use CUP
import java.util.ArrayList;
import java.io.File;

%%// Options of the scanner
%class Lexer	//Name
%unicode			//Use unicode
%line				//Use line counter (yyline variable)
%column			//Use character counter by line (yycolumn variable)
%type Symbol //return a Symbol EOS

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

%eofval{
    return new Symbol(LexicalUnit.EOS, yyline, yycolumn);
%eofval}


////////////////////////////////
//Extended Regular Expressions//
////////////////////////////////

AlphaUpperCase = [A-Z]
AlphaLowerCase = [a-z]
Alpha          = {AlphaUpperCase}|{AlphaLowerCase}
Numeric        = [0-9]
Number        = (([1-9]{Numeric}*)|0)
AlphaLowerCaseNumeric   = {AlphaLowerCase}|{Numeric}

Varname = {AlphaLowerCase}{AlphaLowerCaseNumeric}*
Progname = {AlphaUpperCase}{Alpha}*{AlphaLowerCase}{Alpha}*
EndOfLine      = "\r"?"\n"
Commentary1 = "::".*{EndOfLine}
Commentary2 = "%%"(.*|{EndOfLine})*"%%"


%%//Identification of tokens and actions

//Gestion des commentaires
{Commentary1}  {}
{Commentary2}  {}
//Mots clés
"BEGIN"        {listOfSymbols.add(new Symbol(LexicalUnit.BEGIN,yyline, yycolumn,yytext()));
                System.out.println(listOfSymbols.get(indexSymbols).toString());
                return listOfSymbols.get(indexSymbols++);}
"ENDIF"        {listOfSymbols.add(new Symbol(LexicalUnit.ENDIF,yyline, yycolumn,yytext()));
                System.out.println(listOfSymbols.get(indexSymbols).toString());
                return listOfSymbols.get(indexSymbols++);}
"ELSE"         {listOfSymbols.add(new Symbol(LexicalUnit.ELSE,yyline, yycolumn,yytext()));
                System.out.println(listOfSymbols.get(indexSymbols).toString());
                return listOfSymbols.get(indexSymbols++);}
"IF"           {listOfSymbols.add(new Symbol(LexicalUnit.IF,yyline, yycolumn,yytext()));
                System.out.println(listOfSymbols.get(indexSymbols).toString());
                return listOfSymbols.get(indexSymbols++);}
"THEN"         {listOfSymbols.add(new Symbol(LexicalUnit.THEN,yyline, yycolumn,yytext()));
                System.out.println(listOfSymbols.get(indexSymbols).toString());
                return listOfSymbols.get(indexSymbols++);}
"DO"           {listOfSymbols.add(new Symbol(LexicalUnit.DO,yyline, yycolumn,yytext()));
                System.out.println(listOfSymbols.get(indexSymbols).toString());
                return listOfSymbols.get(indexSymbols++);}
"END"          {listOfSymbols.add(new Symbol(LexicalUnit.END,yyline, yycolumn,yytext()));
                System.out.println(listOfSymbols.get(indexSymbols).toString());
                return listOfSymbols.get(indexSymbols++);}
"WHILE"        {listOfSymbols.add(new Symbol(LexicalUnit.WHILE,yyline, yycolumn,yytext()));
                System.out.println(listOfSymbols.get(indexSymbols).toString());
                return listOfSymbols.get(indexSymbols++);}
"PRINT"        {listOfSymbols.add(new Symbol(LexicalUnit.PRINT,yyline, yycolumn,yytext()));
                System.out.println(listOfSymbols.get(indexSymbols).toString());
                return listOfSymbols.get(indexSymbols++);}
"READ"         {listOfSymbols.add(new Symbol(LexicalUnit.READ,yyline, yycolumn,yytext()));
                System.out.println(listOfSymbols.get(indexSymbols).toString());
                return listOfSymbols.get(indexSymbols++);}
//Symbols et opérateurs
"("            {listOfSymbols.add(new Symbol(LexicalUnit.LPAREN,yyline, yycolumn,yytext()));
                System.out.println(listOfSymbols.get(indexSymbols).toString());
                return listOfSymbols.get(indexSymbols++);}
")"            {listOfSymbols.add(new Symbol(LexicalUnit.RPAREN,yyline, yycolumn,yytext()));
                System.out.println(listOfSymbols.get(indexSymbols).toString());
                return listOfSymbols.get(indexSymbols++);}
"-"            {listOfSymbols.add(new Symbol(LexicalUnit.MINUS,yyline, yycolumn,yytext()));
                System.out.println(listOfSymbols.get(indexSymbols).toString());
                return listOfSymbols.get(indexSymbols++);}
"+"            {listOfSymbols.add(new Symbol(LexicalUnit.PLUS,yyline, yycolumn,yytext()));
                System.out.println(listOfSymbols.get(indexSymbols).toString());
                return listOfSymbols.get(indexSymbols++);}
"*"            {listOfSymbols.add(new Symbol(LexicalUnit.TIMES,yyline, yycolumn,yytext()));
                System.out.println(listOfSymbols.get(indexSymbols).toString());
                return listOfSymbols.get(indexSymbols++);}
"/"            {listOfSymbols.add(new Symbol(LexicalUnit.DIVIDE,yyline, yycolumn,yytext()));
                System.out.println(listOfSymbols.get(indexSymbols).toString());
                return listOfSymbols.get(indexSymbols++);}
"="            {listOfSymbols.add(new Symbol(LexicalUnit.EQUAL,yyline, yycolumn,yytext()));
                System.out.println(listOfSymbols.get(indexSymbols).toString());
                return listOfSymbols.get(indexSymbols++);}
"<"            {listOfSymbols.add(new Symbol(LexicalUnit.SMALLER,yyline, yycolumn,yytext()));
                System.out.println(listOfSymbols.get(indexSymbols).toString());
                return listOfSymbols.get(indexSymbols++);}
">"            {listOfSymbols.add(new Symbol(LexicalUnit.GREATER,yyline, yycolumn,yytext()));
                System.out.println(listOfSymbols.get(indexSymbols).toString());
                return listOfSymbols.get(indexSymbols++);}
":="           {listOfSymbols.add(new Symbol(LexicalUnit.ASSIGN,yyline, yycolumn,yytext()));
                System.out.println(listOfSymbols.get(indexSymbols).toString());
                return listOfSymbols.get(indexSymbols++);}
","            {listOfSymbols.add(new Symbol(LexicalUnit.COMMA,yyline, yycolumn,yytext()));
                System.out.println(listOfSymbols.get(indexSymbols).toString());
                return listOfSymbols.get(indexSymbols++);}
//Expressions      
{Progname}     {listOfSymbols.add(new Symbol(LexicalUnit.PROGNAME,yyline, yycolumn,yytext()));
                System.out.println(listOfSymbols.get(indexSymbols).toString());
                return listOfSymbols.get(indexSymbols++);}
{Varname}      {listOfSymbols.add(new Symbol(LexicalUnit.VARNAME,yyline, yycolumn,yytext()));
                System.out.println(listOfSymbols.get(indexSymbols).toString());
                if(!(variablesNames.contains(yytext()))){
                    variablesNames.add(yytext());
                    listOfVariables.add(new Symbol(LexicalUnit.VARNAME,yyline, yycolumn,yytext()));
                    indexVariables++;
                    }
                return listOfSymbols.get(indexSymbols++);}
{Number}       {listOfSymbols.add(new Symbol(LexicalUnit.NUMBER,yyline, yycolumn,yytext()));
                System.out.println(listOfSymbols.get(indexSymbols).toString());
                return listOfSymbols.get(indexSymbols++);}
{EndOfLine}    {}
.              {}
