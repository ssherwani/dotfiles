set nocompatible       " to use vim rather vi
set ruler              " Display cursor position in the bottom right-hand 
                       " section of the screen.

set showmode           " Show when you are in insert mode
set laststatus=2

set virtualedit=all
set cursorline         " Highlight current line the cursor is on

set number             " Display the line number on the left
" Number of columns are used on the screen
if exists('+colorcolumn')
    set colorcolumn=80
  else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
 endif

" Autmatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" display hidden characters
set invlist
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set list

set hlsearch
set ignorecase
set incsearch
set smartcase
set mat=5             " Bracket blinking.

set cf                " Enable error files & error jumping.

" Disable backup nd swap files - for file system watchers
"set nobackup
"set nowritebackup
"set noswapfile
set dir=~/tmp


set shell=/bin/bash


set history=700       " Number of things to remember in history.
set undolevels=1000


set nolazyredraw      " Don't repaint when scripts are running

"" Editing
set nojoinspaces      " no double spaces
set showmatch         " Briefly jump to the matching bracket
set matchtime=1       " For .1 seconds
set backspace=indent,eol,start


set tabstop=4           " 1 tab = x spaces
set shiftwidth=4        " (used on auto indent)
"set shiftround
set softtabstop=4       " 4 spaces as a tab for bs/del
set expandtab           " Replaces a <TAB> with spaces 
set smarttab            " Uses shiftwidth instead of tabstop at start of lines
                        " (use Ctrl-V+Tab to insert a tab)
set copyindent
"set cinkeys-=0#      " Free # from the 1st column: 
                     " It's for more than preprocessors!
"set cino=^-2
"set autoindent         " Indent like previous line
set smartindent         " Try to be clever about indenting
"set cindent            " Really clever indenting

"set textwidth=0
"set nowrap
set linebreak           " Show wrap at word boundaries and preface wrap with >>
set showbreak=>>



"Code folding"
set foldenable
set fdm=manual       " then make a visual selection and press zf
set foldcolumn=2


"Sessions"
set ssop-=options    " do not store global and local values in a session
set ssop-=folds      " do not store folds 


autocmd BufWinEnter * silent loadview
autocmd BufWinLeave * mkview


set wildmode=longest:full
set wildmenu
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*.pyc
set wildignore+=*.class  "java/scala class files


" Send more characters for redraws
set ttyfast
set mouse=a " paste clipboard to vim

set ttymouse=xterm2
"set pastetoggle=<F3>
set clipboard+=unnamed
set hidden


"" Add recently accessed projects menu (project plugin)
set viminfo^=\!


set encoding=utf-8
set fileencodings=utf-8

set tags=./tags,tags;
"set autochdir "the working directory's always the same as the file you're editing


"set rtp+=~/.vim/bundle/vundle/
call pathogen#infect('~/.vim/bundle')

" Color Scheme
set t_Co=256          " use 256 color terminal

filetype off
syntax on
filetype plugin on


"" Ultisnips
let g:UltiSnipsSnippetDirectories=["UltiSnips"]
" Trigger configuration. Do not use <tab> YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsListSnippets="<s-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"" Syntastic plug-in
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': ['java','ruby','python'],
                           \ 'passive_filetypes': [] }
let g:syntastic_check_on_open=1
let g:syntastic_aggregate_errors=1
let g:syntastic_always_populate_loc_list=1
let g:syntastic_enable_signs=1
let g:syntastic_auto_jump=1
let g:syntastic_check_on_wq = 0

let g:syntastic_java_javac_config_file_enabled=1
let g:syntastic_java_checkers = ['javac', 'checkstyle']
let g:syntastic_python_checkers = ['python', 'flake8', 'pylint']

"" Powerline plugin
if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=250
        au InsertLeave * set timeoutlen=1000
    augroup END
endif


""""personal keymaps""""

inoremap ;; <Esc>
"inoremap <C-b> <Esc>
nnoremap <Sapce> za
vmap <C-C> "+y
"map <F1>  :source $HOME/.vimrc<CR>
nnoremap <F2> :SyntasticCheck<CR>
nnoremap <F4> :buffers<CR>:buffer<space>

" reloads the file
map <F5> :e<CR>

" Rebind <Leader> key
""let mapleader = "\"
