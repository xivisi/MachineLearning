#ifndef TREE_BITMAP_HPP_
#define TREE_BITMAP_HPP_

#include <type.hpp>

/*
一、简介：
	位图树，简化型全B树。主要用于规则资源的二值化标记、查找、分配。
二、优缺点
	1、优点：
		①常数级时间复杂度，使用与高实时性场合；
		②用位标记，占用内存资源极低；
		③任意规模资源管理，均优于其它算法；
		③其它，待整理；
	2、缺点：
		①只能表示二值化状态；
		③其它，待整理；
三、应用样例
	1、优先级队列中，快速查找最高优先级；
	2、内存池分配算法，MMU分配等；
	3、FLSH管理的FTL层快速分配非坏块 ，或页;
	4、文件系统中，快速分配簇
*/

extern const UINT TREE_BITMAP_CNT_TOTAL[];

template <int LEVEL>
class tree_bitmap_t
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
	tree_bitmap_t();
	tree_bitmap_t();
	virtual ~tree_bitmap_t(){};
//变量
private:
protected:
	static const UINT level = LEVEL;			//树的深度，深度与管理的资源数有关， 资源数=16^level;
	struct
	{
		UINT	mode	:1;						//运行模式	1表示以16个资源对齐情况下，16个子节点都被标记为1时，其父节点值修改为1，否则为0；
												//			0表示以16个资源对齐情况下，16个子节点任意被标记为1时，其父节点值修改为1，否则为0；
	};
	UINT16	map[TREE_BITMAP_CNT_TOTAL[LEVEL]];	//位图数值，数组大小为 TREE_BITMAP_CNT_TOTAL[level]的UINT16数组；
public:
//方法
private:
protected:
public:
	void reset();
	error_t set(UINT index);	//标记序号为index的资源值为1
	error_t clear(UINT index);	//标记序号为index的资源为0
	UINT ffz();					//从低位查找，第一个值位0的BIT序号，0表示没有， 返回序号以最低位向最高位递增, 只支持模式1
	UINT ffs();					//从低位查找，第一个值位1的BIT序号，0表示没有，返回序号以最低位向最高位递增, 只支持模式0
//接口
private:
protected:
public:
};


#endif /* TREE_BITMAP_HPP_ */
