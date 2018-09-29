#ifndef ARCH_H_
#define ARCH_H_

#include <arch/arch_type.hpp>


inline UINT arch_fls(UINT8	val);
inline UINT arch_fls(UINT16	val);
inline UINT arch_fls(UINT32	val);
inline UINT arch_fls(UINT	val);

inline UINT arch_ffs(UINT8 val)	{val = val & -val; return arch_fls(val);}
inline UINT arch_ffs(UINT16 val){val = val & -val; return arch_fls(val);}
inline UINT arch_ffs(UINT32 val){val = val & -val; return arch_fls(val);}
inline UINT arch_ffs(UINT val)	{val = val & -val; return arch_fls(val);}

inline UINT arch_ffz(UINT8 val)	{val = -val; return arch_ffs(val);}
inline UINT arch_ffz(UINT16 val){val = -val; return arch_ffs(val);}
inline UINT arch_ffz(UINT32 val){val = -val; return arch_ffs(val);}
inline UINT arch_ffz(UINT val)	{val = -val; return arch_ffs(val);}

#endif /* ARCH_H_ */
