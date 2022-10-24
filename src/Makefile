all:
	jflex src/LexicalAnalyzer.flex
	javac -d src/ -cp src/ src/Main.java
	jar cfe dist/part1.jar Main -C src .

testing:
		java -jar dist/part1.jar test/Factorial.fs
		java -jar dist/part1.jar test/test.fs
