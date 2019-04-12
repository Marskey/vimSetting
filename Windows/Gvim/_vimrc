" System vimrc file for Vim
" Environment {{{
    "Basics {{{
        "set nocompatible
        set nobackup
    "}}}
    "Identify platform {{{
        silent function! IsOSX()
            return has('macunix')
        endfunction
        silent function! IsLINUX()
            return has('unix') && !has('macunix') && !has('win32unix')
        endfunction
        silent function! IsWINDOWS()
            return (has('win32') || has('win64'))
        endfunction
    "}}}
    " Windows Compatible {{{
        " On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
        " across (heterogeneous) systems easier.
        if IsWINDOWS()
            set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
            source $VIMRUNTIME/delmenu.vim
            source $VIMRUNTIME/menu.vim
        endif
    "}}}
"}}}

" Vundle {{{
    filetype off
    set rtp+=~/.vim/bundle/vundle.vim
    call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'
    "Plugin 'Yggdroot/indentLine'
    Plugin 'The-NERD-tree'
    "Plugin 'Valloric/YouCompleteMe'
    "Plugin 'scrooloose/syntastic'
    "Plugin 'powerline/powerline'
    "Plugin 'bling/vim-airline'
    Plugin 'scrooloose/nerdcommenter'
    Plugin 'junegunn/vim-easy-align'
    "Plugin 'scrooloose/nerdtree'
    "Plugin 'nathanaelkane/vim-indent-guides'
    "Plugin 'wincent/command-t'
    Plugin 'easymotion/vim-easymotion'
    "Plugin 'vim-scripts/taglist.vim'
    Plugin 'ctrlpvim/ctrlp.vim'
    "colors
    Plugin 'ryanoasis/vim-devicons'
    "Plugin 'marlun/vim-starwars'
    "Plugin 'jnurmine/Zenburn'
    "Plugin 'vim-scripts/strange'
    "Plugin 'vyshane/vydark-vim-color'
    "Plugin 'altercation/vim-colors-solarized'
    "Plugin 'godlygeek/tabular'
    "Plugin 'vim-scripts/greenvision'
    call vundle#end()            " required
"}}}

" Generanal {{{
    filetype plugin on
    filetype plugin indent on
    filetype on
    syntax on
    "In many terminal emulators the mouse works just fine, thus enable it.
    "if has('mouse')
      set mouse=a
    "endif
    "scriptencoding utf-8
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
    "set spell                                       " Spell checking on
    set hidden                                      " Allow buffer switching without saving
    set autoread
    set noeol
    set noimdisable "离开insert模式的时候自动切换至英文输入法
    "set autowrite
    set encoding=utf-8
    set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
    if IsWINDOWS()
        set fileencoding=cp936
    else
        set fileencoding=utf-8
    endif
    "解决菜单乱码
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
    "解决consle输出乱码
    language messages zh_CN.utf-8

    if IsWINDOWS()
        set wildignore+=*\\.git\\*,*\\.hg\\*,*\\.svn\\*,*.o,*.obj,*.pdb  " Windows ('noshellslash')
    endif

    highlight SpecialKey term=standout ctermbg=yellow guibg=yellow

"}}}

