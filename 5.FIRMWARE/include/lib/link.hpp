
#ifndef LINK_HPP_
#define LINK_HPP_

#include <type.hpp>

class link_single_t
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
	link_single_t():next(NULL){}
	link_single_t(link_single_t& n):next(n){}
	virtual ~link_single_t(){};
//变量
private:
protected:
	link_single_t*	next;
public:
//方法
private:
protected:
public:
	void set_next(link_single_t& n) {assert(n !=NULL); next = n;};
	link_single_t* get_next(){return next;}
//接口
private:
protected:
public:
};

class link_double_t : public link_single_t
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
	link_double_t()
	:next(NULL)
	,prev(NULL) {}

	link_double_t(link_double_t* n, link_double_t* p=NULL)
	:next(n)
	,prev(p) {}

	virtual ~link_double_t(){};
//变量
private:
protected:
	link_double_t	*prev;
public:
//方法
private:
protected:
public:
	void set_prev(link_double_t& p) {assert(p !=NULL); prev = p;};
	link_double_t* get_prev(){return prev;}

	link_double_t* get_next(){return static_cast<link_double_t*>(next);}
//接口
private:
protected:
public:
};

class link_priority_t
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
	link_priority_t():priority((0,0)){}
	link_priority_t(UINT32 org, UINT32 curr):priority((org,curr)){}
	virtual ~link_priority_t(){};
//变量
private:
protected:
	struct
	{
	#if BIT_WIDTH_ARCH == 32
		UINT	orignal:16;
		UINT	current:16;
	#elif BIT_WIDTH_ARCH == 64
		UINT	orignal:32;
		UINT	current:32;
	#endif
	}priority;
public:
//方法
private:
protected:
public:
	void set_priority(UINT32 val) {priority.current = val;};
	UINT32 get_priority() { return priority.current; }

	void set_priority_orignal(UINT32 val){priority.orignal = val;}
	UINT32 get_priority_orignal(){ return priority.orignal;}
//接口
private:
protected:
public:
};

#endif /* LINK_HPP_ */
