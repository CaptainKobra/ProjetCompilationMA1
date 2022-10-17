//import java_cup.runtime.*; uncommet if you use CUP
import java.util.ArrayList;
import java.io.File;

%%// Options of the scanner
%class Lexer	//Name
%unicode			//Use unicode
%line				//Use line counter (yyline variable)
%column			//Use character counter by line (yycolumn variable)

//you can use either %cup or %standalone
//   %standalone is for a Scanner which works alone and scan a file
//   %cup is to interact with a CUP parser. In this case, you have to return
//        a Symbol object (defined in the CUP library) for each action.
//        Two constructors:
//                          1. Symbol(int id,int line, int column)
//                          2. Symbol(int id,int line, int column,Object value)
%standalone

////////
//CODE//
////////
%init{//code to execute before scanning
%init}

%{//adding Java code (methods, inner classes, ...)
   ArrayList<Symbol> listOfSymbols = new ArrayList<Symbol>();
%}

%eof{//code to execute after scanning
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
%%//Identification of tokens and actions

//Gestion des commentaires
{Commentary1}  {}
{Commentary2}  {}
//Mots clés
"BEGIN"        {System.out.println("token: "+ yytext() + "  lexical unit: BEGIN");listOfSymbols.add(new Symbol(LexicalUnit.BEGIN,yyline, yycolumn));}
"ELSE"         {System.out.println("token: "+ yytext() + "  lexical unit: ELSE");listOfSymbols.add(new Symbol(LexicalUnit.ELSE,yyline, yycolumn));}
"ENDIF"        {System.out.println("token: "+ yytext() + "  lexical unit: ENDIF");listOfSymbols.add(new Symbol(LexicalUnit.ENDIF,yyline, yycolumn));}
"IF"           {System.out.println("token: "+ yytext() + "  lexical unit: IF");listOfSymbols.add(new Symbol(LexicalUnit.IF,yyline, yycolumn));}   
"THEN"         {System.out.println("token: "+ yytext() + "  lexical unit: THEN");listOfSymbols.add(new Symbol(LexicalUnit.THEN,yyline, yycolumn));}
"DO"           {System.out.println("token: "+ yytext() + "  lexical unit: DO");listOfSymbols.add(new Symbol(LexicalUnit.DO,yyline, yycolumn));}
"END"          {System.out.println("token: "+ yytext() + "  lexical unit: END");listOfSymbols.add(new Symbol(LexicalUnit.END,yyline, yycolumn));}
"WHILE"        {System.out.println("token: "+ yytext() + "  lexical unit: WHILE");listOfSymbols.add(new Symbol(LexicalUnit.WHILE,yyline, yycolumn));}
"PRINT"        {System.out.println("token: "+ yytext() + "  lexical unit: PRINT");listOfSymbols.add(new Symbol(LexicalUnit.PRINT,yyline, yycolumn));}
"READ"         {System.out.println("token: "+ yytext() + "  lexical unit: READ");listOfSymbols.add(new Symbol(LexicalUnit.READ,yyline, yycolumn));}
"EOS"          {System.out.println("token: "+ yytext() + "  lexical unit: EOS");listOfSymbols.add(new Symbol(LexicalUnit.EOS,yyline, yycolumn));}
//Symbols et opérateurs
"("            {System.out.println("token: "+ yytext() + "  lexical unit: LPAREN");listOfSymbols.add(new Symbol(LexicalUnit.LPAREN,yyline, yycolumn));}
")"            {System.out.println("token: "+ yytext() + "  lexical unit: RPAREN");listOfSymbols.add(new Symbol(LexicalUnit.RPAREN,yyline, yycolumn));}
"-"            {System.out.println("token: "+ yytext() + "  lexical unit: MINUS");listOfSymbols.add(new Symbol(LexicalUnit.MINUS,yyline, yycolumn));}
"+"            {System.out.println("token: "+ yytext() + "  lexical unit: PLUS");listOfSymbols.add(new Symbol(LexicalUnit.PLUS,yyline, yycolumn));}
"*"            {System.out.println("token: "+ yytext() + "  lexical unit: TIMES");listOfSymbols.add(new Symbol(LexicalUnit.TIMES,yyline, yycolumn));}
"/"            {System.out.println("token: "+ yytext() + "  lexical unit: DIVIDE");listOfSymbols.add(new Symbol(LexicalUnit.DIVIDE,yyline, yycolumn));}
"="            {System.out.println("token: "+ yytext() + "  lexical unit: EQUAL");listOfSymbols.add(new Symbol(LexicalUnit.EQUAL,yyline, yycolumn));}
"<"            {System.out.println("token: "+ yytext() + "  lexical unit: SMALLER");listOfSymbols.add(new Symbol(LexicalUnit.SMALLER,yyline, yycolumn));}
">"            {System.out.println("token: "+ yytext() + "  lexical unit: GREATER");listOfSymbols.add(new Symbol(LexicalUnit.GREATER,yyline, yycolumn));}
":="           {System.out.println("token: "+ yytext() + "  lexical unit: ASSIGN");listOfSymbols.add(new Symbol(LexicalUnit.ASSIGN,yyline, yycolumn));}
","            {System.out.println("token: "+ yytext() + "  lexical unit: COMMA");listOfSymbols.add(new Symbol(LexicalUnit.COMMA,yyline, yycolumn));}
//Expressions      
{Progname}     {System.out.println("token: "+ yytext() + "  lexical unit: PROGNAME");listOfSymbols.add(new Symbol(LexicalUnit.PROGNAME,yyline, yycolumn));}
{Varname}      {System.out.println("token: "+ yytext() + "  lexical unit: VARNAME");listOfSymbols.add(new Symbol(LexicalUnit.VARNAME,yyline, yycolumn));}
{Number}       {System.out.println("token: "+ yytext() + "  lexical unit: NUMBER");listOfSymbols.add(new Symbol(LexicalUnit.NUMBER,yyline, yycolumn));}
.              {}

