/*
 * FILE:	matrix.c
 * AUTHOR:	LiYong
 * E-MAIL:	xivisi@126.com
 */
#include <matrix/matrix.hpp>
#include <stdlib.h>
#include <string.h>

const UINT MATRIX_ELE_SIZE[] =
{
	-1,
	sizeof(UINT8),	sizeof(INT8),
	sizeof(UINT16), sizeof(INT16),
	sizeof(UINT32), sizeof(INT32),
	sizeof(UINT64), sizeof(INT64),
	sizeof(float),	sizeof(double),
};

error_t matrix_init(matrix_t* mat, UINT row, UINT col, matrix_ele_t etype)
{
	UINT	size;
	assert(mat != NULL);
	assert(row > 0);
	assert(col > 0);
	assert(etype	< MATRIX_ELE_UNSUPPORT);

	memset(mat->ele, 0, sizeof(matrix_t));

	size			= col * row * MATRIX_ELE_SIZE[etype];
	mat->ele		= malloc(size);

	if(mat->ele == NULL) return ERR_MEM;

	mat->col		= col;
	mat->row		= row;
	mat->etype		= etype;
	return ERR_NORMAL;
}

error_t matrix_get_element(matrix_t* mat, UINT row, UINT col, void* val)
{
	assert(mat 			!= NULL);
	assert(mat->col 	> 0);
	assert(mat->row 	> 0);
	assert(mat->etype	< MATRIX_ELE_UNSUPPORT);

	UINT offset = col * mat->row + row;
	offset *= MATRIX_ELE_SIZE[mat->etype];

	memcpy(val, &(((UINT8*)mat->ele)[offset]), MATRIX_ELE_SIZE[mat->etype]);

	return ERR_NORMAL;
}

error_t matrix_set_element(matrix_t* mat, UINT row, UINT col, void* val)
{
	assert(mat 			!= NULL);
	assert((mat->col > 0) && (col < mat->col));
	assert((mat->row > 0) && (row < mat->row));
	assert(mat->etype	< MATRIX_ELE_UNSUPPORT);

	UINT offset = col * mat->row + row;
	offset *= MATRIX_ELE_SIZE[mat->etype];

	memcpy(&(((UINT8*)mat->ele)[offset]), val, MATRIX_ELE_SIZE[mat->etype]);

	return ERR_NORMAL;
}

#define ct_copy(dt, dp, st, sp, cnt)						\
	do{														\
		UINT i;												\
		dt*	dp_ = (dt*)dp; 									\
		st*	sp_ = (st*)sp;									\
		for(i=0; i< cnt; i++, sp++, dp++) *sp = (dt)*dp;	\
	}while(0)

