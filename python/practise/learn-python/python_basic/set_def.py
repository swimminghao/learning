#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
 @FileName:    set_def.py
 @Function:    set definition
 @Author:      Zhihe An
 @Site:        https://chegva.com
 @Time:        2021/6/29
"""

"""一、集合的定义"""

"""
    除了列表、元组和字典，集合也是python语言提供的内置数据结构之一
    
    可以把集合看做是没有存储value的字典，因此，集合的特点如下：
    (1) 集合中不可以存储重复的数据
    (2) 集合中的数据是无序的
    (3) 集合中的数据可以是任何不可变的类型，多种类型的数据可以混合存储在一个集合中
    (4) 集合可以根据需要动态地伸缩，也就是说，系统会根据需要动态地分配和回收内存，因此，在使用前无须预先声明集合的容量
    (5) 集合会浪费较大的内存
        与列表相比，集合是用空间换取了时间
"""


"""二、集合的创建"""

"""
创建集合的常见方式有两种：
1、使用花括号
    将创建的集合赋值给变量时，变量名不要取为set，因为set是集合对应的类名
"""

s = {3, 5, 9, 2, 6}
print(s)    # {2, 3, 5, 6, 9}

# 集合中重复的元素会被去除掉
print({3, 5, 3, 9, 2, 9, 3, 6}) # {2, 3, 5, 6, 9}

# 不能使用{}表示空集合，因为{}表示空字典
print(type({})) # <class 'dict'>

"""
2、调用内置函数set(类set的构造方法)
"""

print(set(range(1, 6))) # {1, 2, 3, 4, 5}
print(set([3, 5, 9, 2, 6])) # {2, 3, 5, 6, 9}
print(set((3, 5, 9, 2, 6))) # {2, 3, 5, 6, 9}
print(set('35926')) # {'5', '6', '3', '9', '2'}
print(set({3, 5, 9, 2, 6})) # {2, 3, 5, 6, 9}

# 空集合
print(set())    # set()

# 集合中重复的元素会被去除掉
print(set([3, 5, 3, 9, 2, 9, 3, 6])) # {2, 3, 5, 6, 9}


"""三、集合间的关系"""

"""
1、两个集合是否相等
    可以使用运算符==和!=进行判断
"""

s1 = {1, 3, 5, 7, 9}
s2 = {3, 7, 9, 5, 1}

print(s1 == s2)     # True
print(s1 != s2)     # False

"""
2、一个集合是否是另一个集合的子集
    可以调用方法issubset进行判断
"""

s1 = {1, 3, 5, 7, 9}
s2 = {2, 3, 6, 7, 10}
s3 = {1, 3, 5, 6, 7, 9}

print(s1.issubset(s2))  # False
print(s1.issubset(s3))  # True

"""
3、一个集合是否是另一个集合的超集
    可以调用方法issuperset进行判断
"""

print(s2.issuperset(s1))    # False
print(s3.issuperset(s1))    # True

"""
4、两个集合是否没有交集
    可以调用方法isdisjoint进行判断
"""

s1 = {1, 3, 5, 7, 9}
s2 = {2, 3, 6, 7, 10}
s3 = {2, 4, 6, 8, 10}

print(s1.isdisjoint(s2))    # False
print(s1.isdisjoint(s3))    # True