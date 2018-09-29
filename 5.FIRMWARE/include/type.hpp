#ifndef TYPE_HPP_
#define TYPE_HPP_

#include <arch/arch.hpp>


typedef enum error_t
{
	ERR_NORMAL		=  0,
	ERR_NULL		= -1,
	ERR_ARGS		= -2,
	ERR_MEM			= -3,
	ERR_NONE		= -4,
	ERR_UNSUPPORT	= -5,
}error_t;

#ifndef NULL
	#define NULL 0
#endif
#define BIT_WIDTH_BYTE	8

#ifndef offsetof
	#define offsetof(TYPE, MEMBER) ((UINT)(((TYPE*)0)->MEMBER))
#endif

#include <compiler.hpp>

#endif /* TYPE_HPP_ */
