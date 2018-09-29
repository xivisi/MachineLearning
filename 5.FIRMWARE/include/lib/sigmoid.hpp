/*
 文件：	sigmoid.hpp
 作者：	Li Yong
 电邮：	xivisi@126.com
 时间：	2018年9月17日
 */

#ifndef SIGMOID_HPP_
#define SIGMOID_HPP_

#include <type.hpp>

class sigmoid
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
	sigmoid(){}
	virtual ~sigmoid(){}
//变量
private:
protected:
public:
//方法
private:
protected:
public:
	static UINT8 get(UINT8 val);
	static UINT16 get(UINT16 val);
	static UINT32 get(UINT32 val)
	{
	}
	static float get(float val){return 1.0f/(1.0f+(float)exp(-val));};
	static double get(double val){return 1.0/(1.0+exp(-val));};
//接口
private:
protected:
public:
};

#endif /* SIGMOID_HPP_ */
