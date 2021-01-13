KERNEL = kernel.mnt

AS = as
CC = gcc
LD = ld

ASFLAGS = --32
CFLAGS = -c -m32 -ffreestanding -O2
LDFLAGS = -T linker.ld -m elf_i386 -nostdlib

SRC = kernel.c
OBJ = ${SRC:.c=.o} bootloader.o

all: simpleos

simpleos:
	$(AS) $(ASFLAGS) bootloader.s -o bootloader.o
	$(CC) $(CFLAGS) $(SRC)
	$(LD) $(LDFLAGS) $(OBJ) -o $(KERNEL)

run: simpleos
	qemu-system-i386 -kernel $(KERNEL)

clean:
	rm *.o
