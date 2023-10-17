#pragma once
#include <uart.h>
extern int com1_putchar(char);
#define kdebug(...) \
	do { generic_printf(com1_putchar, __VA_ARGS__); } while(0)
#define panic( ...) \
	do { kdebug( __VA_ARGS__); asm volatile("hlt"); } while(0)
