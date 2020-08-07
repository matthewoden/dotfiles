" TODO: separate out into packag

if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

augroup PlugUpdates
    autocmd!
    autocmd VimEnter *
    \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    \|   PlugInstall --sync | q
    \| endif
augroup END 

call plug#begin()
" themes / syntax
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot' "lazy-load syntax hilighting and linting
Plug 'jparise/vim-graphql'

"git=
Plug 'airblade/vim-gitgutter' " git gutters on buffers
Plug 'tpope/vim-fugitive' " git integration
Plug 'Xuyuanp/nerdtree-git-plugin' "git status in nerdtree

" workflow
Plug 'preservim/nerdtree' " file explorer
Plug 'gioele/vim-autoswap' " handle swap files the right way, every time.
Plug 'thaerkh/vim-workspace' " Save sessions, buffers
Plug 'jlanzarotta/bufexplorer' " Explore open buffers quickly
Plug 'cloudhead/neovim-fuzzy' " fuzzy file finding with Leader P
Plug 'christoomey/vim-tmux-navigator' "sync tmux and vim

" editing
Plug 'Raimondi/delimitMate' " closes quotes automatically
Plug 'tpope/vim-surround' " surround words with qoutes, parens, etc
Plug 'tpope/vim-repeat' " repeat commands with plugins
Plug 'preservim/nerdcommenter' " comment mappings
Plug 'neoclide/coc.nvim', {'branch': 'release'} " autocomplete/intellisense

" fennel - one day, I'll write you...
Plug 'guns/vim-sexp', {'for': ['fennel']}
Plug 'tpope/vim-sexp-mappings-for-regular-people', {'for': ['fennel']}
Plug 'kovisoft/paredit', {'for': ['fennel']}
Plug 'bakpakin/fennel.vim', {'for': 'fennel'}
Plug 'hkupty/iron.nvim'
call plug#end()


" Lua plugins!
luafile $HOME/.config/nvim/plugins.lua

"""
" Theme
"""
colorscheme dracula
set background=dark
set termguicolors
set guifont=SF\ Mono\ Powerline

syntax on
set ruler  " alwayts show cursor position
set number          " show numbers
set relativenumber  " show relative line distance, and reveal current line number"
set numberwidth=5   " 5 columns of numbers
set mouse=nv

" convert tabs to spaces
" indent with 4 spaces
" when shifting, indent with 4 spaces
" indent 4 spaces when I press tab
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
set cursorline      " Make line cursor on be highlighted
set autoread        " read file if changed outside of vim
set noerrorbells    " do not beep on invalid commands
set backspace=indent,eol,start   " Backspace deletes like most programs in insert mode
set history=1000    " increase history
set showcmd         " display incomplete commands
set laststatus=2    " Always display the status lino
set autowrite       " Automatically :write before running commands
set lazyredraw      " draw when needed, don't update during macro execution
set hidden          " hide files, rather than closing
set wildmenu        " display complete options as a menu

set undofile
set undodir^=~/.vim/undo//

" always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes
set ruler           " show the cursor position all the time
" speed up syntax highlighting
set nocursorcolumn " do not highlight the current column

" softwrap
set wrap
set linebreak
set nolist
set formatoptions=qrn1
set colorcolumn=+1

set autoindent
set showmatch
set updatetime=300 "default is 4 seconds -- too slow.

" better project search
set path+=**                                                                    
set wildignore+=**/node_modules/** 


" Time out on key codes but no mappings.
set notimeout
set ttimeout
set ttimeoutlen=10

" Use one space, not two, after punctuation.
set nojoinspaces


" Better Completion
set complete=.,w,b,u,t

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Fixing the & command
nnoremap & :&&<CR>
xnoremap & :&&<CR>

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" autosave on leave
augroup autosave_buffer
  au!
  au FocusLost,FocusGained,BufLeave,InsertLeave * silent! :wa " TODO: write session.
augroup END

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
augroup CursorStore
    autocmd!
    autocmd BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") |
      \	exe "normal! g`\"" |
      \ endif
augroup END

set swapfile
set directory^=~/.vim/swap//

" protect against crash-during-write
set writebackup
" but do not persist backup after successful write
set nobackup
" use rename-and-write-new method whenever safe
set backupcopy=auto
" patch required to honor double slash at end
if has("patch-8.1.0251")
	" consolidate the writebackups -- not a big
	" deal either way, since they usually get deleted
	set backupdir^=~/.vim/backup//
end

" use global clipboard on osx
set clipboard=unnamedplus

" add jsonc support
augroup jsonc_support
    autocmd!
    autocmd FileType json syntax match Comment +\/\/.\+$+
augroup END

""""
" nerdtree
"""
" Open NERDTree automatically when vim starts up on opening a directory?

augroup nerdtree_commands
    autocmd!
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

    " Close NERDTree if last and only buffer
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END

" show hidden files, ignore mac files
let NERDTreeShowHidden=1
let NERDTreeIgnore =[".DS_Store"]

""""
" Sessions
"""""""""""
let g:workspace_autosave = 0 " TODO - write better autosave
let g:workspace_session_directory = $HOME . '/.vim/sessions/'
set sessionoptions-=blank

"""""
" Key Bindings
"""""""""""
" map leader to space
:let mapleader = "\<Space>"
" local leader to slash
:let maplocalleader = "\\"
"nnoremap <Leader>s :ToggleWorkspace<CR>

" fuzzy find files
noremap <Leader>p :FuzzyOpen<CR>
noremap <C-f> :FuzzyGrep<CR>
" better vertical movement
nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')

nnoremap <Leader>mv :Move<SPACE>
nnoremap <Leader>de :Delete<CR>
nnoremap <Leader>n :NERDTreeToggle<CR>

" nnoremap <Leader>q :q<CR>
nnoremap <Leader>w :w!<CR> 
" nnoremap <Leader>q :q!<CR>

" <Ctrl-u> and <Ctrl-d> also center the screen
nnoremap <silent> <C-u> <C-u>zz
nnoremap <silent> <C-d> <C-d>zz

""
"CoC
""""
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
"
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)<Paste>

" goto deinition
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Apply codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
"inoremap <silent><expr> <c-space> coc#refresh()

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

augroup coc_highlight
    autocmd!
    " Highlight the symbol and its references when holding the cursor.
    autocmd CursorHold * silent call CocActionAsync('highlight')
augroup END

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup coc_colors
    autocmd!
    " required to keep color syntax after sourcing vimrc.
    autocmd ColorScheme * 
                \ hi CocErrorSign  ctermfg=Red guifg=#ff0000 | 
                \ hi CocWarningSign  ctermfg=Brown guifg=#ff922b |
                \ hi CocInfoSign  ctermfg=Yellow guifg=#fab005 |
                \ hi CocHintSign  ctermfg=Blue guifg=#15aabf |
                \ hi CocUnderline  cterm=underline gui=underline
augroup END

"""
" Statusline
"""""
let g:airline_powerline_fonts = 1
let g:airline_right_sep=''
let g:airline_left_sep=''
"let g:airline_left_sep=''
"let g:airline_right_sep="\uE0B3"

"""
" NerdCommenter
""""""""""""""
filetype plugin on
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1


"""""""""""""""""""
" Fennel
"""""""""""""""""""
augroup Fennel_Support
    au!
    " Enable Paredit for fennel files
    au FileType fnl call PareditInitBuffer()
augroup END

let g:sexp_enable_insert_mode_mappings = 0
let g:sexp_filetypes = 'fennel'
