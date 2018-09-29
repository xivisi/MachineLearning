#!/usr/bin/python3 #encoding:utf-8
'''
Created on 2018年9月18日

@author: liyong
'''
import math
import matplotlib.pyplot as plt
import numpy as np
import matplotlib as mpl

mpl.rcParams['axes.unicode_minus']=False


def  sigmoid(x):
	return 1.0 / (1.0 + np.exp(-x))

def sigmoid_fpga(x):
	if x>=7.5:
		return 1
	elif x>=5.6:
		return (49*x+32389)/32768
	elif x>=4:
		return (-134*x*x+1573*x+28049)/32768
	elif x>=2.45:
		return -0.0173*x*x+0.1501*x+0.6576
	elif x>=0.5:
		return -0.0449*x*x+0.2850*x+0.491
	elif x>=0:
		return 0.2452*x +0.5005
	elif x>-0.5:
		return 1-(0.2452*(-x) +0.5005)
	elif x>-2.45:
		return 1-(-0.0449*x*x-0.2850*x+0.491)
	elif x>-4:
		return 1-(-0.0173*x*x-0.1501*x+0.6576)
	elif x>-5.6:
		return 1-(-0.0041*x*x-0.0480*x+0.856)
	elif x>7.5:
		return 1-(-0.0015*x+0.9884)
	else :
		return 0

fig = plt.figure(figsize=(6,4))
ax = fig.add_subplot(111)

x = np.linspace(-10, 10)
y = sigmoid(x)
y1 = [sigmoid_fpga(a) for a in x]
tanh = 2*sigmoid(2*x) - 1

plt.xlim(-11,11)
plt.ylim(-1.1,1.1)

ax.spines['top'].set_color('none')
ax.spines['right'].set_color('none')

ax.xaxis.set_ticks_position('bottom')
ax.spines['bottom'].set_position(('data',0))
ax.set_xticks([-10,-5,0,5,10])
ax.yaxis.set_ticks_position('left')
ax.spines['left'].set_position(('data',0))
ax.set_yticks([-1,-0.5,0.5,1])

plt.plot(x,y,label="Sigmoid",color = "blue")

plt.plot(x,y1,label="Sigmoid_FPGA",color = "grey")

plt.plot(2*x,tanh,label="Tanh", color = "red")
plt.legend()
plt.show()