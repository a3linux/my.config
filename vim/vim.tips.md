================

## 必须掌握的VIM原生编辑功能

* a, i, o, A, I, O 不同的插入 a / A 在光标之后/行尾，i/I 在光标位置/行首（非空字符） o/O 在光标行后面/前面 添加新行并插入
* p, P 在当前光标位置粘贴 / 光标位置之前粘贴
* u 撤销 U 恢复整行 C-r 重复操作 . 重复上次的motiom编辑
* \>\> 缩进本行
* 在INSERT模式下的删除 C-h 删除一个字符 C-w 删除一个word， C-u 删除当前光标至行首

## VIM的motion和Textobject

### Motion 就是指在VIM Normal Mode下，移动光标的动作

**Normal mode and move**

* h,j,k,l是字符为单位（左，下，上，右）
* w, e, b 以word为单位（word头，word尾，word头（回去back）） W, E, B Vim WORD移动， WORD定义与word的区别在于WORD表示只要字符串连续，不管是不是单词都算整个WORD，例如this#is@WORDSAMPLE, 如果以word计算，是5个（d5w会删除这个串），但是以WORD计算，是一个
* f, t, F, T 在本行上（来回）查找, f和t的区别是光标（cursor）落在的位置，f落在查找的字符上，t落在查找的字符前面，大写是反向查找
* $, 0, ^ , g\_ 行尾，行首和行头（非空字符第一个）,行尾（非空字符）
* H, M, L 和 gg G 大范围的移动 （文档头，文档中间，文档尾，文档头和文档尾）
* %  跳到匹配的括号 {} () [] 注意 中文全角不能匹配
* 结合数字的移动，例如 2j，2H，2e, 2w, 2fa 理解这些Motion的意义
* :help motion.txt 查看更多Motion

### text-objects 文本对象

* w word 词 s setence句 和 p paragraph 段 t tag 标记语言的标记
* 各种括号和引号包括的部分
* 用 i a 表示文本对象内部, i = inner 不关心光标位置 a = append 表示光标之后的文本对象内容
* :help text-objects 查看更多关于text-objects

### 基本编辑命令 vim operator

基本编辑命令operator 结合motion和text-objects就可以构建强大的无需鼠标移动的编辑功能

vim的常用operator

* c = change d = delete  s = delete then insert r = replace x = delete charactor y = yank/copy
* gU, gu, g~ 改成大写/小写/切换大小写, zf 定义折叠
* \>, \< 缩进/取消缩进
* v 是选择 ctrl-v 列模式选择
* :help operator 查看更多operator的文档

### Vim基本编辑的公式

* [number] + operator + text-objects  e.g. ciw, di", 2diw
* [number] + operator + [number] + motion e.g. dj, 2dj, 2d2j, c$, v2fe
* :help motion.txt 获取关于Vim Motion / Operator的官方联机文档

### 一些编辑命令已经结合了基本命令 + text-objects

这是一些特殊命令和等效的motion操作的例子

* C = c$
* D = d$


## Vim原生补全

* i_CTRL-N - set complete= 指定的关键字补全 :help cpt 查看更多
* i_CTRL-P
* i_CTRL-X CTRL-N - 在当前buffer构建关键字补全
* i_CTRL-X CTRL-K — 字典补全，查找字典文件中的匹配单词，组成补全列表
* i_CTRL-X CTRL-T — 分类补全，查找分类文件（thesaurus 文件）中的匹配单词，组成补全列表
* i_CTRL-X CTRL-S — 拼写建议
* i_CTRL-X CTRL-O - OmniCompletion 全能补全，通常需要设置omnifunc, :help omnifunc
* i_CTRL-X CTRL-] - Tag补全
* i_CTRL-X CTRL-F - 文件名补全
* i_CTRL-X CTRL-L - 整行补全

绝大部分补全插件自动或半自动的协助键入这些补全命令以方便完成补全，比较实用的是语法补全，一般通过定义omnifunc为指定的语言语法生成函数完成，例如python的jedi，另外比较常用的是snip补全。
