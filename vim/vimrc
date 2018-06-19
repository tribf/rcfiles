" name      : ~/.vimrc for tribf
" author    : tribf <tribf@tribf.com>
" _______________
" < Tr!BF vimrc >
" ---------------
"      \                    / \  //\
"       \    |\___/|      /   \//  \\
"            /0  0  \__  /    //  | \ \
"           /     /  \/_/    //   |  \  \
"           @_^_@'/   \/_   //    |   \   \
"           //_^_/     \/_ //     |    \    \
"        ( //) |        \///      |     \     \
"      ( / /) _|_ /   )  //       |      \     _\
"    ( // /) '/,_ _ _/  ( ; -.    |    _ _\.-~        .-~~~^-.
"  (( / / )) ,-{        _      `-.|.-~-.           .~         `.
" (( // / ))  '/\      /                 ~-. _ .-~      .-~^-.  \
" (( /// ))      `.   {            }                   /      \  \
"  (( / ))     .----~-.\        \-'                 .~         \  `. \^-.
"             ///.----..>        \             _ -~             `.  ^-`  ^-_
"               ///-._ _ _ _ _ _ _}^ - - - - ~                     ~-- ,.-~
"                                                                  /.-~


let mapleader=";"           " set <Leader> to ;
autocmd BufWritePost $MYVIMRC source $MYVIMRC " auto reload .vimrc after modification

set nocompatible            " be iMproved, required
filetype off                " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"-- Let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'

"-- Define bundles via Github repos
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'majutsushi/tagbar'
Plugin 'jiangmiao/auto-pairs'
Plugin 'minibufexpl.vim'
Plugin 'taglist.vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

Bundle 'Valloric/YouCompleteMe'
Bundle 'vim-scripts/ctags.vim'
Bundle 'scrooloose/syntastic'
Bundle 'christoomey/vim-run-interactive'

call vundle#end()           " required by Vundle
filetype plugin indent on   " required by Vundle



"------------------------------------------------------------------------------
"-- Color scheme
"------------------------------------------------------------------------------
colorscheme molokai
highlight NonText guibg=#060606
highlight Folded  guibg=#0A0A0A guifg=#9090D0
let g:molokai_original = 1
"colorscheme ron         " elflord ron peachpuff default /usr/share/vim/vim74/colors
"hi Comment ctermfg = cyan

"------------------------------------------------------------------------------
"-- Softtabs, 4 spaces
"------------------------------------------------------------------------------
set tabstop=4           " tab键的宽度
set shiftwidth=4        " 统一缩进为4
set shiftround
set expandtab           " 不要用空格替代制表符
set smarttab
set softtabstop=4


"------------------------------------------------------------------------------
"-- Display extra whitespace
"------------------------------------------------------------------------------
set list listchars=tab:»·,trail:·


"------------------------------------------------------------------------------
"-- Make it obvious where 80 characters is
"------------------------------------------------------------------------------
set textwidth=80
set colorcolumn=+1

"------------------------------------------------------------------------------
"-- Enable line number
"------------------------------------------------------------------------------
set number
set numberwidth=5

set nobackup
set cursorline
"set smartindent        " 智能对齐
"set autoindent         " 自动对齐
set confirm             " 在处理未保存或只读文件的时候，弹出确认框

set hlsearch            " 搜素高亮
set incsearch           " 搜索逐渐高亮
set ignorecase          " 搜索忽略大小写


"------------------------------------------------------------------------------
"-- Highlight current line
"------------------------------------------------------------------------------
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn
set scrolloff=3         " 光标移动到buffer的顶部和底部时保持3行的距离

set autowrite           " 在切换buffer时自动保存当前文件
set wildmenu            " 增强模式中的命令行自动完成操作
set whichwrap=b,s,<,>,[,] " 开启normal 或visual模式下的backspace键空格键，左右方向键,insert或replace模式下的左方向键，右方向键的跳行功能
"set hidden             " hide buffers when they are abandoned
set mouse=a             " Enable mouse usage (all modes)

"------------------------------------------------------------------------------
"-- command line setting
"------------------------------------------------------------------------------
set showcmd             " 在状态行显示目前所执行的命令，未完成的指令片段也会显示出来
set showmode
set history=500         " set command history to 500
set encoding=utf-8
set fileencodings=utf-8,bg18030,gbk,gb2312,big5 " set fileencodings


"------------------------------------------------------------------------------
"-- status setting
"------------------------------------------------------------------------------
set laststatus=1        " 总是显示状态行
set ruler               " 在编辑过程中，在右下角显示光标位置的状态行


"------------------------------------------------------------------------------
"-- key map setting
"------------------------------------------------------------------------------
imap kj <Esc>

if has("syntax")
    syntax on
endif


"------------------------------------------------------------------------------
"-- YCM setting
"------------------------------------------------------------------------------
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_confirm_extra_conf=0                                  " 关闭加载.ycm_extra_conf.py提示
let g:ycm_min_num_of_chars_for_completion=2                     " 从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0                                      " 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1                        " 语法关键字补全
let g:ycm_complete_in_comments = 1                              " 在注释输入中也能补全
let g:ycm_complete_in_strings = 1                               " 在字符串输入中也能补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0     " 注释和字符串中的文字也会被收入补全
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

nmap <F4> :YcmDiags<CR>
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
nnoremap <leader>lo :lopen<CR>                                  " open locationlist
nnoremap <leader>lc :lclose<CR>                                 " close locationlist
inoremap <leader><leader> <C-x><C-o>"
inoremap <leader><leader> <C-x><C-o>

let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>


"-- Run commands that require an interactive shell
nnoremap <Leader>r :RunInInteractiveShell<space>


"------------------------------------------------------------------------------
"-- NERDtree setting --
"------------------------------------------------------------------------------
let g:NERDTree_title="[NERDTree]"
let NERDTreeMinimalUI=1
let NERDTreeQuitOnOpen=1            "打开文件时关闭树
let NERDTreeShowBookmarks=1         "显示书签
autocmd vimenter * if !argc() | NERDTree | endif " 自动打开 nerd 当没有打开任何文件时
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif  " 仅剩下 nerd 时关闭 vim

map <leader>ne :NERDTreeToggle<CR>


"------------------------------------------------------------------------------
"-- Tagbar setting
"------------------------------------------------------------------------------
let g:tagbar_width=35
let g:tagbar_autofocus=1
map <leader>tb :TagbarToggle<CR>


"------------------------------------------------------------------------------
"-- TagList setting
"------------------------------------------------------------------------------
let Tlist_Use_Right_Window=1            "taglist 显示在右侧
let Tlist_Exit_OnlyWindow=1             "taglist 只剩下一个窗口时，自动关闭
let Tlist_File_Fold_Auto_Close=1

map <leader>tl :TlistToggle<cr>
nnoremap ev :vsplit $MYVIMRC
nnoremap sv :source $MYVIMRC
nnoremap <leader>ma :set mouse=a<cr>
nnoremap <leader>mu :set mouse=<cr>


"------------------------------------------------------------------------------
"-- WinManager setting
"------------------------------------------------------------------------------
"let g:winManagerWindowLayout='NERDTree|TagList,BufExplorer'
let g:winManagerWindowLayout='FileExplorer|TagList' " set the plugins to be managed
let g:winManagerWidth = 30                          " 设置 winmanager 的宽度，默认为25
"let g:persistentBehaviour=0                        " when all file is close, vim exit
let g:AutoOpenWinManager = 1                        " 在进入 vim 时自动打开 winmanager
nmap <leader>wm :WMToggle<CR>


"------------------------------------------------------------------------------
" -- MiniBufferExplorer
"------------------------------------------------------------------------------
let g:miniBufExplMapWindowNavVim = 1                " let Ctrl+h/j/k/l to jump among windows
let g:miniBufExplMapWindowNavArrows = 1             " let Ctrl+arrows to jump among windows
let g:miniBufExplMapCTabSwitchBufs = 1              " Ctrl+tab Ctrl+Shift+tab switch the buffers
"let g:miniBufExplMapCTabSwitchWindows = 1          " Ctrl+tab Ctrl+Shift+tab switch the buffers
let g:miniBufExplModSelTarget = 1                   " do not open selected buffer in uneditable window

nmap <leader>mmbe :MiniBufExplorer<CR>
nmap <leader>mmbc :CMiniBufExplorer<CR>
nmap <leader>mmbu :UMiniBufExplorer<CR>
nmap <leader>mmbt :TMiniBufExplorer<CR>


"------------------------------------------------------------------------------
"-- fold setting
"------------------------------------------------------------------------------
set foldmethod=syntax                               " 使用语法高亮定义代码折叠
set foldlevel=100                                   " 打开文件时默认不折叠代码
set foldcolumn=5                                    " set width


"------------------------------------------------------------------------------
"-- QuickFix setting
"------------------------------------------------------------------------------
map <F6> :make clean<CR><CR><CR>                    " map f6 as make clean
map <F7> :make<CR><CR><CR> :copen<CR><CR>           " map f7 as make and open quickfix window to see make info
map <F8> :cp<CR>                                    " move to pervious error
map <F9> :cn<CR>                                    " move to next error
imap <F6> <ESC>:make clean<CR><CR><CR>              " make all these command available in insert mode
imap <F7> <ESC>:make<CR><CR><CR> :copen<CR><CR>
imap <F8> <ESC>:cp<CR>
imap <F9> <ESC>:cn<CR>


"------------------------------------------------------------------------------
"-- Markdown setting
"------------------------------------------------------------------------------
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1


"------------------------------------------------------------------------------
"-- search setting
"------------------------------------------------------------------------------
map ft :call Search_Word()<CR>:copen<CR>
function Search_Word()
let w = expand("<cword>") " 在当前光标位置抓词
execute "vimgrep " . w . " %"
endfunction
