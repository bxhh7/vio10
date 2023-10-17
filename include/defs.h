#pragma once
#include <ct_assert.h>

typedef unsigned char u8;
typedef signed char i8; 
typedef signed short int i16;
typedef unsigned short int u16;
typedef signed int i32;
typedef unsigned int u32;

ct_assert(sizeof(u8) == 1);
ct_assert(sizeof(i8) == 1);
ct_assert(sizeof(u16) == 2);
ct_assert(sizeof(i16) == 2);
ct_assert(sizeof(u32) == 4);
ct_assert(sizeof(i32) == 4);

#define NULL ((void*)0x0)
