
//  https://www.pixelbeat.org/programming/gcc/static_assert.html

#define ct_assert(e) extern char (*ct_assert(void)) [sizeof(char[1 - 2*!(e)])]

