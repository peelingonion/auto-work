syntax on
"显示行号
set number
"检测文件的类型
filetype on
"记录历史的行数
set history=1000
"自动对齐
set autoindent
set cindent
"智能选择对齐方式
set smartindent
"tab为4个空格
set tabstop=4
"当前行之间交错时使用4个空格
set shiftwidth=4
"设置匹配模式，输入左括号会出现右括号
set showmatch
"编辑时显示光标状态
set ruler
"快速匹配
set incsearch
"修改文件自动备份
set nobackup
"""""""""""""设置开启ctags"""""""""""""
set autochdir
""""""""""""""""""""""cscope设置""""""""""""""""""
set cscopequickfix=s-,c-,d-,i-,t-,e-
if has("cscope")
	set csprg=/usr/bin/cscope
	set csto=1
	set cst
	set nocsverb
" add any database in current directory
	if filereadable("cscope.out")
		cs add cscope.out
	endif
	set csverb
endif
