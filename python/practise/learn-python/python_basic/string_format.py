#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
 @FileName:    string_format.py
 @Function:    string format
 @Author:      Zhihe An
 @Site:        https://chegva.com
 @Time:        2021/6/24
"""

"""一、格式化字符串之使用百分号作为占位符"""

"""
1、什么是格式化字符串？
    格式化字符串就是按一定格式输出的字符串
    例如：字符串'2018-18-18 18:18:18'就是一个格式化字符串，它的格式为：'年-月-日 时:分:秒'
    再例如：经过计算得到一个结果，想用一个有格式的字符串进行输出，格式为：'计算结果是：xxx'
    
    如果想得到格式化字符串，常见的方式有三种：
    (1) 使用百分号作为占位符
    (2) 使用花括号作为占位符
    (3) 使用美元符作为占位符
    
    顾名思义，占位符就是先占住一个位置的符号。在定义格式化字符串时，可以使用占位符先占住
    某些固定位置，等访问字符串的时候，再将所有的占位符替换成实际值。例如，可以定义这样的格式化字符串：
    '%Y-%m-%d %H:%M:%S'，其中，%Y、%m、%d、%H、%M和%S都是占位符，分别代表年、月、日、时、分、秒，
    在访问字符串的时候，如果给出的实际值分别是2018、08、18、18、18和18，那么得到的格式化字符串就是
    '2018-08-18 18:18:18'，如果给出的实际值分别是2019、09、19、19、19和19，那么得到的
    格式化字符串就是'2019-09-19 19:19:19'
"""

from datetime import datetime

# 2018-08-18 18-18-18
print(datetime(2018, 8, 18, 18, 18, 18).strftime('%Y-%m-%d %H-%M-%S'))
# 2019-09-19 19-19-19
print(datetime(2019, 9, 19, 19, 19, 19).strftime('%Y-%m-%d %H-%M-%S'))

"""
2、格式化字符串之使用百分号作为占位符
    常见的表示不同数据类型的占位符有：
    %s：表示字符串
    %i或%d：表示整数
    %f：表示浮点数
"""

book = '《数据结构与算法》'
s = '买了一本书：%s' % book
print(s)    # 买了一本书：《数据结构与算法》

"""
    当定义的格式化字符串中包含两个及两个以上的占位符时，必须将所有的实际值封装在元组中
"""

price = 68.88
s = '花了%f，买了一本书：%s' % (price, book)
print(s)    # 花了68.880000，买了一本书：《数据结构与算法》

"""
    如果定义的格式化字符串中的%是一个普通字符，需要使用%%对其进行转义
"""

# print('我的工作已经完成了%d%' % 80)  # ValueError: incomplete format
print('我的工作已经完成了%d%%' % 80)  # 我的工作已经完成了80%

"""
    占位符%中可以指定宽度，数字和字符串都是右对齐
"""

print('%10d' % 58)      #         58
print('%10s' % '58')    #         58

"""
    占位符%中可以指定精度    
"""

print('%.3f' % 3.1415926)   # 3.142
print('%.5s' % 'HelloWorld')   # Hello

# 同时指定宽度和精度
print('%8.3f' % 3.1415926)  #    3.142


"""二、格式化字符串之使用花括号作为占位符"""

"""
1、可以调用方法format并使用花括号作为占位符，从而得到格式化字符串
"""

book = '《数据结构与算法》'

s = '买了一本书：{}'.format(book)
print(s)    # 买了一本书：《数据结构与算法》

"""
    如果占位符{}中不指定参数，方法format的参数会按顺序依次匹配所有的占位符{}
"""

price = 68.88

s = '花了{}，买了一本书：{}'.format(price, book)
print(s)    # 花了68.88，买了一本书：《数据结构与算法》

"""
2、占位符{}中可以指定位置参数，0表示方法format的第1个参数，1表示方法format的第2个参数，...依此类推
"""

s = '花了{0}，买了一本书：{1}，只花了{0}!'.format(price, book)
print(s)    # 花了68.88，买了一本书：《数据结构与算法》，只花了68.88!

"""
3、可以在方法format中指定关键字参数的名称和值，在占位符{}中指定关键字参数的名称
"""

s = '花了{p}，买了一本书：{b}，只花了{p}!'.format(p = price, b = book)
print(s)    # 花了68.88，买了一本书：《数据结构与算法》，只花了68.88!

"""
4、占位符{}中可以使用冒号指定整数的表示形式。其中，位置参数或关键字参数的名称放在冒号前面
"""

# 十进制
print('{:d}'.format(58))    # 58
# 二进制
print('{:b}'.format(58))    # 111010
# 十六进制（a~f是小写）
print('{:x}'.format(58))    # 3a
# 十六进制（A~F是大写）
print('{:X}'.format(58))    # 3A
# 浮点数
print('{:f}'.format(58))    # 58.000000
# 使用逗号作为千位分隔符
print('{:,}'.format(12345678))    # 12,345,678

print('{0:b}'.format(58))    # 111010
print('{num:b}'.format(num = 58))    # 111010

"""
    占用符{}中还可以使用冒号指定宽度。其中，数字是右对齐，字符串是左对齐
"""

print('{:10}'.format(58))               #         58
print('{:10}'.format('58'))             # 58

print('{0:10}'.format(58))              #         58
print('{num:10}'.format(num = 58))      #         58

"""
    占位符{}中还可以使用冒号指定精度
"""

# 总共3位
print('{:.3}'.format((3.1415926)))      # 3.14
# 小数点后面3位
print('{:.3f}'.format((3.1415926)))      # 3.14

print('{:.5}'.format('HelloWorld'))     # Hello

print('{0:.3}'.format((3.1415926)))      # 3.14
print('{num:.3}'.format(num = 3.1415926))     # 3.14

# 同时指定宽度和精度
print('{:8.3f}'.format(3.1415926))      #    3.142

"""
5、占位符{}中还可以使用冒号指定其它格式
"""

from datetime import datetime
# 2018-08-18 18:18:18
print('{:%Y-%m-%d %H:%M:%S}'.format(datetime(2018, 8, 18, 18, 18, 18)))

"""
    还可以调用内置函数format得到格式化字符串，它与字符串的方法format是等价的：
    '{:m}'.format(n)等价于：format(n, 'm')
"""

print('{:b}'.format(58))    # 111010
print(format(58, 'b'))      # 111010

print('{:8.3f}'.format(3.1415926))    #    3.142
print(format(3.1415926, '8.3f'))      #    3.142


"""三、格式化字符串之使用美元符作为占位符"""

"""
    可以导入模块string中的类Template并使用美元符作为占位符，从而得到格式化字符串
"""

from string import Template

price = 68.88
book = '《数据结构与算法》'

tmpl = Template('花了$p，买了一本书：$b')

"""
1、调用方法substitute
"""
s = tmpl.substitute(p = price, b = book)
print(s)    # 花了68.88，买了一本书：《数据结构与算法》
s = tmpl.substitute({'p': price, 'b': book})
print(s)    # 花了68.88，买了一本书：《数据结构与算法》

"""
    当占位符没有匹配的实际值时，抛出KeyError
"""

# tmpl.substitute(p = price)  # KeyError: 'b'

"""
2、调用方法safe_substitute
    由方法名可知，safe_substitute比substitute更安全，当占位符没有匹配的实际值时，
    并不会抛出KeyError，而是使用占位符本身作为其实际值
"""

s = tmpl.safe_substitute(p = price)
print(s)    # 花了68.88，买了一本书：$b