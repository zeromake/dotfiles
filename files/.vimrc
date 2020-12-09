" 设置历史行数
set history=500

" 开启文件类型插件检测
filetype plugin on
filetype indent on

" 外部文件改动自动载入
set autoread
au FocusGained,BufEnter * checktime

" 设置删除键可以删除多个对齐空格
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" 搜索忽略大小写
set ignorecase

" 搜索自动优化
set smartcase

" 高亮搜索
set hlsearch

" 搜索界面设置为现代浏览器
set incsearch

" 关闭重绘
" set lazyredraw

" 高亮匹配括号
set showmatch

" 括号匹配高亮频率（1000ms）
set mat=3

" 关闭错误声音提示
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" macvim 关闭错误声音
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif

" 开启高亮
syntax enable

" 设置行号
set number

" 设置默认为 uft8
set encoding=utf8

" 设置文件为 unix 格式
set ffs=unix,dos,mac

" 关闭备份
set nobackup
set nowb
set noswapfile

" 使用 space 替换 tab
" set expandtab

" 设置 tab 长度
set shiftwidth=4
set tabstop=4

" 设置自动换行
set wrap

call plug#begin('~/.vim/plugged')
"golang lang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" 高亮主题
Plug 'altercation/vim-colors-solarized'

" 底部状态栏
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" 文件树
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'

" 语法提示
Plug 'dense-analysis/ale'

call plug#end()

" 设置主题
set background=dark
colorscheme solarized
" let g:airline_theme='simple'
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
