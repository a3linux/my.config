VIM Tip 使用点滴
================

## VIM的motion和Textobject

### Motion 就是指在VIM Normal Mode下，移动光标的动作

**Normal mode and move**

    - h,j,k,l是字符为单位（左，下，上，右）
    - w, e, b 以word为单位（word头，word尾，word头（回去back））
    - f, t, F, T 在本行上（来回）查找, f和t的区别是光标（cursor）落在的位置，f落在查找的字符上，t落在查找的字符前面，大写是反向查找
    - $, 0, ^ 行尾，行首和行头（非空字符第一个）
    - H, M, L 和 gg G 大范围的移动 （文档头，文档中间，文档尾，文档头和文档尾）
    - %  跳到匹配的括号 {} () [] 注意 中文全角不能匹配
    - 结合数字的移动，例如 2j，2H，2e, 2w, 2fa 理解这些Motion的意义
    - :help motion 查看更多Motion

### text-objects 文本对象

    - w word 词 s setence句 和 p paragraph 段 t tag 标记语言的标记
    - 各种括号和引号包括的部分
    - 用 i a 表示文本对象内部, i = inner 不关心光标位置 a = append 表示光标之后的文本对象内容
    - :help text-objects 查看更多关于text-objects

### 基本编辑命令 vim operator

基本编辑命令operator 结合motion和text-objects就可以构建强大的无需鼠标移动的编辑功能

vim的常用operator

    - c = change d = delete  s = delete then insert r = replace x = delete charactor y = yank/copy
    - :help operator 查看更多operator的文档

### Vim基本编辑的公式

    - [number] + operator + text-objects  e.g. ciw, di", 2diw
    - [number] + operator + [number] + motion e.g. dj, 2dj, 2d2j, c$

### 一些编辑命令已经结合了基本命令 + text-objects

    - C = c$  D = d$  A = $a  dd = delete the whole line(dj)

## 必须掌握的VIM原生编辑功能

    - undo - u  redo - Ctrl-r 重复上次的编辑动作 .
    - >> 缩进本行
