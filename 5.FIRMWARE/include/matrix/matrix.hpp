#ifndef MATRIX_HPP_
#define MATRIX_HPP_

#include <type.hpp>

typedef enum matrix_ele_t
{
	MATRIX_ELE_U8		,
	MATRIX_ELE_S8		,
	MATRIX_ELE_U16		,
	MATRIX_ELE_S16		,
	MATRIX_ELE_U32		,
	MATRIX_ELE_S32		,
	MATRIX_ELE_U64		,
	MATRIX_ELE_S64		,

	MATRIX_ELE_FLOAT	,
	MATRIX_ELE_DOUBLE	,
	//
	MATRIX_ELE_UNSUPPORT
} matrix_ele_t;

const UINT MATRIX_ELE_SIZE[];

typedef struct matrix_t
{
	UINT		row;
	UINT		col;
	struct
	{
		UINT	etype:8;
		UINT	state:8;
	};
	void*		ele;
}matrix_t;

error_t matrix_init(matrix_t* mat, UINT row, UINT col, matrix_ele_t etype);
error_t matrix_copy(matrix_t* des, matrix_t* src);

#endif /* MATRIX_HPP_ */
