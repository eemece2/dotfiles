set nocompatible                " choose no compatibility with legacy vi
syntax on                       " Turn On Color Syntax Highlighting
"filetype plugin indent on      " load file type plugins + indentation
set encoding=utf-8
set showcmd                     " display incomplete commands
" hidden: It hides buffers instead of closing them. This means that you can have
"   unwritten changes to a file and open a new file using :e, without being forced
"   to write or undo your changes first. Also, undo buffers and marks are preserved
"   while the buffer is open.
"       http://usevim.com/2012/10/19/vim101-set-hidden/
set hidden
colorscheme  molokai            " color theme

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" MAPS

" Leader (<leader>)
let mapleader = 'ñ'

" Esc (go from insert to normal mode)
inoremap jj <ESC>

" Moving between windows (Check delay with <Leader>h)
map <Leader>j <C-w>j
map <Leader>k <C-w>k
map <Leader>h <C-w>h
map <Leader>l <C-w>l

" BuzExplorer   <F4>
noremap <silent> <F4> :BufExplorer<CR>

" Buffergator   <F4>
" noremap <silent> <F4> :BuffergatorToggle<CR>

" NerdTree      <F2>
map <F2> :NERDTreeToggle<CR>

" Ranger        <F8>
map <F8> :call RangerChooser()<CR>

" Gundo         <Leader>u
nnoremap <Leader>u :GundoToggle<CR>

" CtrlP         <c-p>
let g:ctrlp_map = '<c-p>'
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=4 shiftwidth=4      " a tab is 4 spaces
set expandtab                   " use spaces, not tabs
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

"" Line numbers
set relativenumber              " line numbers relative to the current cursor position
"set number

"" Scroll
set scrolloff=10                " Visible lines (up or down the cursor) when scrolling (up or down)

" Highlight unwanted spaces, tabs, EOL, ...
"set list                        " Highlight whitespaces, EOL, ...
"set listchars=eol:¬             " EOL

"" Colors
set t_Co=256                    " Use 256 colours (only if terminal supports 256 colours)
" Background visual selected: Grey and reversed
hi Visual term=reverse cterm=reverse guibg=Grey

"" backupcopy
" For karma runner: prevents, on file savings, that vim remove the file on disk
" and copy the in memory file as the new version.
" By default, karma detect the deleted file, and run the tests before vim save the new
" file version, so tests will fail due to the non existence of the file.
set backupcopy=yes

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-airline
" Font install: http://www.reversiblean.com/install-vim-powerline/
"   wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf
"   mv PowerlineSymbols.otf ~/.local/share/fonts/
"   sudo fc-cache -f -v
"   wget https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
"   mkdir -p ~/.config/fontconfig/fonts.conf
"   mv 10-powerline-symbols.conf ~/.config/fontconfig/fonts.conf/
let g:airline_powerline_fonts=1
let g:airline_theme = 'wombat'
set laststatus=2
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP
let g:ctrlp_cmd = 'CtrlP'
set runtimepath^=~/.vim/bundle/ctrlp/plugin/ctrlp.vim
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RANGER: file selector with ranger
fun! RangerChooser()
    exec "silent !ranger --choosefile=/tmp/chosenfile " . expand("%:p:h")
    if filereadable('/tmp/chosenfile')
        exec 'edit ' . system('cat /tmp/chosenfile')
        call system('rm /tmp/chosenfile')
    endif
    redraw!
