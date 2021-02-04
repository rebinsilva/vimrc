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
Plug 'tpope/vim-fugitive'
" Plug 'vim-scripts/indentpython.vim'
" Plug 'nvie/vim-flake8'
" Plug 'lifepillar/vim-solarized8'
Plug 'ryanoasis/vim-devicons'
Plug 'vimwiki/vimwiki'
Plug 'itchyny/calendar.vim', {'on': 'Calendar'}
" Plug 'majutsushi/tagbar'
" Plug 'lifepillar/gruvbox' " Change i3 to this colorscheme
Plug 'gruvbox-community/gruvbox' " Change i3 to this colorscheme
" Plug 'vim-latex/vim-latex'
Plug 'SirVer/ultisnips'
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'
Plug 'sbdchd/neoformat'
Plug 'lervag/vimtex'
Plug 'let-def/vimbufsync'
Plug 'whonore/coqtail'
Plug 'puremourning/vimspector'

" Plug 'SkyLeach/pudb.vim'
" Plug 'rebinsilva/VimFStar', {'branch': 'ide', 'for': 'fstar'}
" Plug 'file:///home/monitor/Documents/lang/vimscript/VimFStar/', {'branch': 'ide', 'for': 'fstar'}

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
let g:airline#extensions#syntastic#enabled = 1
let airline#extensions#syntastic#error_symbol = 'E:'
let airline#extensions#syntastic#stl_format_err = '%E{[%fe(#%e)]}'
let airline#extensions#syntastic#warning_symbol = 'W:'
let airline#extensions#syntastic#stl_format_warn = '%W{[%fw(#%w)]}'
let g:airline#extensions#vimtex#enabled = 1
let g:airline#extensions#vimtex#left = "{"
let g:airline#extensions#vimtex#right = "}"
let g:airline#extensions#vimtex#main = ""
let g:airline#extensions#vimtex#sub_main = "m"
let g:airline#extensions#vimtex#sub_local = "l"
let g:airline#extensions#vimtex#compiled = "c₁"
let g:airline#extensions#vimtex#continuous = "c"
let g:airline#extensions#vimtex#viewer = "v"
let g:airline#extensions#ycm#enabled = 1
let g:airline#extensions#ycm#error_symbol = 'E:'
let g:airline#extensions#ycm#warning_symbol = 'W:'
" }}}
" For plugin airline-themes {{{
" let g:airline_theme='solarized_flood'
let g:airline_theme='gruvbox'
" }}}
" For plugin syntastic {{{
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_c_compiler_options = "-std=gnu11"
let g:syntastic_cuda_compiler_options = "-std=c11"
let g:ycm_show_diagnostics_ui = 0 " Disabling ycm checkers for syntastic
set sessionoptions-=blank "To remove error window from getting saved
let g:syntastic_shell = "/bin/sh"
let g:syntastic_python_checkers = ["python"]
let g:syntastic_tex_checkers = []
" }}}
" For plugin nerdTree {{{
" autocmd vimenter * NERDTree
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
" For plugin vimtex {{{
" With neovim, it is useful to start the LaTeX editing session with `nvim --listen /tmp/nvimserver` (e.g. by using an alias)
let g:tex_flavor = 'latex'
" let g:vimtex_view_general_viewer = 'okular'
" let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
" let g:vimtex_view_general_options_latexmk = '--unique'
let g:vimtex_view_general_viewer = 'zathura'
if !exists('g:ycm_semantic_triggers')
  let g:ycm_semantic_triggers = {}
endif
au VimEnter * let g:ycm_semantic_triggers.tex=g:vimtex#re#youcompleteme

if empty(v:servername) && exists('*remote_startserver')
call remote_startserver('VIM')
endif
" let g:vimtex_fold_enabled=1 " Use smart folding plugin if need to use this


" Using UltiSnips#Anon
inoremap <silent> __ __<c-r>=UltiSnips#Anon('_{$1}$0', '__', '', 'i')<cr>
inoremap <silent> ^^ ^^<c-r>=UltiSnips#Anon('^{$1}$0', '^^', '', 'i')<cr>


