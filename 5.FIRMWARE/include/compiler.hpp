#ifndef COMPILER_HPP_
#define COMPILER_HPP_

#ifdef __GNUC__
	#include "compiler-gcc.hpp"
#endif

#ifdef DEBUG
	#define assert(x)	do{if(!(x)) while(1);}while(0)
#else
	#define assert(x)
#endif

#endif /* COMPILER_HPP_ */
