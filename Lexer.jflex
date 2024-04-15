/* 
* Autores: 
*	Allan Amaral Sant'Anna Rocha (201935001) & Vitoria Natalia Caetano (201935030)
*/


 /*  
 
 Esta seção é copiada antes da declaração da classe do analisador léxico.
  *  É nesta seção que se deve incluir imports e declaração de pacotes.
  *  Neste exemplo não temos nada a incluir nesta seção.
  */
  
%%

%unicode
%line
%column
%class  Lexer
%function nextToken
%type Token

%{
    
    /* Código arbitrário pode ser inserido diretamente no analisador dessa forma. 
     * Aqui podemos declarar variáveis e métodos adicionais que julgarmos necessários. 
     */
    private int ntk;
    
    public int readedTokens(){
       return ntk;
    }

    private Token symbol(TOKEN_TYPE t) {
        ntk++;
        return new Token(t, yyline+1, yycolumn+1);
        
    }

    private Token symbol(TOKEN_TYPE t, String s) {
        ntk++;
        return new Token(t, s, yyline+1, yycolumn+1);
        
    }
    private Token symbol(TOKEN_TYPE t, Object value) {
        ntk++;
        return new Token(t, value, yyline+1, yycolumn+1);
    }
%}

%init{
    ntk = 0; // Isto é copiado direto no construtor do lexer. 
%init}

  
  /* Agora vamos definir algumas macros */
  FimDeLinha  = \r|\n|\r\n
  Brancos     = {FimDeLinha} | [ \t\f]
  type        = [:uppercase:] [[:letter:]|[:digit:]|_]*
  identificador = [:lowercase:] [[:letter:]|[:digit:]|_]*
  int      = [:digit:] [:digit:]*
  float    = [:digit:][:digit:]*\.[:digit:][:digit:]* | \.[:digit:][:digit:]*
  char     = '(.)' | '\\r' | '\\n' | '\\t' | '\\\\' | '\\''
  LineComment = -- (.)* {FimDeLinha}
  Comment  = \{- (.)* -\} | \/\* ([^\*]|\*+[^\*/])* \*+\/
  
%state COMMENT

%%

<YYINITIAL>{
    "true"          { return symbol(TOKEN_TYPE.TRUE, yytext());}
    "false"         { return symbol(TOKEN_TYPE.FALSE, yytext());}
    "null"          { return symbol(TOKEN_TYPE.NULL, yytext());}
    "data"          { return symbol(TOKEN_TYPE.DATA, yytext());}
    "Int"           { return symbol(TOKEN_TYPE.INT, yytext());}
    "Char"          { return symbol(TOKEN_TYPE.CHAR, yytext());}
    "Bool"          { return symbol(TOKEN_TYPE.BOOL, yytext());}
    "Float"         { return symbol(TOKEN_TYPE.FLOAT, yytext());}
    "if"            { return symbol(TOKEN_TYPE.IF, yytext());}
    "else"          { return symbol(TOKEN_TYPE.ELSE, yytext());}
    "iterate"       { return symbol(TOKEN_TYPE.ITERATE, yytext());}
    "read"          { return symbol(TOKEN_TYPE.READ, yytext());}
    "print"         { return symbol(TOKEN_TYPE.PRINT, yytext());}
    "new"           { return symbol(TOKEN_TYPE.NEW, yytext());}
    {identificador} { return symbol(TOKEN_TYPE.ID_VALUE, yytext());   }
    {int}           { return symbol(TOKEN_TYPE.INT_VALUE, Integer.parseInt(yytext()) );  }
    {float}         { return symbol(TOKEN_TYPE.FLOAT_VALUE, Float.parseFloat(yytext()) );  }
    {type}          { return symbol(TOKEN_TYPE.TYPE, yytext());}
    {char}          { return symbol(TOKEN_TYPE.CHAR_VALUE, yytext());}
    "="             { return symbol(TOKEN_TYPE.EQ, yytext());  }
    ";"             { return symbol(TOKEN_TYPE.SEMI, yytext()); }
    "*"             { return symbol(TOKEN_TYPE.TIMES, yytext()); }
    "+"             { return symbol(TOKEN_TYPE.PLUS, yytext()); }
    "{"             { return symbol(TOKEN_TYPE.BRACES_OPEN, yytext());}
    "}"             { return symbol(TOKEN_TYPE.BRACES_CLOSE, yytext());}
    "("             { return symbol(TOKEN_TYPE.PARENTHESES_OPEN, yytext());}
    ")"             { return symbol(TOKEN_TYPE.PARENTHESES_CLOSE, yytext());}
    "["             { return symbol(TOKEN_TYPE.BRACKETS_OPEN, yytext());}
    "]"             { return symbol(TOKEN_TYPE.BRACKETS_CLOSE, yytext());}
    ">"             { return symbol(TOKEN_TYPE.MORE_THAN, yytext());}
    ":"             { return symbol(TOKEN_TYPE.COLON, yytext());}
    "::"            { return symbol(TOKEN_TYPE.TWO_COLON, yytext());}
    "."             { return symbol(TOKEN_TYPE.PERIOD, yytext());}
    ","             { return symbol(TOKEN_TYPE.COMMA, yytext());}
    "<"             { return symbol(TOKEN_TYPE.LESS_THAN, yytext());}
    "=="            { return symbol(TOKEN_TYPE.EQ_LOGIC, yytext());}
    "!="            { return symbol(TOKEN_TYPE.DIFFERENT, yytext());}
    "-"             { return symbol(TOKEN_TYPE.SUBTRACTION, yytext());}
    "/"             { return symbol(TOKEN_TYPE.DIVISION, yytext());}
    "%"             { return symbol(TOKEN_TYPE.MOD, yytext());}
    "&&"            { return symbol(TOKEN_TYPE.AND, yytext());}
    "!"             { return symbol(TOKEN_TYPE.NEGATION, yytext());}
    {Brancos}       { }
    {LineComment}   { }
    {Comment}       { }
}


[^]                 { throw new RuntimeException("Illegal character <"+yytext()+">"); }