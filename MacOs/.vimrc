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
	"Plugin 'Yggdroot/indentLine'
	Plugin 'The-NERD-tree'
	" Plugin 'Valloric/YouCompleteMe'
	Plugin 'scrooloose/syntastic'
	Plugin 'scrooloose/nerdcommenter'
	"Plugin 'OmniSharp/omnisharp-vim'
	"Plugin 'nathanaelkane/vim-indent-guides'
	"Plugin 'wincent/command-t'
	Plugin 'ctrlpvim/ctrlp.vim'
	Plugin 'easymotion/vim-easymotion'
	Plugin 'vim-scripts/taglist.vim'
	Plugin 'junegunn/vim-easy-align'
	Plugin 'tpope/vim-dispatch'
	" web-devicons load after plugins above!
	Plugin 'ryanoasis/vim-devicons'
	"colors
	"Plugin 'marlun/vim-starwars'
	"Plugin 'jnurmine/Zenburn'
	"Plugin 'vim-scripts/strange'
	"Plugin 'vyshane/vydark-vim-color'
	"Plugin 'altercation/vim-colors-solarized'
	"Plugin 'vim-scripts/greenvision'
	call vundle#end()            " required
" }

" Generanal {
	filetype plugin on
	filetype plugin indent on
	filetype on
	syntax on
	"In many terminal emulators the mouse works just fine, thus enable it.
	if has('mouse')
	  set mouse=a
	endif
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
	"set fileencodings=ucs-bom,utf-8,cp936
	set fileencodings=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936,utf-16,big5,euc-jp,latin1

	highlight SpecialKey term=standout ctermbg=yellow guibg=yellow

" }

" Vim UI {
	colors atom-dark-256
	"set background=dark
	set ambiwidth=double
	set langmenu=en_US.UTF-8
	let $LANG='en_US'
	set helplang=en

	"highlight clear LineNr
	"highlight clear SignColumn

	"winpos 741 0
	"set lines =40 columns =80

	if has('cmdline_info')
		set ruler                   " Show the ruler
		"set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
		set rulerformat=%40(%=%y\ %{&fenc?&fenc:&enc}\ \[%{&fileformat}\]%{&bomb?'[BOM]':''}\ %l,%c%V\ %P%)
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
	"set noexpandtab                 " Tabs are spaces, not tabs
	set smarttab
	set smartindent
	set autoindent
	set tabstop=2                   " An indentation every four columns
	set shiftwidth=2                " Use indents of 2 spaces
	set softtabstop=2               " Let backspace delete indent
	set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
	set splitright                  " Puts new vsplit windows to the right of the current
	set splitbelow                  " Puts new split windows to the bottom of the current
"}

" Key Mappings {
	let mapleader="<space>"
	nmap <SPACE> <Nop>
	vmap <SPACE> <Nop>

	vmap <Leader>y "+y
	nmap <leader>y "+y
	nmap <leader>p "+p
	vmap <Leader>p "+p
	"inoremap <C-U> <C-G>u<C-U>
	imap <C-l> <DEL>
	imap <C-CR> <ESC>O
	imap <C-f> <RIGHT>
	imap <C-b> <LEFT>
	nmap <C-CR> ^
	nmap <C-n> :NERDTreeToggle<CR>
	nmap <silent><expr>j (v:count == 0?'gj':'j')
	nmap <silent><expr>k (v:count == 0?'gk':'k')
	" format?
	"nmap <silent><leader>q gwip
	" Create a folder depend on {}, ()
	nmap <leader>f zf%
	" Toggle folder
	" nmap <space> za
	" imap jj <ESC>

	map <silent><Up> :YcmCompleter GoToDefinition<CR>
	map <Down> :bd<CR>
	map <silent><Left> :bp<CR>
	map <silent><Right> :bn<CR>

	nmap <silent><leader>c :Gcc<CR>

	" Easy-Align's mapping
	xmap ga <Plug>(EasyAlign)
	nmap ga <Plug>(EasyAlign)

	" OmniSharp {{{
	nnoremap <leader><space> :OmniSharpGetCodeActions<cr>
	" Run code actions with text selected in visual mode to extract method
	vnoremap <leader><space> :call OmniSharp#GetCodeActions('visual')<cr>

	" rename with dialog
	nnoremap <leader>nm :OmniSharpRename<cr>
	" rename without dialog - with cursor on the symbol to rename... ':Rename newname'
	command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

	" Force OmniSharp to reload the solution. Useful when switching branches etc.
	nnoremap <leader>rl :OmniSharpReloadSolution<cr>
	nnoremap <leader>cf :OmniSharpCodeFormat<cr>
	" Load the current .cs file to the nearest project
	nnoremap <leader>tp :OmniSharpAddToProject<cr>

	" Add syntax highlighting for types and interfaces
	nnoremap <leader>th :OmniSharpHighlightTypes<cr>
	"}}}
