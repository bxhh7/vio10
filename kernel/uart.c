#include <uart.h>
#include <x86.h>
/* see https://en.wikibooks.org/wiki/Serial_Programming/8250_UART_Programming
  --- UART Registers
Address	DLAB	I/O Access	Register Name
+0		0		W			Transmitter Holding Buffer
+0		0		R			Receiver Buffer
+0		1		R/W			Divisor Latch Low Byte
+1		0		R/W			Interrupt Enable Register
+1		1		R/W			Divisor Latch High Byte
+2		x		R			Interrupt Identification Register
+2		x		W			FIFO Control Register
+3		x		R/W			Line Control Register
+4		x		R/W			Modem Control Register
+5		x		R			Line Status Register
+6		x		R			Modem Status Register
+7		x		R/W		 	Scratch Register
*/

void uart_init(u16 port, u32 baud_rate) {
	u16 divisor = 115200 / baud_rate;
	outb(port + 2, 0); /* Turn off the FIFO */
	outb(port + 3, 0x80); /* set the divisor latch access bit (7th bit)*/
	outb(port + 0, divisor & 0xff);
	outb(port + 1, divisor >> 8);
	outb(port + 3, 0x3); /* lock the divisor and select 8 data bits */
	outb(port + 4, 0x0);
	
	/* testing */
	outb(port + 4, 0x1e); /* set in loopback mode*/
	outb(port + 0, 0xee); /* write some random data in it */
	if (inb(port + 0) != 0xee) {
		/* the serial is faulty */
		/* TODO panic */
		return;
	}
	/* the serial is working correctly, set in normal operation mode */
	outb(port + 4, 0x0F);
}

void uart_putchar(u16 port, u8 c) {
	while(!(inb(port + 5) & 0x20)) {
		; /* wait for uart to be ready */
	}
	outb(port, c);
}

u8 uart_getchar(u16 port) {
	while(!(inb(port + 5) & 1))
		; /* wait til data is ready */
	return inb(port);
}
int com1_putchar(char c) {
	uart_putchar(COM1, c);
}
