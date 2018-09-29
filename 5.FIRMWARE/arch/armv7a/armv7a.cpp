/*
文件：	armv7a.cpp
作者：	Li Yong
电邮：	xivisi@126.com
时间：	2018年9月11日
*/
#include <type.hpp>

UINT arch_fls(UINT8 val)
{
	UINT result;
	asm("clz %0, %1" : "=r" (result) : "r" (val&0xFF) : "cc");
	result = 32 - result;
	return result;
}

UINT arch_fls(UINT16 val)
{
	UINT result;
	asm("clz %0, %1" : "=r" (result) : "r" (val&0xFFFF) : "cc");
	result = 32 - result;
	return result;
}

UINT arch_fls(UINT32 val)
{
	UINT result;
	asm("clz %0, %1" : "=r" (result) : "r" (val) : "cc");
	result = 32 - result;
	return result;
}

UINT arch_fls(UINT val)
{
	UINT result;
	asm("clz %0, %1" : "=r" (result) : "r" (val) : "cc");
	result = 32 - result;
	return result;
}


