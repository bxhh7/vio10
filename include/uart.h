#pragma once
#include <defs.h>
void uart_init(u16 port, u32 baud_rate);
void uart_putchar(u16 port, u8 c);
u8 uart_getchar(u16 port);
