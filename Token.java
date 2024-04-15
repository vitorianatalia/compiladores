/* 
* Autores: 
*	Allan Amaral Sant'Anna Rocha (201935001) & Vitoria Natalia Caetano (201935030)
*/

public class Token {
    public int line, column;
    public TOKEN_TYPE type;
    public String lexeme;
    public Object info;
    
    public Token(TOKEN_TYPE type, String lex, Object obj ,int line, int column){
          this.type = type;
          lexeme = lex;
          info =  obj;
          this.line = line;
          this.column = column;
    }
    
    public Token(TOKEN_TYPE type, String lex,int line, int column){
          this.type = type;
          lexeme = lex;
          info =  null;
          this.line = line;
          this.column = column;
    }
    
    public Token(TOKEN_TYPE type,Object obj,int line, int column){
          this.type = type;
          lexeme = "";
          info =  obj;
          this.line = line;
          this.column = column;
    }
    
    public Token(TOKEN_TYPE type ,int line, int column){
          this.type = type;
          lexeme = "";
          info =  null;
          this.line = line;
          this.column = column;
    }

    @Override
    public String toString(){
       return "["+type+"("+line+","+ column+ ") \"" + lexeme + "\" : <" + (info == null ? "" : info.toString()) + ">]";
    }
}

 