error_t matrix_copy(matrix_t* d, matrix_t* s)
{
	assert(d != NULL);
	assert(s != NULL);
	assert(d->col != s->col);
	assert(d->row != s->row);

	UINT count;

	count = s->col * s->row;

	if(d->etype == s->etype)
	{
		memcpy(d->ele, s->ele, count * MATRIX_ELE_SIZE[d->etype]);
	}
	else
	{
		switch(d->etype)
		{
		case MATRIX_ELE_U8			:
			switch(s->etype)
			{
			case MATRIX_ELE_S8		: ct_copy(UINT8, d->ele, INT8, s->ele, count); 		break;
			case MATRIX_ELE_U16		: ct_copy(UINT8, d->ele, UINT16, s->ele, count); 	break;
			case MATRIX_ELE_S16		: ct_copy(UINT8, d->ele, INT16, s->ele, count); 	break;
			case MATRIX_ELE_U32		: ct_copy(UINT8, d->ele, UINT32, s->ele, count); 	break;
			case MATRIX_ELE_S32		: ct_copy(UINT8, d->ele, INT32, s->ele, count); 	break;
			case MATRIX_ELE_U64		: ct_copy(UINT8, d->ele, UINT64, s->ele, count); 	break;
			case MATRIX_ELE_S64		: ct_copy(UINT8, d->ele, INT64, s->ele, count); 	break;
			case MATRIX_ELE_FLOAT	: ct_copy(UINT8, d->ele, float, s->ele, count); 	break;
			case MATRIX_ELE_DOUBLE	: ct_copy(UINT8, d->ele, double, s->ele, count);	break;
			default					: return ERR_UNSUPPORT;								break;
			} break;
		case MATRIX_ELE_S8		:
			switch(s->etype)
			{
			case MATRIX_ELE_U8		: ct_copy(INT8, d->ele, UINT8, s->ele, count); 		break;
			case MATRIX_ELE_S8		: ct_copy(INT8, d->ele, INT8, s->ele, count); 		break;
			case MATRIX_ELE_U16		: ct_copy(INT8, d->ele, UINT16, s->ele, count); 	break;
			case MATRIX_ELE_S16		: ct_copy(INT8, d->ele, INT16, s->ele, count); 		break;
			case MATRIX_ELE_U32		: ct_copy(INT8, d->ele, UINT32, s->ele, count); 	break;
			case MATRIX_ELE_S32		: ct_copy(INT8, d->ele, INT32, s->ele, count); 		break;
			case MATRIX_ELE_U64		: ct_copy(INT8, d->ele, UINT64, s->ele, count); 	break;
			case MATRIX_ELE_S64		: ct_copy(INT8, d->ele, INT64, s->ele, count); 		break;
			case MATRIX_ELE_FLOAT	: ct_copy(INT8, d->ele, float, s->ele, count); 		break;
			case MATRIX_ELE_DOUBLE	: ct_copy(INT8, d->ele, double, s->ele, count);		break;
			default					: return ERR_UNSUPPORT;								break;
			} break;
		case MATRIX_ELE_U16		:
			switch(s->etype)
			{
			case MATRIX_ELE_U8		: ct_copy(UINT16, d->ele, UINT8, s->ele, count); 	break;
			case MATRIX_ELE_S8		: ct_copy(UINT16, d->ele, INT8, s->ele, count); 	break;
			case MATRIX_ELE_U16		: ct_copy(UINT16, d->ele, UINT16, s->ele, count); 	break;
			case MATRIX_ELE_S16		: ct_copy(UINT16, d->ele, INT16, s->ele, count); 	break;
			case MATRIX_ELE_U32		: ct_copy(UINT16, d->ele, UINT32, s->ele, count); 	break;
			case MATRIX_ELE_S32		: ct_copy(UINT16, d->ele, INT32, s->ele, count); 	break;
			case MATRIX_ELE_U64		: ct_copy(UINT16, d->ele, UINT64, s->ele, count); 	break;
			case MATRIX_ELE_S64		: ct_copy(UINT16, d->ele, INT64, s->ele, count); 	break;
			case MATRIX_ELE_FLOAT	: ct_copy(UINT16, d->ele, float, s->ele, count); 	break;
			case MATRIX_ELE_DOUBLE	: ct_copy(UINT16, d->ele, double, s->ele, count);	break;
			default					: return ERR_UNSUPPORT;								break;
			} break;
		case MATRIX_ELE_S16		:
			switch(s->etype)
			{
			case MATRIX_ELE_U8		: ct_copy(INT16, d->ele, UINT8, s->ele, count); 	break;
			case MATRIX_ELE_S8		: ct_copy(INT16, d->ele, INT8, s->ele, count); 		break;
			case MATRIX_ELE_U16		: ct_copy(INT16, d->ele, UINT16, s->ele, count); 	break;
			case MATRIX_ELE_S16		: ct_copy(INT16, d->ele, INT16, s->ele, count); 	break;
			case MATRIX_ELE_U32		: ct_copy(INT16, d->ele, UINT32, s->ele, count); 	break;
			case MATRIX_ELE_S32		: ct_copy(INT16, d->ele, INT32, s->ele, count); 	break;
			case MATRIX_ELE_U64		: ct_copy(INT16, d->ele, UINT64, s->ele, count); 	break;
			case MATRIX_ELE_S64		: ct_copy(INT16, d->ele, INT64, s->ele, count); 	break;
			case MATRIX_ELE_FLOAT	: ct_copy(INT16, d->ele, float, s->ele, count); 	break;
			case MATRIX_ELE_DOUBLE	: ct_copy(INT16, d->ele, double, s->ele, count);	break;
			default					: return ERR_UNSUPPORT;								break;
			} break;
		case MATRIX_ELE_U32		:
			switch(s->etype)
			{
			case MATRIX_ELE_U8		: ct_copy(UINT32, d->ele, UINT8, s->ele, count); 	break;
			case MATRIX_ELE_S8		: ct_copy(UINT32, d->ele, INT8, s->ele, count); 	break;
			case MATRIX_ELE_U16		: ct_copy(UINT32, d->ele, UINT16, s->ele, count); 	break;
			case MATRIX_ELE_S16		: ct_copy(UINT32, d->ele, INT16, s->ele, count); 	break;
			case MATRIX_ELE_U32		: ct_copy(UINT32, d->ele, UINT32, s->ele, count); 	break;
			case MATRIX_ELE_S32		: ct_copy(UINT32, d->ele, INT32, s->ele, count); 	break;
			case MATRIX_ELE_U64		: ct_copy(UINT32, d->ele, UINT64, s->ele, count); 	break;
			case MATRIX_ELE_S64		: ct_copy(UINT32, d->ele, INT64, s->ele, count); 	break;
			case MATRIX_ELE_FLOAT	: ct_copy(UINT32, d->ele, float, s->ele, count); 	break;
			case MATRIX_ELE_DOUBLE	: ct_copy(UINT32, d->ele, double, s->ele, count);	break;
			default					: return ERR_UNSUPPORT;								break;
			} break;
		case MATRIX_ELE_S32		:
			switch(s->etype)
			{
			case MATRIX_ELE_U8		: ct_copy(INT32, d->ele, UINT8, s->ele, count); 	break;
			case MATRIX_ELE_S8		: ct_copy(INT32, d->ele, INT8, s->ele, count); 		break;
			case MATRIX_ELE_U16		: ct_copy(INT32, d->ele, UINT16, s->ele, count); 	break;
			case MATRIX_ELE_S16		: ct_copy(INT32, d->ele, INT16, s->ele, count); 	break;
			case MATRIX_ELE_U32		: ct_copy(INT32, d->ele, UINT32, s->ele, count); 	break;
			case MATRIX_ELE_S32		: ct_copy(INT32, d->ele, INT32, s->ele, count); 	break;
			case MATRIX_ELE_U64		: ct_copy(INT32, d->ele, UINT64, s->ele, count); 	break;
			case MATRIX_ELE_S64		: ct_copy(INT32, d->ele, INT64, s->ele, count); 	break;
			case MATRIX_ELE_FLOAT	: ct_copy(INT32, d->ele, float, s->ele, count); 	break;
			case MATRIX_ELE_DOUBLE	: ct_copy(INT32, d->ele, double, s->ele, count);	break;
			default					: return ERR_UNSUPPORT;								break;
			} break;
		case MATRIX_ELE_U64		:
			switch(s->etype)
			{
			case MATRIX_ELE_U8		: ct_copy(UINT64, d->ele, UINT8, s->ele, count); 	break;
			case MATRIX_ELE_S8		: ct_copy(UINT64, d->ele, INT8, s->ele, count); 	break;
			case MATRIX_ELE_U16		: ct_copy(UINT64, d->ele, UINT16, s->ele, count); 	break;
			case MATRIX_ELE_S16		: ct_copy(UINT64, d->ele, INT16, s->ele, count); 	break;
			case MATRIX_ELE_U32		: ct_copy(UINT64, d->ele, UINT32, s->ele, count); 	break;
			case MATRIX_ELE_S32		: ct_copy(UINT64, d->ele, INT32, s->ele, count); 	break;
			case MATRIX_ELE_U64		: ct_copy(UINT64, d->ele, UINT64, s->ele, count); 	break;
			case MATRIX_ELE_S64		: ct_copy(UINT64, d->ele, INT64, s->ele, count); 	break;
			case MATRIX_ELE_FLOAT	: ct_copy(UINT64, d->ele, float, s->ele, count); 	break;
			case MATRIX_ELE_DOUBLE	: ct_copy(UINT64, d->ele, double, s->ele, count);	break;
			default					: return ERR_UNSUPPORT;								break;
			} break;
		case MATRIX_ELE_S64		:
			switch(s->etype)
			{
			case MATRIX_ELE_U8		: ct_copy(INT64, d->ele, UINT8, s->ele, count); 	break;
			case MATRIX_ELE_S8		: ct_copy(INT64, d->ele, INT8, s->ele, count); 		break;
			case MATRIX_ELE_U16		: ct_copy(INT64, d->ele, UINT16, s->ele, count); 	break;
			case MATRIX_ELE_S16		: ct_copy(INT64, d->ele, INT16, s->ele, count); 	break;
			case MATRIX_ELE_U32		: ct_copy(INT64, d->ele, UINT32, s->ele, count); 	break;
			case MATRIX_ELE_S32		: ct_copy(INT64, d->ele, INT32, s->ele, count); 	break;
			case MATRIX_ELE_U64		: ct_copy(INT64, d->ele, UINT64, s->ele, count); 	break;
			case MATRIX_ELE_S64		: ct_copy(INT64, d->ele, INT64, s->ele, count); 	break;
			case MATRIX_ELE_FLOAT	: ct_copy(INT64, d->ele, float, s->ele, count); 	break;
			case MATRIX_ELE_DOUBLE	: ct_copy(INT64, d->ele, double, s->ele, count);	break;
			default					: return ERR_UNSUPPORT;								break;
			} break;
		case MATRIX_ELE_FLOAT	:
			switch(s->etype)
			{
			case MATRIX_ELE_U8		: ct_copy(float, d->ele, UINT8, s->ele, count); 	break;
			case MATRIX_ELE_S8		: ct_copy(float, d->ele, INT8, s->ele, count); 		break;
			case MATRIX_ELE_U16		: ct_copy(float, d->ele, UINT16, s->ele, count); 	break;
			case MATRIX_ELE_S16		: ct_copy(float, d->ele, INT16, s->ele, count); 	break;
			case MATRIX_ELE_U32		: ct_copy(float, d->ele, UINT32, s->ele, count); 	break;
			case MATRIX_ELE_S32		: ct_copy(float, d->ele, INT32, s->ele, count); 	break;
			case MATRIX_ELE_U64		: ct_copy(float, d->ele, UINT64, s->ele, count); 	break;
			case MATRIX_ELE_S64		: ct_copy(float, d->ele, INT64, s->ele, count); 	break;
			case MATRIX_ELE_FLOAT	: ct_copy(float, d->ele, float, s->ele, count); 	break;
			case MATRIX_ELE_DOUBLE	: ct_copy(float, d->ele, double, s->ele, count);	break;
			default					: return ERR_UNSUPPORT;								break;
			} break;
		case MATRIX_ELE_DOUBLE	:
			switch(s->etype)
			{
			case MATRIX_ELE_U8		: ct_copy(double, d->ele, UINT8, s->ele, count); 	break;
			case MATRIX_ELE_S8		: ct_copy(double, d->ele, INT8, s->ele, count); 	break;
			case MATRIX_ELE_U16		: ct_copy(double, d->ele, UINT16, s->ele, count); 	break;
			case MATRIX_ELE_S16		: ct_copy(double, d->ele, INT16, s->ele, count); 	break;
			case MATRIX_ELE_U32		: ct_copy(double, d->ele, UINT32, s->ele, count); 	break;
			case MATRIX_ELE_S32		: ct_copy(double, d->ele, INT32, s->ele, count); 	break;
			case MATRIX_ELE_U64		: ct_copy(double, d->ele, UINT64, s->ele, count); 	break;
			case MATRIX_ELE_S64		: ct_copy(double, d->ele, INT64, s->ele, count); 	break;
			case MATRIX_ELE_FLOAT	: ct_copy(double, d->ele, float, s->ele, count); 	break;
			case MATRIX_ELE_DOUBLE	: ct_copy(double, d->ele, double, s->ele, count);	break;
			default					: return ERR_UNSUPPORT;								break;
			} break;
		default					:	return ERR_UNSUPPORT;	break;
		}
	}

	return ERR_NORMAL;
}

error_t matrix_add_driect(matrix_t* res, matrix_t* a, matrix_t* b)
{

}
