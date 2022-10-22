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
   int index = 0;
   ArrayList<Symbol> listOfVariables = new ArrayList<Symbol>();
   int indexVariables = 0;
   ArrayList<String> setOfVariables = new ArrayList<String> (); 

%}//end adding Java code
%eof{// called after scanning
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
                System.out.println(listOfSymbols.get(index).toString());
                index += 1;}
"ENDIF"        {listOfSymbols.add(new Symbol(LexicalUnit.ENDIF,yyline, yycolumn,yytext()));
                System.out.println(listOfSymbols.get(index).toString());
                index += 1;}
"ELSE"         {listOfSymbols.add(new Symbol(LexicalUnit.ELSE,yyline, yycolumn,yytext()));
                System.out.println(listOfSymbols.get(index).toString());
                index += 1;}
"IF"           {listOfSymbols.add(new Symbol(LexicalUnit.IF,yyline, yycolumn,yytext()));
                System.out.println(listOfSymbols.get(index).toString());
                index += 1;}
"THEN"         {listOfSymbols.add(new Symbol(LexicalUnit.THEN,yyline, yycolumn,yytext()));
                System.out.println(listOfSymbols.get(index).toString());
                index += 1;}
"DO"           {listOfSymbols.add(new Symbol(LexicalUnit.DO,yyline, yycolumn,yytext()));
                System.out.println(listOfSymbols.get(index).toString());
                index += 1;}
"END"          {listOfSymbols.add(new Symbol(LexicalUnit.END,yyline, yycolumn,yytext()));
                System.out.println(listOfSymbols.get(index).toString());
                index += 1;}
"WHILE"        {listOfSymbols.add(new Symbol(LexicalUnit.WHILE,yyline, yycolumn,yytext()));
                System.out.println(listOfSymbols.get(index).toString());
                index += 1;}
"PRINT"        {listOfSymbols.add(new Symbol(LexicalUnit.PRINT,yyline, yycolumn,yytext()));
                System.out.println(listOfSymbols.get(index).toString());
                index += 1;}
"READ"         {listOfSymbols.add(new Symbol(LexicalUnit.READ,yyline, yycolumn,yytext()));
                System.out.println(listOfSymbols.get(index).toString());
                index += 1;}
"\0"          {listOfSymbols.add(new Symbol(LexicalUnit.EOS,yyline, yycolumn,yytext()));
                System.out.println(listOfSymbols.get(index).toString());
                index += 1;}
//Symbols et opérateurs
"("            {listOfSymbols.add(new Symbol(LexicalUnit.LPAREN,yyline, yycolumn,yytext()));
                System.out.println(listOfSymbols.get(index).toString());
                index += 1;}
")"            {listOfSymbols.add(new Symbol(LexicalUnit.RPAREN,yyline, yycolumn,yytext()));
                System.out.println(listOfSymbols.get(index).toString());
                index += 1;}
"-"            {listOfSymbols.add(new Symbol(LexicalUnit.MINUS,yyline, yycolumn,yytext()));
                System.out.println(listOfSymbols.get(index).toString());
                index += 1;}
"+"            {listOfSymbols.add(new Symbol(LexicalUnit.PLUS,yyline, yycolumn,yytext()));
                System.out.println(listOfSymbols.get(index).toString());
                index += 1;}
"*"            {listOfSymbols.add(new Symbol(LexicalUnit.TIMES,yyline, yycolumn,yytext()));
                System.out.println(listOfSymbols.get(index).toString());
                index += 1;}
"/"            {listOfSymbols.add(new Symbol(LexicalUnit.DIVIDE,yyline, yycolumn,yytext()));
                System.out.println(listOfSymbols.get(index).toString());
                index += 1;}
"="            {listOfSymbols.add(new Symbol(LexicalUnit.EQUAL,yyline, yycolumn,yytext()));
                System.out.println(listOfSymbols.get(index).toString());
                index += 1;}
"<"            {listOfSymbols.add(new Symbol(LexicalUnit.SMALLER,yyline, yycolumn,yytext()));
                System.out.println(listOfSymbols.get(index).toString());
                index += 1;}
">"            {listOfSymbols.add(new Symbol(LexicalUnit.GREATER,yyline, yycolumn,yytext()));
                System.out.println(listOfSymbols.get(index).toString());
                index += 1;}
":="           {listOfSymbols.add(new Symbol(LexicalUnit.ASSIGN,yyline, yycolumn,yytext()));
                System.out.println(listOfSymbols.get(index).toString());
                index += 1;}
","            {listOfSymbols.add(new Symbol(LexicalUnit.COMMA,yyline, yycolumn,yytext()));
                System.out.println(listOfSymbols.get(index).toString());
                index += 1;}
//Expressions      
{Progname}     {listOfSymbols.add(new Symbol(LexicalUnit.PROGNAME,yyline, yycolumn,yytext()));
                System.out.println(listOfSymbols.get(index).toString());
                index += 1;}
{Varname}      {listOfSymbols.add(new Symbol(LexicalUnit.VARNAME,yyline, yycolumn,yytext()));
                System.out.println(listOfSymbols.get(index).toString());
                index += 1;
		if(setOfVariables.contains(yytext())){
		}
		else{
			setOfVariables.add(yytext());
			listOfVariables.add(new Symbol(LexicalUnit.VARNAME,yyline, yycolumn,yytext()));
			System.out.println( listOfVariables.get(indexVariables).getValue().toString() + " "+ listOfVariables.get(indexVariables).getLine());
			indexVariables += 1;
		}}
{Number}       {listOfSymbols.add(new Symbol(LexicalUnit.NUMBER,yyline, yycolumn,yytext()));
                System.out.println(listOfSymbols.get(index).toString());
                index += 1;}
{EndOfLine}    {}
.              {}



