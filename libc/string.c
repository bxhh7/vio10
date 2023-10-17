#include <libc/libc.h>
void* memset(void *src, char c, unsigned int size) {
	for (unsigned int i = 0; i < size; i++) {
		*(char*)(src++) = c;
	}
	return src;
}
