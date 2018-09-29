#ifndef LIST_HPP_
#define LIST_HPP_

#include <lib/link.hpp>
#include <lib/tree_bitmap.hpp>

class list_stack_t
{
//类型
private:
protected:
public:
//常量
private:
protected:
public:
//构造、析构
private:
protected:
public:
	list_stack_t():cnt(0) ,link(NULL){}
	virtual ~list_stack_t(){};
//变量
private:
protected:
	UINT 			cnt;
	link_single_t	*link;
public:
//方法
private:
protected:
public:
	UINT* get_count(){return cnt;}
	void insert(link_single_t* link);
	link_single_t* remove();
//接口
private:
protected:
public:
};

class list_fifo_t
{
//类型
private:
protected:
public:
//常量
private:
protected:
public:
//构造、析构
private:
protected:
public:
	list_fifo_t():cnt(0) ,first(NULL) ,last(NULL){}
	virtual ~list_fifo_t(){};
//变量
private:
protected:
	UINT 			cnt;
	link_single_t	*first;
	link_single_t	*last;
public:
//方法
private:
protected:
public:
	UINT* get_count(){return cnt;}
	void insert(link_single_t* link);
	link_single_t* remove();
//接口
private:
protected:
public:
};

class list_double_t
{
//类型
private:
protected:
public:
//常量
private:
protected:
public:
//构造、析构
private:
protected:
public:
	list_double_t():cnt(0) ,link(NULL){}
	virtual ~list_double_t(){};
//变量
private:
protected:
	UINT 			cnt;
	link_double_t	*link;
public:
//方法
private:
protected:
public:
	UINT* get_count(){return cnt;}

	void insert(link_double_t* stack, INT offset);

	void insert_first(link_double_t* link);
	void insert_last(link_double_t* link);

	link_double_t* remove(INT offset);
	error_t remove(link_double_t* link);
	link_double_t* remove_first();
	link_double_t* remove_last();
//接口
private:
protected:
public:
};


#include <lib/tree_bitmap.hpp>

typedef enum list_priority_size_t
{
	LIST_PRIORITY_SIZE_DEFAULT,
	LIST_PRIORITY_SIZE_0X10,
	LIST_PRIORITY_SIZE_0x100,
	LIST_PRIORITY_SIZE_0x1000,
	LIST_PRIORITY_SIZE_0x10000,
	LIST_PRIORITY_SIZE_0x100000,
	LIST_PRIORITY_SIZE_0x1000000,
	LIST_PRIORITY_SIZE_0x10000000,
#if BIT_WIDTH_ARCH == 64
	LIST_PRIORITY_SIZE_0x100000000,
	LIST_PRIORITY_SIZE_0x1000000000,
	LIST_PRIORITY_SIZE_0x10000000000,
	LIST_PRIORITY_SIZE_0x100000000000,
	LIST_PRIORITY_SIZE_0x1000000000000,
	LIST_PRIORITY_SIZE_0x10000000000000,
	LIST_PRIORITY_SIZE_0x100000000000000,
	LIST_PRIORITY_SIZE_0x1000000000000000,
#endif
} list_priority_size_t;

typedef struct list_priority_t
{
	UINT 			cnt;
	tree_bitmap_t	map;
	///list_double_t	list[1];
}list_priority_t;

void 				list_priority_create(list_priority_t* list, list_priority_size_t size);
UINT 				list_priority_reset(list_priority_t* list);
UINT 				list_priority_count(list_priority_t* list);
UINT 				list_priority_insert(list_priority_t* list, link_priority_t* link);
link_priority_t* 	list_priority_remove(list_priority_t* list, link_priority_t* link);
error_t 			list_priority_change(list_priority_t* list, link_priority_t* link, UINT priority);
error_t 			list_priority_resume(list_priority_t* list, link_priority_t* link);
link_priority_t*	list_priority_highest(list_priority_t* list);

#endif /* LIST_HPP_ */
