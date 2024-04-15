/* 
* Autores: 
*	Allan Amaral Sant'Anna Rocha (201935001) & Vitoria Natalia Caetano (201935030)
*/

import java.io.FileReader;
import java.io.IOException;

public class Teste{
     public static void main(String args[]) throws IOException{
          Lexer lexeme = new Lexer(new FileReader(args[0]));
          Token token = lexeme.nextToken();
          while(token != null){
              System.out.println(token.toString());
              token = lexeme.nextToken();
          }
          System.out.println("Total read tokens: ");
          System.out.println(lexeme.readedTokens());
     }
}
