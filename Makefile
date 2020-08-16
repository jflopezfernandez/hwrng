
vpath %.asm src

TARGET := hwrng

all: $(TARGET)

$(TARGET): main.o
	gcc -no-pie -o $@ $^

main.o: main.asm
	nasm -Wall -g -Fdwarf -felf64 -o $@ $^

.PHONY: clean
clean:
	rm -f *.o $(TARGET)
