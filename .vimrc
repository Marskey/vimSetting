" System vimrc file for Vim
" Environment {
	"Basics {
		set nocompatible
		set nobackup
		set fileformats=unix,dos
	"}
	"Identify platform {
		silent function! IsOSX()
			return has('macunix')
		endfunction
		silent function! IsLINUX()
			return has('unix') && !has('macunix') && !has('win32unix')
		endfunction
		silent function! IsWINDOWS()
			return (has('win32') || has('win64'))
		endfunction
	"}
	" Windows Compatible {
		" On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
		" across (heterogeneous) systems easier.
		"if WINDOWS()
		"    set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
		"endif
	"}
"}

" Vundle {
	filetype off
	set rtp+=~/.vim/bundle/Vundle.vim
	set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim
	call vundle#begin()
	Plugin 'VundleVim/Vundle.vim'
	Plugin 'ryanoasis/vim-devicons'
	"Plugin 'Yggdroot/indentLine'
	Plugin 'The-NERD-tree'
	Plugin 'Valloric/YouCompleteMe'
	Plugin 'scrooloose/syntastic'
	Plugin 'scrooloose/nerdcommenter'
	"Plugin 'nathanaelkane/vim-indent-guides'
	Plugin 'wincent/command-t'
	Plugin 'easymotion/vim-easymotion'
	Plugin 'vim-scripts/taglist.vim'
	Plugin 'junegunn/vim-easy-align'
	"colors
	Plugin 'marlun/vim-starwars'
	Plugin 'jnurmine/Zenburn'
	Plugin 'vim-scripts/strange'
	Plugin 'vyshane/vydark-vim-color'
	Plugin 'altercation/vim-colors-solarized'
	Plugin 'vim-scripts/greenvision'
	call vundle#end()            " required
"}

" Generanal {
	filetype plugin on
	filetype plugin indent on
	filetype on
	syntax on
	"In many terminal emulators the mouse works just fine, thus enable it.
	if has('mouse')
	  set mouse=a
	endif
	scriptencoding utf-8
	if has('clipboard')
		if has('unnamedplus')  " When possible use + register for copy-paste
			set clipboard=unnamed,unnamedplus
		else         " On mac and Windows, use * register for copy-paste
			set clipboard=unnamed
		endif
	endif

	"set autowrite                                  " Automatically write a file when leaving a modified buffer
	set shortmess+=filmnrxoOtT                      " Abbrev. of messages (avoids 'hit enter')
	set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
	set virtualedit=onemore                         " Allow for cursor beyond last character
	set history=1000                                " Store a ton of history (default is 20)
	"set spell                                      " Spell checking on
	set hidden                                      " Allow buffer switching without saving
	set autoread
	"set autowrite
	set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
	set termencoding=utf-8
	set encoding=utf-8
	set fileencodings=ucs-bom,utf-8,cp936
	"set fileencodings=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936,utf-16,big5,euc-jp,latin1
	set fileencoding=utf-8

	highlight SpecialKey term=standout ctermbg=yellow guibg=yellow

"}

" Vim UI {
	colors atom-dark
	"set background=dark
	set ambiwidth=double
	set langmenu=en_US.UTF-8
	let $LANG='en_US'
	set helplang=en

	"highlight clear LineNr
	"highlight clear SignColumn

	"winpos 741 0
	set lines =40 columns =80

	if has('cmdline_info')
		set ruler                   " Show the ruler
		set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
		set showcmd                 " Show partial commands in status line and
									" Selected characters/lines in visual mode
		set cmdheight=1
	endif

	" AutoMaximizeWindow {
		if IsWINDOWS()
			au GUIEnter * simalt ~x
		endif
	"}

	set laststatus=2
	set cursorline                  " Highlight current line
	set number                      " Display line numbers
	set relativenumber              " Display relative line number
	set backspace=indent,eol,start  " Backspace for dummies
	set linespace=0                 " No extra spaces between rows
	set showmatch                   " Show matching brackets/parenthesis
	set incsearch                   " Find as you type search
	set hlsearch                    " Highlight search terms
	set winminheight=0              " Windows can be 0 line high
	"set ignorecase                 " Case insensitive search
	set smartcase                   " Case sensitive when uc present
	set wildmenu                    " Show list instead of just completing
	"set wildmode=list:longest,full " Command <Tab> completion, list matches, then longest common part, then all.
	"set whichwrap=b,s,h,l,<,>,[,]  " Backspace and cursor keys wrap too
	set scrolljump=5                " Lines to scroll when cursor leaves screen
	set scrolloff=3                 " Minimum lines to keep above and below cursor
	set foldenable                  " Auto fold code
	set list
"
	set listchars=tab:▸╌,trail:∙,eol:¬ " Highlight problematic whitespace

	set foldenable                  "manual fold
	set foldmethod=manual
"}

" Formatting {
	set autoindent                  " Indent at the same level of the previous line
	set cindent
	set confirm
	set matchtime=5
	set noexpandtab                 " Tabs are spaces, not tabs
	set smarttab
	set smartindent
	set autoindent
	set tabstop=4                   " An indentation every four columns
	set shiftwidth=4                " Use indents of 4 spaces
	set softtabstop=4               " Let backspace delete indent
	set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
	set splitright                  " Puts new vsplit windows to the right of the current
	set splitbelow                  " Puts new split windows to the bottom of the current
