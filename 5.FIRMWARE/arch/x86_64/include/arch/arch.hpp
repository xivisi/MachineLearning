#ifndef ARCH_H_
#define ARCH_H_

#include <arch/arch_type.hpp>


#ifdef __GNUC__
	#define arch_ffs(x) __builtin_ffs(x)
	#define arch_ffz(x) __builtin_ffs(~(x))
#endif


#endif /* ARCH_H_ */