"}

" Plugins {
	" NERDTree {
		let g:NERDTreeQuitOnOpen = 1
		" Backup:,
		let g:NERDTreeDirArrowExpandable = ''
		let g:NERDTreeDirArrowCollapsible = ''
	"}

	" NERDCommenter {
		let NERDSpaceDelims = 1
	" }

	" IndentGuides {
		let g:indent_guides_enable_on_vim_startup=1
		let g:indent_guides_guide_size = 0
		let g:indent_guides_start_level=1
	"}

	"Syntastic {
		let g:syntastic_always_populate_loc_list = 1
		let g:syntastic_auto_loc_list = 0
		let g:syntastic_check_on_open = 0
		let g:syntastic_check_on_wq = 0
		let g:syntastic_cpp_check_header = 1
		let g:syntastic_ignore_files=[".*\.py$"]
		let g:syntastic_cs_checkers=['syntax', 'semantic']
		"let g:syntastic_cs_checkers=['syntax', 'semantic', 'issues']
		"let g:syntastic_cs_quiet_messages = { "level": "warnings"}

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

	" ctrlp {
		set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " 
		let g:ctrlp_custom_ignore = {
					\ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
					\ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
					\ }
		let g:ctrlp_working_path_mode=0
		let g:ctrlp_match_window_bottom=1
		let g:ctrlp_max_height=15
		let g:ctrlp_match_window_reversed=0
		let g:ctrlp_mruf_max=500
	" }
"}

" GUI Settings {
	if has('gui_running')
		set guioptions=

		if IsOSX()
			set transparency=3
			set guifont=SauceCodePro\ Nerd\ Font\ Mono:h14
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
		exec "!g++ -g -std=c++11 % -o %<"
	endfunc

	" Convert heading space to tab.
	func! ConvertHeadingSpacesToTabs()
			set expandtab
			set tabstop=2
			set shiftwidth=2                " Use indents of 4 spaces
			set softtabstop=2               " Let backspace delete indent
			retab!
			%s+\(^\s*\)\@<=\ \ \ \ +\t+g
			set noexpandtab
	endfunc
"}

" Commands {
	command! Ctags :call CompileTags() "normal"<CR>
	command! Gcc :call CompileRunGpp() "normal"<CR>
	command! Cst :call ConvertHeadingSpacesToTabs() "normal"<CR>
"}

" AutoCommands {
	if !exists("autocommands_loaded")
		let autocommands_loaded = 1
		autocmd BufReadPost * loadview
		autocmd BufWritePost $MYVIMRC source $MYVIMRC
		autocmd BufWritePre * mkview

	"	augroup omnisharp_commands
	"		autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

	"		" Synchronous build (blocks Vim)
	"		"autocmd FileType cs nnoremap <F5> :wa!<cr>:OmniSharpBuild<cr>
	"		" Builds can also run asynchronously with vim-dispatch installed
	"		autocmd FileType cs nnoremap <leader>b :wa!<cr>:OmniSharpBuildAsync<cr>
	"		" automatic syntax check on events (TextChanged requires Vim 7.4)
	"		autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck

	"		" Automatically add new cs files to the nearest project on save
	"		autocmd BufWritePost *.cs call OmniSharp#AddToProject()

	"		"show type information automatically when the cursor stops moving
	"		autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

	"		"The following commands are contextual, based on the current cursor position.

	"		autocmd FileType cs nnoremap gd :OmniSharpGotoDefinition<cr>
	"		autocmd FileType cs nnoremap <leader>fi :OmniSharpFindImplementations<cr>
	"		autocmd FileType cs nnoremap <leader>ft :OmniSharpFindType<cr>
	"		autocmd FileType cs nnoremap <leader>fs :OmniSharpFindSymbol<cr>
	"		autocmd FileType cs nnoremap <leader>fu :OmniSharpFindUsages<cr>
	"		"finds members in the current buffer
	"		autocmd FileType cs nnoremap <leader>fm :OmniSharpFindMembers<cr>
	"		" cursor can be anywhere on the line containing an issue
	"		autocmd FileType cs nnoremap <leader>x  :OmniSharpFixIssue<cr>
	"		autocmd FileType cs nnoremap <leader>fx :OmniSharpFixUsings<cr>
	"		autocmd FileType cs nnoremap <leader>tt :OmniSharpTypeLookup<cr>
	"		autocmd FileType cs nnoremap <leader>dc :OmniSharpDocumentation<cr>
	"		"navigate up by method/property/field
	"		autocmd FileType cs nnoremap <C-K> :OmniSharpNavigateUp<cr>
	"		"navigate down by method/property/field
	"		autocmd FileType cs nnoremap <C-J> :OmniSharpNavigateDown<cr>

	"	augroup END
	endif
	" }