endfun
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" old statusline (before using airline)
"if has('statusline')
    "set laststatus=2

    ""define 3 custom highlight groups
    "hi User1 ctermbg=green ctermfg=red   guibg=green guifg=red
    "hi User2 ctermbg=red   ctermfg=black  guibg=red   guifg=blue
    "hi User3 ctermbg=blue  ctermfg=green guibg=blue  guifg=green

    "function! RenderStlFlag(value, goodValues, error)
      "let goodValues = split(a:goodValues, ',')
      "let good = index(goodValues, a:value) != -1
      "if (a:error && !good) || (!a:error && good)
        "return a:value
      "else
        "return ''
      "endif
    "endfunction

    "function! AddGitFlag(goodValues)
      "set statusline+=%1*
      "exec "set statusline+=%{RenderStlFlag(fugitive#statusline(),'".a:goodValues."',1)}"
      "set statusline+=%2*
      "exec "set statusline+=%{RenderStlFlag(fugitive#statusline(),'".a:goodValues."',0)}"
      "set statusline+=%*
    "endfunction

    "set statusline=%<%f\    " Filename
    "set statusline+=%w%h%m%r " Options
    "call AddGitFlag('(master)') "good branches
    "set statusline+=\ [%{getcwd()}]          " current dir
    "set statusline+=%=%-14.(%l,%c%V%)\ %p%% " Right aligned file nav info
"endif
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" jshint: Install jshint with: npm install -g jshint
let g:syntastic_javascript_checkers = ['jshint']
" html
let g:syntastic_html_checkers = ['validator']
" html5
"let g:syntastic_html_tidy_exec = 'tidy5'
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UltiSnip
" <tab>: by default there is a key binding collision between YCM and UltiSnip,
" so ...
" Use <c-j> to trigger UltiSnip:
let g:UltiSnipsExpandTrigger="<c-j>"
" Use <tab> and <s-tab> instead the YCM defaults: <c-n> and <c-p> to jump beetwen
" YCM list completion items:
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Column 80 colored (almost black)
if (exists('+colorcolumn'))
    set colorcolumn=80
    highlight ColorColumn ctermbg=16
endif
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"NeoBundle Scripts
if has('vim_starting')
  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Bundles:
NeoBundle 'tpope/vim-fugitive'              " a Git wrapper so awesome, it should be illegal
NeoBundle 'airblade/vim-gitgutter'          " shows a git diff in the gutter (sign column) and stages/reverts hunks.
NeoBundle 'Lokaltog/vim-easymotion'         " Vim motions on speed!
NeoBundle 'tmhedberg/matchit'               " extended % matching for HTML, LaTeX, and many other languages
NeoBundle 'rking/ag.vim'                    " ag: the_silver_searcher
NeoBundle 'jlanzarotta/bufexplorer'         " buffer explorer
NeoBundle 'jeetsukumaran/vim-buffergator'   " buffer explorer
NeoBundle 'ctrlpvim/ctrlp.vim'              " Fuzzy file, buffer, mru, tag, etc finder
NeoBundle 'scrooloose/nerdtree'             " A tree explorer plugin for vim.
NeoBundle 'scrooloose/nerdcommenter'        " Vim plugin for intensely orgasmic commenting
NeoBundle 'scrooloose/syntastic'            " Syntax checking hacks for vim
NeoBundle 'bling/vim-airline'               " lean & mean status/tabline for vim that's light as air
NeoBundle 'SirVer/ultisnips'                " The ultimate snippet solution for Vim
NeoBundle 'honza/vim-snippets'              " vim-snipmate default snippets
NeoBundle 'Valloric/YouCompleteMe'          " A code-completion engine for Vim
NeoBundle 'leafgarland/typescript-vim'      " Typescript syntax files for Vim
NeoBundle 'evidens/vim-twig'                " Twig syntax highlighting, snipMate, etc.
NeoBundle 'digitaltoad/vim-jade'            " Vim Jade template engine syntax highlighting and indention
NeoBundle 'ntpeters/vim-better-whitespace'  " Better whitespace highlighting for Vim ( :StripWhitespace )
NeoBundle 'sjl/gundo.vim'                   " Vim plugin to visualize your Vim undo tree.
NeoBundle 'flazz/vim-colorschemes'          " vim color schemes collection
NeoBundle 'goldfeld/vim-seek'               " Seek makes navigating long lines effortless, acting like f but taking two characters
NeoBundle 'aquach/vim-http-client'          " Forget your curl today! Make HTTP requests from Vim without wrestling the command line!
NeoBundle 'marijnh/tern_for_vim'            " Tern plugin for Vim (Javascript editign support, completion, ...)
                                            "   Post neobundle install with:  cd ~/.vim/bundle/tern_for_vim/ && npm install
NeoBundle 'suan/vim-instant-markdown'
NeoBundle 'joonty/vdebug'                   " Multi-language DBGP debugger client for Vim (PHP, Python, Perl, Ruby, etc.)
NeoBundle 'sukima/xmledit'                  " A filetype plugin for VIM to help edit XML files 
NeoBundle 'godlygeek/tabular'               " Vim script for text filtering and alignment

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