nnoremap <localleader>lt :call vimtex#fzf#run()<cr>
" let g:vimtex_compiler_progname = 'nvr'
" }}}
" For plugin Vimspector {{{
" packadd! vimspector
let g:vimspector_enable_mappings = 'HUMAN'
" }}}

" For Cscope {{{
" if has("cscope")
" 	set csprg=/usr/bin/cscope
" 	set csto=0
" 	set cst
" 	set nocsverb
" 	" add any database in current directory
" 	if filereadable("cscope.out")
" 	    cs add cscope.out
" 	" else add database pointed to by environment
" 	elseif $CSCOPE_DB != ""
" 	    cs add $CSCOPE_DB
" 	endif
" 	set csverb
" " The following maps all invoke one of the following cscope search types:
" "
" "	0 or s: Find this C symbol
" "	1 or g: Find this definition
" "	2 or d: Find functions called by this function
" "	3 or c: Find functions calling this function
" "	4 or t: Find this text string
" "	6 or e: Find this egrep pattern
" "	7 or f: Find this file
" "	8 or i: Find files #including this file
" "	9 or a: Find places where this symbol is assigned a value
" 	nmap <Space>s :cs find s <C-R>=expand("<cword>")<CR><CR>
" 	nmap <Space>g :cs find g <C-R>=expand("<cword>")<CR><CR>
" 	nmap <Space>c :cs find c <C-R>=expand("<cword>")<CR><CR>
" 	nmap <Space>t :cs find t <C-R>=expand("<cword>")<CR><CR>
" 	nmap <Space>e :cs find e <C-R>=expand("<cword>")<CR><CR>
" 	nmap <Space>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
" 	nmap <Space>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
" 	nmap <Space>d :cs find d <C-R>=expand("<cword>")<CR><CR>
" 	nmap <Space>a :cs find a <C-R>=expand("<cword>")<CR><CR>
" 	
" 	nmap <C-Space>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
" 	nmap <C-Space>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
" 	nmap <C-Space>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
" 	nmap <C-Space>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
" 	nmap <C-Space>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
" 	nmap <C-Space>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
" 	nmap <C-Space>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
" 	nmap <C-Space>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>
" 	nmap <C-Space>a :vert scs find a <C-R>=expand("<cword>")<CR><CR>
" endif
" }}}
" For Ocaml {{{
" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if count(s:opam_available_tools, tool) > 0
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line
" }}}
" For Merlinc(Ocaml) Do merlin package installation as soon as it can work with ocaml4.09 {{{
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"
let g:syntastic_ocaml_checkers = ['merlin'] " For syntax and type errors
" }}}
" For Coq {{{
nmap <Space>c <leader>cc
nmap <Space>q <leader>cq
nmap <Space>l <leader>cl
nmap <Space>k <leader>ck
nmap <Space>j <leader>cj
nmap <Space>T <leader>cT
nmap <Space>G <leader>cG
nmap <Space>g <leader>cg
nmap <Space>s <leader>cs
nmap <Space>h <leader>ch
nmap <Space>a <leader>ca
nmap <Space>p <leader>cp
nmap <Space>f <leader>cf

" function! g:CoqtailHighlight()
"   hi def CoqtailChecked ctermbg=19
"   hi def CoqtailSent ctermbg=62
" endfunction
" }}}

" set rtp+=/home/monitor/Documents/lang/vimscript/
" autocmd BufNewFile,BufRead *.fst runtime! VimFStar/**/*.vim
filetype plugin on
filetype indent on
syntax enable

packadd! matchit
packadd! termdebug
packadd! shellmenu
packadd! justify
runtime! ftplugin/man.vim

set background=dark
colorscheme gruvbox

let python_highlight_all=1
syntax on

set mouse=a
set number
set showcmd
set linebreak
set clipboard=unnamedplus
set incsearch
set softtabstop=4
set cursorline
set mousefocus
set mousehide
set modeline
set scrolloff=2

let &t_SI = "\<esc>[5 q"
let &t_SR = "\<esc>[5 q"
let &t_EI = "\<esc>[2 q"

nmap <F2> :set hls!<ENTER>
imap <F2> <ESC>:set hls!<ENTER>a
map  <silent> <F7>    <Esc>:cprevious<CR>
map  <silent> <F8>    <Esc>:cnext<CR>
