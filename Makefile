CC=gcc -m32
AS=nasm
ASFLAGS=-D__KERNELVERBOSE__ -g -f elf32
GDB=gdb
CFLAGS=-O0 -g  -nostdinc -I./include/ -m32 -ffreestanding -fno-pie -fno-stack-limit -fno-stack-check -fno-stack-protector
#CFLAGS=-g -nostdinc -I./include/ -m32 -ffreestanding -fno-pie -fno-stack-protector
KHDRS=include/*.h
QEMU=qemu-system-i386
LIBCOBJ= \
		 libc/string.o \
		 libc/printf.o
KOBJ= \
	kernel/kmain.o \
	kernel/memory.o \
	kernel/x86.o \
	kernel/gdt.o \
	kernel/tss.o \
	kernel/interrupts.o \
	kernel/isr.o \
	kernel/uart.o \
	kernel/paging.o\
	${LIBCOBJ} \

all: kernel.elf
kernel.elf: linker.ld boot/kernel_entry.o ${KOBJ} 
	ld -melf_i386 -T $^  -o $@
qemu: kernel.elf
	$(QEMU) -m 1G -kernel kernel.elf -display sdl -serial stdio 
debug: kernel.elf
	xfce4-terminal -x ${GDB} -ex "target remote localhost:1234" kernel.elf 
	$(QEMU) -m 1G -kernel kernel.elf -display sdl -S -s -serial stdio 
%.o : %.c
	$(CC) $(CFLAGS) -c $< -o $@
%.o : %.asm
	$(AS) $(ASFLAGS) $< -o $@
clean:
	rm -rf *.elf *.o
	rm kernel/*.o
	rm boot/*.o
	rm -rf libc/*.o
