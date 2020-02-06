all: main

main: main.o add.o sub.o mult.o div.o
	gcc main.o add.o sub.o mult.o div.o -o main

main.o: main.c
	gcc -c main.c

add.o: add.c
	gcc -c add.c

sub.o: sub.c
	gcc -c sub.c

mult.o: mult.c
	gcc -c mult.c

div.o: div.c
	gcc -c div.c

clean:
	rm -rf *.o

dynamic: add.c sub.c mult.c div.c
	gcc -c add.c -fpic
	gcc -c sub.c -fpic
	gcc -c mult.c -fpic
	gcc -c div.c -fpic
	gcc -shared add.o sub.o mult.o div.o -o libdyfunc.so
	make clean