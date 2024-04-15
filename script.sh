rm *.class
rm Lexer.java
java -jar jflex-full-1.8.2.jar Lexer.jflex
javac Lexer.java
javac Token.java
javac Teste.java
java -cp . Teste "$1"