"}

" Key Mappings {
	let mapleader=","
	vmap <Leader>y "+y
	nmap <leader>p "+p
	"inoremap <C-U> <C-G>u<C-U>
	imap <c-l> <DEL>
	imap <c-CR> <ESC>O
	imap <c-f> <RIGHT>
	imap <c-b> <LEFT>
	nmap <c-CR> ^
	nmap <c-n> :NERDTreeToggle<cr>
	nmap <silent><expr>j (v:count == 0?'gj':'j')
	nmap <silent><expr>k (v:count == 0?'gk':'k')
	" format?
	nmap <silent><leader>q gwip
	" Create a folder depend on {}, ()
	nmap <leader>f zf%
	" Toggle folder
	nmap <space> za

	map <silent><Up> :YcmCompleter GoToImplementationElseDeclaration<cr>
	map <Down> <Nop>
	map <silent><Left> :bp<cr>
	map <silent><Right> :bn<cr>

	nmap <silent><leader>c :Gcc<cr>

	" Easy-Align's mapping
	xmap ga <Plug>(EasyAlign)
	nmap ga <Plug>(EasyAlign)
"}

" Plugins {
	" NERDTree {
		let g:NERDTreeQuitOnOpen = 1
		" Backup:,
		let g:NERDTreeDirArrowExpandable = ''
		let g:NERDTreeDirArrowCollapsible = ''
	"}

	" IndentGuides {
		let g:indent_guides_enable_on_vim_startup=1
		let g:indent_guides_guide_size = 0
		let g:indent_guides_start_level=1
	"}
	"
	" IndentLine {
		let g:indentLine_fileType=['c','cpp']
		let g:indentLine_char='┊'
	"}

	"Syntastic {
		let g:syntastic_always_populate_loc_list = 1
		let g:syntastic_auto_loc_list = 1
		let g:syntastic_check_on_open = 1
		let g:syntastic_check_on_wq = 0
		let g:syntastic_cpp_check_header = 1
		let g:syntastic_ignore_files=[".*\.py$"]
		"let g:syntastic_cpp_checkers=["gcc"]

		let g:syntastic_error_symbol = "X"
		highlight SyntasticErrorSign guifg=white guibg=red
		highlight SyntasticErrorLine guibg=#2f0000

		let g:syntastic_warning_symbol = "!"
		highlight SyntasticWarningSign guifg=black guibg=yellow
		highlight SyntasticWarningLine guibg=#302600
		let g:syntastic_cpp_compiler='gcc'
		let g:syntastic_cpp_compiler_options='-std=c++11 -stdlib=libc++'
	" }
	" YouCompleteMe {
		let g:ycm_always_populate_location_list = 1
		let g:ycm_show_diagnostics_ui=0
		let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
		let g:ycm_collect_identifiers_from_tag_files=1
		let g:ycm_confirm_extra_conf=0
	" }

	" Ctags {
		set tags=tags;
		set tags+=./tags
	" }

	" Taglist {
		let Tlist_Show_One_File = 1 "只显示当前文件的taglist
		let Tlist_Exit_OnlyWindow = 1 "如果taglist是最后一个窗口，则退出vim
		let Tlist_Use_Horiz_Window = 1
	" }

	" Bufferline {
		let g:bufferline_echo = 0
	" }

	" Command-t {
		"let g:CommandTMaxFiles = 500000
	" }
"}

" GUI Settings {
	if has('gui_running')
		set guioptions=

		if IsOSX()
			set transparency=3
			set guifont=Sauce\ Code\ Pro\ Nerd\ Font\ Complete:h14
			set guifontwide=Sauce\ Code\ Pro\ Nerd\ Font\ Complete:h14
		elseif IsWINDOWS()
			set guifont=Sauce\ Code\ Powerline:h10:cANSI
		endif

	endif
"}

" Functions {
	func! CompileTags()
		exec "!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ ."
	endfunc

	func! CompileRunGpp()
		exec "w"
		exec "!g++-4.8 -g -std=c++11 % -o %<"
	endfunc

	" Convert heading space to tab.
	func! ConvertHeadingSpacesToTabs()
			set expandtab
			set tabstop=4
			set shiftwidth=4                " Use indents of 4 spaces
			set softtabstop=4               " Let backspace delete indent
			retab!
			%s+\(^\s*\)\@<=\ \ \ \ +\t+g
			set noexpandtab
	endfunc
"}

" Commands {
	command! Ctags :call CompileTags() "normal"<cr>
	command! Gcc :call CompileRunGpp() "normal"<cr>
	command! Cst :call ConvertHeadingSpacesToTabs() "normal"<cr>
"}

" AutoCommands {
	if !exists("autocommands_loaded")
		let autocommands_loaded = 1
		autocmd BufReadPost * loadview
		autocmd BufWritePost $MYVIMRC source $MYVIMRC
		autocmd BufWritePre * mkview
	endif
" }