" Vim UI {{{
    "colors atom-dark
    colors happy_hacking
    set background=dark
    set ambiwidth=double

    set langmenu=en_US.UTF-8
    let $LANG='en_US.UTF-8'
    set helplang=en
    "set langmenu=zh_CN.UTF-8
    "let $LANG='zh_CN.UTF-8'

    "highlight clear LineNr
    "highlight clear SignColumn

    "winpos 741 0
    set lines =60 columns =110

    if has('cmdline_info')
        set ruler                   " Show the ruler
        set rulerformat=%40(%=%y\ %{&fenc?&fenc:&enc}\ \[%{&fileformat}\]%{&bomb?'[BOM]':''}\ %l,%c%V\ %P%) " A ruler on steroids
        set showcmd                 " Show partial commands in status line and
                                    " Selected characters/lines in visual mode
        set cmdheight=1
        set laststatus=2
    endif

    " AutoMaximizeWindow {
        "if IsWINDOWS()
            "au GUIEnter * simalt ~x
        "endif
    "}

    set cursorline                  " Highlight current line
    "set cursorcolumn
    set number                      " Display line numbers
    set relativenumber              " Display relative line number
    set backspace=indent,eol,start  " Backspace for dummies
    set linespace=0                 " No extra spaces between rows
    set showmatch                   " Show matching brackets/parenthesis
    set incsearch                   " Find as you type search
    set hlsearch                    " Highlight search terms
    set winminheight=0              " Windows can be 0 line high
    "set ignorecase                  " Case insensitive search
    set smartcase                   " Case sensitive when uc present
    set wildmenu                    " Show list instead of just completing
    "set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
    "set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
    set scrolljump=5                " Lines to scroll when cursor leaves screen
    set scrolloff=3                 " Minimum lines to keep above and below cursor
    set foldenable                  " Auto fold code
    set foldmethod=manual
    "set foldcolumn=3
    set list

    "set listchars=tab:›-,eol:¬
    set listchars=tab:▸╌,trail:∙,eol:¬ " Highlight problematic whitespac        e¬
    set confirm
    set matchtime=5

"}}}

" Formatting {{{
    set smarttab
    set cindent
    set smartindent
    set autoindent    " Indent at the same level of the previous line
    set shiftwidth=4  " Use indents of 4 spaces
    set expandtab     " Tabs are spaces, not tabs
    set tabstop=4     " An indentation every four columns
    set softtabstop=4 " Let backspace delete indent
    set nojoinspaces  " Prevents inserting two spaces after punctuation on a join (J)
    set splitright    " Puts new vsplit windows to the right of the current
    set splitbelow    " Puts new split windows to the bottom of the current
"}}}

" Plugins {{{
    " NERDTree {{{
        let g:NERDTreeQuitOnOpen = 1
        let NERDTreeDirArrows = 1
        let g:NERDTreeDirArrowExpandable = ""
        let g:NERDTreeDirArrowCollapsible = ""
    "}}}

    " IndentGuides {{{
        let g:indent_guides_enable_on_vim_startup=1
        let g:indent_guides_guide_size = 0
        let g:indent_guides_start_level=1
    " }}}

    " IndentLine {{{
        let g:indentLine_fileType=['c','cpp', 'h']
        let g:indentLine_char='┊'
    " }}}

    "Syntastic {{{
        let g:syntastic_always_populate_loc_list = 1
        let g:syntastic_auto_loc_list = 1
        let g:syntastic_check_on_open = 1
        let g:syntastic_check_on_wq = 0
        let g:syntastic_cpp_check_header = 1
        let g:syntastic_ignore_files=[".*\.py$"]
        let g:syntastic_cpp_checkers=['gcc']

        let g:syntastic_error_symbol = "✗"
        highlight SyntasticErrorSign guifg=white guibg=red
        highlight SyntasticErrorLine guibg=#2f0000

        let g:syntastic_warning_symbol = "⚠"
        highlight SyntasticWarningSign guifg=white guibg=yellow
        highlight SyntasticWarningLine guibg=#302600
        "let g:syntastic_cpp_compiler='clang++'
        "let g:syntastic_cpp_compiler_options='-std=c++11 -stdlib=libc++'
    " }}}

    " YouCompleteMe {{{
        let g:ycm_show_diagnostics_ui=0
        let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
        let g:ycm_collect_identifiers_from_tag_files=1
        let g:ycm_confirm_extra_conf=0
    " }}}

    " Ctags {{{
        set tags=tags;
        set tags+=./tags
    " }}}

    " Taglist {{{
        let Tlist_Show_One_File = 1 "只显示当前文件的taglist
        let Tlist_Exit_OnlyWindow = 1 "如果taglist是最后一个窗口，则退出vim
        let Tlist_Use_Horiz_Window = 1
    " }}}

    " Easy-align {{{
    let g:easy_align_delimiters = {
                \ '>': { 'pattern': '>>\|=>\|>' },
                \ '/': {
                \     'pattern':         '//\+\|/\*\|\*/',
                \     'delimiter_align': 'l',
                \     'ignore_groups':   ['!Comment'] },
                \ ']': {
                \     'pattern':       '[[\]]',
                \     'left_margin':   0,
                \     'right_margin':  0,
                \     'stick_to_left': 0
                \   },
                \ ')': {
                \     'pattern':       '[()]',
                \     'left_margin':   0,
                \     'right_margin':  0,
                \     'stick_to_left': 0
                \   },
                \ 'd': {
                \     'pattern':      ' \(\S\+\s*[;=]\)\@=',
                \     'left_margin':  0,
                \     'right_margin': 0
                \   }
                \ }
    " }}}
