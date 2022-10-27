package com.wavesplatform.rideplugin.parser;

import com.intellij.lexer.FlexLexer;
import com.intellij.psi.tree.IElementType;

import static com.intellij.psi.TokenType.BAD_CHARACTER;
import static com.intellij.psi.TokenType.WHITE_SPACE;
import static com.wavesplatform.rideplugin.psi.RideTypes.*;

%%

%{
  public _RideLexer() {
    this((java.io.Reader)null);
  }
%}

%public
%class _RideLexer
%implements FlexLexer
%function advance
%type IElementType
%unicode

EOL=\R
WHITE_SPACE=\s+

BOOL=true|false
COMMENT=#.*
INTEGER=[0-9]+
WHITE_SPACE=[ \t\n\x0B\f\r]+
STRING=(\")[^\"]*\"
SQSTRING=(')[^']*'
IDENT=[a-zA-Z_][a-zA-Z0-9_]*

%%
<YYINITIAL> {
  {WHITE_SPACE}      { return WHITE_SPACE; }

  "="                { return ASSIGN; }
  "{-#"              { return LDBRACKET; }
  "#-}"              { return RDBRACKET; }
  "@"                { return AT_SYMBOL; }
  "true"             { return TRUE; }
  "false"            { return FALSE; }
  "if"               { return IF; }
  "else"             { return ELSE; }
  "unit"             { return UNIT; }
  "_"                { return UNDERSCORE; }
  "["                { return LBRACKET; }
  "]"                { return RBRACKET; }
  "{"                { return LBRACE; }
  "}"                { return RBRACE; }
  "("                { return LPAREN; }
  ")"                { return RPAREN; }
  ":"                { return COLON; }
  ","                { return COMMA; }
  "=="               { return EQ; }
  "!="               { return NOT_EQ; }
  "!"                { return BANG; }
  "+"                { return PLUS; }
  "--"               { return MINUS_MINUS; }
  "-="               { return MINUS_ASSIGN; }
  "-"                { return MINUS; }
  "||"               { return COND_OR; }
  "|="               { return BIT_OR_ASSIGN; }
  "&^="              { return BIT_CLEAR_ASSIGN; }
  "&^"               { return BIT_CLEAR; }
  "&&"               { return COND_AND; }
  "&="               { return BIT_AND_ASSIGN; }
  "&"                { return BIT_AND; }
  "|"                { return BIT_OR; }
  "*"                { return MUL; }
  "/"                { return SLASH; }
  "%"                { return PERCENT; }
  ">="               { return GREATER_OR_EQUAL; }
  "<="               { return LESS_OR_EQUAL; }
  ">"                { return GT; }
  "<"                { return LESS; }
  "."                { return DOT; }
  "++"               { return CONCAT; }
  ":+"               { return APPEND; }
  "::"               { return PREPEND; }
  "func"             { return FUNCTION; }
  "match"            { return MATCH; }
  "case"             { return CASE; }
  "strict"           { return STRICT; }
  "let"              { return LET; }
  "then"             { return THEN; }
  "FOLD"             { return FOLD_KW; }
  "nil"              { return NIL; }
  "INT"              { return INT; }
  "ASTERISK"         { return ASTERISK; }
  "base16"           { return BASE16; }
  "base58"           { return BASE58; }
  "base64"           { return BASE64; }

  {BOOL}             { return BOOL; }
  {COMMENT}          { return COMMENT; }
  {INTEGER}          { return INTEGER; }
  {WHITE_SPACE}      { return WHITE_SPACE; }
  {STRING}           { return STRING; }
  {SQSTRING}         { return SQSTRING; }
  {IDENT}            { return IDENT; }

}

[^] { return BAD_CHARACTER; }