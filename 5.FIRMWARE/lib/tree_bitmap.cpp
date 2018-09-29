#include <lib/tree_bitmap.hpp>
#include <stdlib.h>
#include <string.h>

const UINT TREE_BITMAP_CNT_LEVEL[] =
{
	0x0,
	0x1,
	0x10,
	0x100,
	0x1000,
	0x10000,
	0x100000,
	0x1000000,
	0x10000000,
#if BIT_WIDTH_ARCH == 64
	,
	0x100000000,
	0x1000000000,
	0x10000000000,
	0x100000000000,
	0x1000000000000,
	0x10000000000000,
	0x100000000000000,
	0x1000000000000000
#endif
};

const UINT TREE_BITMAP_CNT_TOTAL[] =
{
	0x0,
	0x1,
	0x11,
	0x111,
	0x1111,
	0x11111,
	0x111111,
	0x1111111,
	0x11111111
#if BIT_WIDTH_ARCH == 64
	,
	0x111111111,
	0x1111111111,
	0x11111111111,
	0x111111111111,
	0x1111111111111,
	0x11111111111111,
	0x111111111111111,
	0x1111111111111111
#endif
};

template <int LEVEL>
tree_bitmap_t<LEVEL>::tree_bitmap_t()
:mode(0)
{
	assert(LEVEL < sizeof(TREE_BITMAP_CNT_LEVEL)/sizeof(UINT));
	memset(map, 0, sizeof(UINT16)*TREE_BITMAP_CNT_TOTAL[LEVEL]);
}

//初始化函数，将所有资源标记为0
template <int LEVEL>
void tree_bitmap_t<LEVEL>::reset()
{
	assert(LEVEL < sizeof(TREE_BITMAP_CNT_LEVEL)/sizeof(UINT));
	memset(map, 0, sizeof(UINT16)*TREE_BITMAP_CNT_TOTAL[LEVEL]);
}

//标记序号为index的资源值为1
template <int LEVEL>
error_t tree_bitmap_t<LEVEL>::set(UINT index)	//指定位置1
{
	UINT level;

	assert(index < TREE_BITMAP_CNT_LEVEL[LEVEL]);

	level = LEVEL;
	while(level)
	{
		UINT	offset_uint,
				offset_bit;
		UINT16	val_org,
				val_new,
				*val;

		level--;
		val = &map[TREE_BITMAP_CNT_TOTAL[level]];
		offset_uint = index >> 4;
		offset_bit	= index & 0xF;

		val_org = val[offset_uint];
		val_new = val_org | (1<<offset_bit);
		if(val_org == val_new) break;
		val[offset_uint] = val_new;

		if(mode)	//全1变1
		{
			if(val_new != 0xFFFF) break;
			index = offset_uint;
		}
		else	//任意一个bit为1
		{
			if(val_org) break;
			index = offset_uint;
		}
	}

	return ERR_NORMAL;
}

//标记序号为index的资源为0
template <int LEVEL>
error_t tree_bitmap_t<LEVEL>::clear(UINT index)	//指定位置0
{
	UINT level;
	assert(index < TREE_BITMAP_CNT_LEVEL[LEVEL]);

	level = LEVEL;
	while(level)
	{
		UINT	offset_uint,
				offset_bit;
		UINT16	val_org,
				val_new,
				*val;

		level--;
		val = &map[TREE_BITMAP_CNT_TOTAL[level]];
		offset_uint = index >> 4;
		offset_bit	= index & 0xF;

		val_org = val[offset_uint];
		val_new = val_org | ~(1<<offset_bit);
		if(val_org == val_new) break;
		val[offset_uint] = val_new;

		if(mode)	//全1变1
		{
			if(val_org != 0xFFFF) break;
			index = offset_uint;
		}
		else			//任意一个bit为1
		{
			if(val_new) break;
			index = offset_uint;
		}
	}
	return ERR_NORMAL;
}

template <int LEVEL>
UINT tree_bitmap_t<LEVEL>::ffz()				//从低位查找，第一个值位0的BIT序号，0表示没有， 返回序号以最低位向最高位递增
{
	UINT	level;
	UINT	offset_uint,
			offset_bit;

	assert(tb != NULL);
	assert(tb->mode == 0);

	offset_bit	= arch_ffz(map[0]);
	if(offset_bit == 0) return 0;
	offset_bit --;
	offset_uint	= 0;
	for(level=1; level<this->level; level++)
	{
		UINT16	*val;

		offset_uint = offset_bit << 4;
		val = &map[TREE_BITMAP_CNT_TOTAL[level]];

		offset_bit = arch_ffz(val[offset_uint]);
		assert(offset_bit != 0);
		offset_bit --;
	}

	return ((offset_uint<<4) + offset_bit);
}

template <int LEVEL>
UINT tree_bitmap_t<LEVEL>::ffs()				//从低位查找，第一个值位1的BIT序号，0表示没有，返回序号以最低位向最高位递增
{
	UINT	level;
	UINT	offset_uint,
			offset_bit;

	assert(tb != NULL);
	assert(tb->mode == 0);

	offset_bit	= arch_ffs(map[0]);
	if(offset_bit == 0) return 0;
	offset_bit --;
	offset_uint	= 0;
	for(level=1; level<this->level; level++)
	{
		UINT16	*val;

		offset_uint = offset_bit << 4;
		val = &map[TREE_BITMAP_CNT_TOTAL[level]];

		offset_bit = arch_ffs(val[offset_uint]);
		assert(offset_bit != 0);
		offset_bit --;
	}

	return ((offset_uint<<4)+offset_bit);
}
