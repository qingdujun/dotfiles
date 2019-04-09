" START (2019-04-06)
"
" 0. 设置不兼容vi
set nocompatible

" 1. 引入插件配置文件
"if filereadable(expand('$HOME/.vim/vimrc-plug'))
"    source $HOME/.vim/vimrc-plug
"endif

"vim-plug

call plug#begin('$HOME/.vim/plugged')

" 1. 漂亮界面显示插件
Plug 'vim-airline/vim-airline'
" 2. snips引擎
Plug 'SirVer/ultisnips'
" 3. 自定义快捷键
Plug 'honza/vim-snippets'
" 4. 多行替换
Plug 'terryma/vim-multiple-cursors'
" 5. LaTex插件
Plug 'lervag/vimtex'
" 6. 配色插件
Plug 'tomasr/molokai'
" 7. 树状目录
Plug 'scrooloose/nerdtree'
" 8. 变量查看器
Plug 'majutsushi/tagbar'
" 9. 括号补全
Plug 'Raimondi/delimitMate'
" 10. 自动补全
Plug 'Valloric/YouCompleteMe'
" 11. 语法检查 - 手动安装
" Plug 'vim-syntastic/syntastic'
" 12. Python补全器
Plug 'davidhalter/jedi-vim'

call plug#end()




" 2. 显示行号
set number 

" 3. 启用语法高亮
syntax enable

" 4. 启用相对行号
"set relativenumber

" 5. (在右下角)显示现有命令
set showcmd

" 6. 输入时显示相对括号
set noshowmatch

" 7. 使用鼠标点击
set mouse=a
" END (2019-04-06)

" START (2019-04-07)

" 8. 配置删除键(使生效)
set backspace=indent,eol,start

" 9. 设置缩进为4字节
set tabstop=4
set softtabstop=4
set shiftwidth=4

" 10. 用空格代替tab
set expandtab

" 11. 文件类型检测, 设置自动缩进
filetype plugin indent on

" 12. 设置字体
" set guifont=Courier_new:h14:b:cDEFAULT

" 13. 配色方案
" colorscheme desert

" 14. 设置主题
set background=dark
let g:molokai_original = 1
let g:rehash256 = 1
set t_Co=256
colorscheme molokai

" 15. 显示文件目录列表
map <c-l> :NERDTreeMirror<CR>
map <c-l> :NERDTreeToggle<CR>

" 16. 变量窗口
let g:tagbar_width = 30
" let g:tagbar_autopreview = 1
let g:tagbar_sort = 0
nmap <c-r> :TagbarToggle<CR>

" 17. YouCompleteMe自动补全
let g:ycm_global_ycm_extra_conf = '$HOME/.vim/plugged/YouCompleteMe/.ycm_extra_conf.py'
" let g:ycm_global_ycm_extra_conf = ''
let g:ycm_seed_identifiers_with_syntax = 1
" 设置输入触发长度
let g:ycm_min_num_of_chars_for_completion=2
" 设置语义补全触发器，这里设置为只要输入两个字符就触发
" let g:ycm_semantic_triggers =  {
"                        \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
"                        \ 'cs,lua,javascript': ['re!\w{2}'],
"                        \ }
" 禁止ycm打开函数原型预览窗口
set completeopt=menu,menuone
let g:ycm_add_preview_to_completeopt = 0
" 文件类型白名单，只有打开这里面的文件类型时才启用ycm的补全，防止打开一些比较大的非代码文件时ycm卡住
let g:ycm_filetype_whitelist = {
                        \ 'c':1,
                        \ 'cpp':1,
                        \ 'cc':1,
                        \ 'h':1,
                        \ 'hpp':1,
                        \ 'cxx':1,
                        \ 'yml':1,
                        \ 'py':1,
                        \ 'java':1,
                        \ 'conf':1,
                        \ 'tex':1,
                        \ }
" 补全完成后自动关闭预览窗口
let g:ycm_autoclose_preview_window_after_completion = 1
" 切换到非输入模式自动关闭补全窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" 禁止补全时打开预览窗口
set completeopt-=previe
" 禁止ycm显示语法诊断信息，因为我用了syntastic插件来检查语法
let g:ycm_show_diagnostics_ui = 1
" 解决ultisnips <tab>冲突
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
" 设置回车为补全确认键
let g:ycm_key_list_stop_completion = ['<CR>']
" 补全触发键
let g:ycm_key_invoke_completion = '<c-/>'
" ultisnips插件
let g:ycm_use_ultisnips_completer = 1
" 跳转到定义处
nnoremap <c-g> :YcmCompleter GoToDefinition<CR>
" 开启debug模式
" let g:ycm_log_level = 'debug'
" 字符串中输入也能补全
let g:ycm_complete_in_strings = 1
" 注释中也能补全
let g:ycm_complete_in_comments = 1
" 注释和字符串输入也纳入
let g:ycm_collect_identifiers_from_comments_and_strings = 1
" 使用syntastic语法检查器
let g:ycm_register_as_syntastic_checker = 1
" let g:ycm_path_to_python_interpreter='/usr/bin/python'
" let g:ycm_path_to_c_interpreter='/usr/bin/gcc'
" let g:ycm_path_to_cpp_interpreter='/usr/bin/g++'


" 18. 开启系统粘贴板
set clipboard+=unnamedplus

" 19. 选中复制
vmap <c-c> "+y

" 20. 粘贴
nmap <c-v> "+p

" 21. 剪切
vmap <c-x> "+d

" 22. ultisnips自定义快捷键
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" 23. Syntastic语法检测
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_error_symbol='x'
let g:syntastic_warning_symbol='!'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
" 打开时检查语法
let g:syntastic_check_on_open = 1
" 实时检查语法
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_highlighting=1
" cpp检查器
let g:syntastic_cpp_compiler = 'g++'
" c语言检查器
let g:syntastic_c_compiler = 'gcc'
" c++11支持
let g:syntastic_cpp_compiler_options = '-std=c++11'
" Python检查器
let g:syntastic_python_checkers = ['pylint']
" Tex语法检查器
let g:syntastic_tex_checkers = ['lacheck', 'text/language_check']
" 执行本条命令使插件生效
execute pathogen#infect()

" 24. Python补全插件Jedi
" if has('python3')
"    let g:loaded_youcompleteme = 1 " disables loading it! doesnt support python3
"    let g:jedi#force_py_version = 3
"    let g:pymode_python = 'python3'
" endif

" 25. vim-latex配置
" 总是生成文件名
set grepprg=grep\ -nH\ $*
" 避免文件类型检测出错e.g. plaintex
let g:tex_flavor='latex'
" Latex缩进
" set sw=2
" 自动循环浏览标签
set iskeyword+=:
" 切换为xelatex中文编译器
let g:Tex_CompileRule_pdf = 'xelatex -interaction=nonstopmode $*'
" \ll编译，\lv预览pdf
" let g:Tex_DefaultTargetFormat='pdf'
" latexmk -xelatex -pvc xxx.tex 实时预览

