#include <libc/stdio.h>
#include <libc/stdarg.h>
/* http://www.strudel.org.uk/itoa/ */
char* itoa(unsigned int value, char* result, int base) {
	// check that the base if valid
	if (base < 2 || base > 36) { *result = '\0'; return result; }

	char* ptr = result, *ptr1 = result, tmp_char;
	int tmp_value;

	do {
		tmp_value = value;
		value /= base;
		*ptr++ = "zyxwvutsrqponmlkjihgfedcba9876543210123456789abcdefghijklmnopqrstuvwxyz" [35 + (tmp_value - value * base)];
	} while ( value );

	// Apply negative sign
	if (tmp_value < 0) *ptr++ = '-';
	*ptr-- = '\0';
	while(ptr1 < ptr) {
		tmp_char = *ptr;
		*ptr--= *ptr1;
		*ptr1++ = tmp_char;
	}
	return result;
}

/* we will support
 * 	%s: string (char*, u8*)
 * 	%d: decimal (int, i32)
 * 	%x: hexadecimal (unsigned int, u32)
 * 	%b: binary (unsigned int, u32)
 * 	for now */

int generic_print(int(*my_putchar)(char), char* str) {
	char* c = str;
	int total = 0;
	while (*c) {
		my_putchar(*(c++));
		++total;
	}
	return total;
}
int generic_printf(int(*my_putchar)(char) , char *fmt, ...) {
	va_list ap;
	va_start(ap, fmt);
	
	int total = 0;
	char numbuf[130];
	char *stringarg;
	char *c = fmt;
	while (*c) {
		if (*c == '%') {
			++c;
			switch(*c) {
				case 'd':
				case 'i':
					itoa(va_arg(ap, int), numbuf, 10);
					total += generic_print(my_putchar, numbuf);
					break;
				case 'x':
				case 'X':
					numbuf[0] = '0';
					numbuf[1] = 'x';
					itoa(va_arg(ap, unsigned int), numbuf + 2, 16);
					total += generic_print(my_putchar, numbuf);
					break;
				case 'b':
					numbuf[0] = '0';
					numbuf[1] = 'b';
					itoa(va_arg(ap, unsigned int), numbuf + 2, 2);
					total += generic_print(my_putchar, numbuf);
				case 's':
					stringarg = va_arg(ap, char*);
					total += generic_print(my_putchar, stringarg);
					break;
			}
		} else {
			my_putchar(*c);
			total++;
		}
		c++;
	}
	return total;
}
