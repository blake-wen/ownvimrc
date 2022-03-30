" 20180207-15:54
"====================================================================
" Vim Basic Configure
"====================================================================

"------------------------------------------
"- Colors Schemes
"- https://github.com/ayu-theme/ayu-vim
"- https://www.quora.com/What-are-some-of-the-best-Vim-color-schemes
"- https://www.slant.co/topics/480/~best-vim-color-schemes
colorscheme ron     " :colorscheme [tab] -> more scheme
"------------------------------------------
"- encoding
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8
"- 顯示
set t_Co=256        "can show 256 color
"set bg=dark     		" 背景與文字高對比色
set wrap                " 字元過長自動換行
set ruler               " 顯示右下角狀態 (行數,字數)
set cursorline  		" 游標所在位置行高亮度 (水平)
"set cursorcolumn       " 游標所在位置列高亮度 (垂直)

"- 搜索
set hlsearch    " 搜尋時，以高度亮顯示 (等於 set hls)
set ignorecase  " 搜尋時，忽略大小寫 (等於 set ic)
set smartcase   " 若搜尋目標有大寫英文時，忽略 'ignorecase' 功能
set incsearch   " 輸入關鍵字同時開始搜尋結果
"set tags=./tags,./TAGS,tags;~,TAGS;~
set tags=./tags;/,tags;/

"set nowrapscan	" do not wrap around

"- 語法高亮度
"syntax enable
syntax on

"- Tab and Space

"- 縮排 (手動排版：gg → shift+v → shift+g → = )
"- 自動縮排
set autoindent
"set copyindent
"set preserveindent

"- 跳新一行時，智慧縮排
set smartindent

"- 將 Tab to Space，方便貼到別editor保有排版
"set expandtab
setlocal noexpandtab

let tabsize = 2
"- 自動縮排 "setlocal shiftwidth=4
execute "set shiftwidth=".tabsize

"- Tab 寬度 tabstop(ts) "setlocal tabstop=4
execute "set tabstop=".tabsize

:set expandtab
:%retab!
"set softtabstop=4		" 按 Backspace 可以一次刪 4 個空白鍵
""    setlocal textwidth=80


"- Set Backspace key function
"set backspace=indent,eol,start
set backspace=2

"set clipboard=unnamedplus

"set nu
autocmd Filetype java,jsp,c,cpp,dts,dtsi,h setlocal nu 
"autocmd FileType java,jsp,c,cpp,dts,dtsi,h set nu
"autocmd BufNewFile,BufRead *.h set nu
autocmd BufNewFile,BufRead Makefile* set nu
autocmd BufNewFile,BufRead config* set nu
noremap <F10> :set nu!<CR>

"====================================================================
" Mouse hotkey function
" n   Normal mode
" v   Visual mode
" i   Insert mode
" c   Command-line mode
" h   all previous modes when editing a help file
" a   all previous modes
" r   for |hit-enter| and |more-prompt| prompt
"====================================================================
set mouse=
nnoremap :call ToggleMouse()
function! ToggleMouse()
if &mouse == 'a'
set mouse=
echo "<F3> Mouse Disabled"
else
set mouse=a
echo "<F3> Mouse Enabled"
endif
endfunction

"====================================================================
" Vundle Setting
" :PluginInstall 
" :PluginUpdate => You just need to mark  plugin which you want to remove and
"  execute the command.
"====================================================================
set nocompatible               " be iMproved
filetype off                   " required!
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'mileszs/ack.vim'  
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'jiangmiao/auto-pairs'
Plugin 'scrooloose/nerdcommenter'
"Plugin 'neoclide/coc.nvim', {'branch': 'release'}
"Plugin 'Yggdroot/indentLine'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"------------------------------------------
"- Add Plugins
"------------------------------------------
"Plugin 'Valloric/YouCompleteMe'
"------------------------------------------
"- Source Insight Like
"- (taglist + nerdtree + ctags+ SrcExpl)
"- ref: https://goo.gl/vTrqLu
"------------------------------------------

"------------------------------------------
"- vundle end
call vundle#end()
filetype plugin indent on     " required!


"--------------------------------------------
"- all plugins setting
"--------------------------------------------

"coc nvim
":CocList extensions "manage extenstion
let g:coc_global_extensions = ['coc-json' , 'coc-clangd','coc-cmake','coc-sh','coc-git']

""nerdtree setting
nnoremap <F5> :NERDTreeToggle<CR>

"CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

"Ack.vim
map <F2> :Ack<space>
let g:ackprg = 'ag --nogroup --nocolor --column'

"indentLine
"let g:indentLine_enabled = 0        "disable plugin
let g:indentLine_char = '│'

"vim-airline
let g:airline#extensions#tabline#enabled = 1
nnoremap < :bp<CR> 
nnoremap > :bn<CR> 
