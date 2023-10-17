#pragma once
#include <defs.h>

/* Generic printf, takes a function pointer `putchar` that
 * prints a charachter somewhere. this function can be used
 * both for user code and kernel code. for example we can do 
 * #define serial_printf(fmt, ..) \
 * 	genetic_printf(serial_putchar, __VA_ARGS__)  */
int generic_printf(int(*putchar)(char) , char *fmt, ...);
