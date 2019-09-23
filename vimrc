" vim:set foldmethod=marker:
"
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align

" Any valid git URL is allowed
" Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators

" On-demand loading
Plug 'scrooloose/nerdtree'

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'Valloric/YouCompleteMe', { 'do': 'python3 install.py --clang-completer' }
" Plug 'WolfgangMehner/vim-plugins'
" Plugin 'nathanaelkane/vim-indent-guides'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'christoomey/vim-run-interactive'
" Plugin 'gabrielsimoes/cfparser.vim'
Plug 'vim-syntastic/syntastic'
" Plug 'w0rp/ale'
Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'vim-scripts/indentpython.vim'
" Plug 'nvie/vim-flake8'
Plug 'lifepillar/vim-solarized8'
Plug 'ryanoasis/vim-devicons'
Plug 'vimwiki/vimwiki'
Plug 'itchyny/calendar.vim'
" Plug 'majutsushi/tagbar'
" Plug 'lifepillar/gruvbox' " Change i3 to this colorscheme
Plug 'gruvbox-community/gruvbox' " Change i3 to this colorscheme
Plug 'vim-latex/vim-latex'

" Initialize plugin system
call plug#end()
" All of your Plugins must be added before the following line

" Commands
" PlugInstall [name ...] [#threads]	Install plugins
" PlugUpdate [name ...] [#threads]	Install or update plugins
" PlugClean[!]				Remove unlisted plugins (bang version will clean without prompt)
" PlugUpgrade				Upgrade vim-plug itself
" PlugStatus				Check the status of plugins
" PlugDiff				Examine changes from the previous update and the pending changes
" PlugSnapshot[!] [output path]		Generate script for restoring the current snapshot of the plugins

filetype plugin indent on    " required
"filetype plugin on

" For plugin YouCompleteMe {{{
let g:ycm_confirm_extra_conf=0
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_error_symbol = 'xx'
" }}}
" For plugin airline {{{
let g:airline_powerline_fonts = 1
" }}}
" For plugin airline-themes {{{
" let g:airline_theme='solarized_flood'
let g:airline_theme='gruvbox'
" }}}
" For plugin syntastic {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_c_compiler_options = "-std=gnu11"
let g:ycm_show_diagnostics_ui = 0 " Disabling ycm checkers for syntastic
set sessionoptions-=blank "To remove error window from getting saved
let g:syntastic_shell = "/bin/sh"
" }}}
" For plugin nerdTree {{{
autocmd vimenter * NERDTree
map <C-q> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" }}}
" For calendar.vim {{{
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1
" }}}
" For plugin Vimwiki {{{
let g:vimwiki_use_calendar = 1
let g:vimwiki_use_mouse = 1
" }}}

" For Cscope
if has("cscope")
	set csprg=/usr/bin/cscope
	set csto=0
	set cst
	set nocsverb
	" add any database in current directory
	if filereadable("cscope.out")
	    cs add cscope.out
	" else add database pointed to by environment
	elseif $CSCOPE_DB != ""
	    cs add $CSCOPE_DB
	endif
	set csverb
" The following maps all invoke one of the following cscope search types:
"
"	0 or s: Find this C symbol
"	1 or g: Find this definition
"	2 or d: Find functions called by this function
"	3 or c: Find functions calling this function
"	4 or t: Find this text string
"	6 or e: Find this egrep pattern
"	7 or f: Find this file
"	8 or i: Find files #including this file
"	9 or a: Find places where this symbol is assigned a value
	nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
	nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
	nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>a :cs find a <C-R>=expand("<cword>")<CR><CR>
	
	nmap <C-Space>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
	nmap <C-Space>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
	nmap <C-Space>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space>a :vert scs find a <C-R>=expand("<cword>")<CR><CR>

	" autocmd DirChanged * if filereadable("cscope.out") | cs add cscope.out | endif
endif


filetype plugin on
filetype indent on
syntax enable

packadd! matchit
packadd! termdebug
runtime! ftplugin/man.vim

set background=dark
colorscheme gruvbox

let python_highlight_all=1
syntax on

set mouse=a
set number
set showcmd
set linebreak
set clipboard=unnamed
set incsearch

nmap <F2> :set hls!<ENTER>
imap <F2> <ESC>:set hls!<ENTER>a
map  <silent> <F7>    <Esc>:cprevious<CR>
map  <silent> <F8>    <Esc>:cnext<CR>