"}}}

" GUI Settings {{{
    if has('gui_running')
        set go=

        if IsOSX()
            set transparency=3
            set guifont=Source\ Code\ Pro\ for\ Powerline:h12
        elseif IsWINDOWS()
            set guifont=新宋体:h10:cGB2312
        endif

    endif
"}}}

" Functions {{{
    command! Ctags :call CompileTags() "normal"<cr>
    func! CompileTags()
        exec "!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ ."
    endfunc

    command! Gcc :call CompileRunGpp() "normal"<cr>
    func! CompileRunGpp()
        exec "w"
        exec "!gcc -g % -o %<"
    endfunc

    command! Cst :call ConvertHeadingSpacestotabs() "norma"<cr>
    func! ConvertHeadingSpacestotabs()
        set expandtab
        set tabstop=4
        set shiftwidth=4
        set softtabstop=4
        retab!
        %s+\(^\s*\)\@<=\ \ \ \ +\t+g
        set noexpandtab
    endfunc

    command! Cts :call ConvertHeadingtabsToSpace() "norma"<cr>
    func! ConvertHeadingSpacestotabs()
        set expandtab
        set tabstop=4
        set shiftwidth=4
        set softtabstop=4
        retab!
    endfunc

    command! Ef :call ExecauteFile() "normal"<cr>
    func! ExecauteFile()
        exec "w"
        exec "!start %:p"
    endfunc

"}}}

" Key Mappings {{{
    let mapleader=","
    vnoremap <leader>y "+y
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

    map <silent><Up> :YcmCompleter GoTo<cr>
    map <Down> :bd<cr>
    map <silent><Left> :bp<cr>
    map <silent><Right> :bn<cr>
    map <F2> :call ConvertHeadingSpacestotabs()<cr>
    " easy-align about
    " Start interactive EasyAlign in visual mode (e.g. vipga)
    xmap ga <Plug>(EasyAlign)
    " Start interactive EasyAlign for a motion/text object (e.g. gaip)
    nmap ga <Plug>(EasyAlign)
    " Search for selected text, forwards or backwards.
    vnoremap <silent> * :<C-U>
                \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
                \gvy/<C-R><C-R>=substitute(
                \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
                \gV:call setreg('"', old_reg, old_regtype)<CR>
    vnoremap <silent> # :<C-U>
                \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
                \gvy?<C-R><C-R>=substitute(
                \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
                \gV:call setreg('"', old_reg, old_regtype)<CR>
"}}}

" AutoCmd {{{
" 和IGG的电脑有冲突打开之后不能正常使用(不知道是因为windows10, vim8.1, 还是因为IGG)
    "if !exists("autocommands_loaded")
      "let autocommands_loaded = 1
      "autocmd BufWritePre * mkview
      "autocmd BufWritePost $MYVIMRC source $MYVIMRC
      "autocmd BufReadPost * loadview
      ""autocmd vimenter * NERDTree
      "autocmd VimEnter * wincmd w
    "endif
"}}}
