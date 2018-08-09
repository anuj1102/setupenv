call plug#begin('~/.local/share/nvim/plugged')

Plug 'tpope/vim-sensible'
Plug 'mhartington/oceanic-next'
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'bling/vim-airline'
Plug 'Raimondi/delimitMate'
Plug 'mklabs/split-term.vim'
Plug 'rust-lang/rust.vim'
Plug 'Shougo/deoplete.nvim'
Plug 'fishbullet/deoplete-ruby'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
call plug#end()

"https://github.com/mhartington/oceanic-next
" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Or if you have Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

"Basics
set mouse=a
set tabstop=2
set softtabstop=0 noexpandtab
set shiftwidth=2
set autoindent

"Relative line numbering
:set number relativenumber

"Toggle Line numbers with Shift+l
function! g:ToggleNuMode()
  if &nu == 1
     set nornu nonumber
  else
     set number relativenumber
  endif
endfunction
nnoremap L :call ToggleNuMode()<cr>

" Basic window movement
" Tab + h j k l or tab tab
nnoremap <tab> <c-w>
nnoremap <tab><tab> <c-w><c-w>


" Copy paste
set clipboard+=unnamed

" Write the default yank register to a file so we can pull it locally
" To do make this use $HOME
nnoremap Y :call writefile(getreg('"', 1, 1), "/home/anujp/.remote_copy")<cr>

"Set leader key to space
nnoremap <SPACE> <c-w>
let mapleader=" "

"Tabs
nnoremap <Leader>t :tabnew<CR>
" nnoremap <Leader>q :q<CR> Seems to work without mapping
nnoremap <Leader>] gt
nnoremap <Leader>[ gT

nnoremap <Leader>d :vsplit<CR>
nnoremap <Leader>D :split<CR>
nnoremap  T :terminal<CR>
nnoremap <Leader>= :VTerm<cr>
nnoremap <Leader>- :Term<cr>
nnoremap <Leader>1 1gt
nnoremap <Leader>2 2gt
nnoremap <Leader>3 3gt
nnoremap <Leader>4 4gt
nnoremap <Leader>5 5gt
nnoremap <Leader>6 6gt
nnoremap <Leader>7 7gt
nnoremap <Leader>8 8gt
nnoremap <Leader>9 9gt


" EasyMostion suggested mappings
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
" map <Leader>l <Plug>(easymotion-bd-jk)
" nmap <Leader>l <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" Search above and below. Commenting in in favor of leader keys to move around
" splits
" map <Leader>j <Plug>(easymotion-j)
" map <Leader>k <Plug>(easymotion-k)

" Theme
syntax enable
syntax on
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
colorscheme OceanicNext

" Autocomplete
" let g:python3_host_prog = '/Users/anuj/.pyenv/versions/neovim3/bin/python'
" let g:python_host_prog = '/Users/anuj/.pyenv/versions/neovim2/bin/python'
" let g:deoplete#enable_at_startup = 1

" Function to source only if file exists {
function! SourceIfExists(file)
  if filereadable(expand(a:file))
    exe 'source' a:file
  endif
endfunction

"Syntastic cpp
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'

"Fzf
let g:fzf_layout = { 'up': '~40%' }
" nmap <Leader>o :GFiles<CR>
nmap <Leader>p :GFiles<CR>
" nmap <Leader>s :Tags<CR>
nmap <Leader>f :Ag<CR>

let groot = systemlist('git -C ' . expand('%:p:h') . ' rev-parse --show-toplevel')[0]


command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:40%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)
" Search in current dir
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)

"Don't need this
" nnoremap <leader>d :call fzf#vim#tags(expand('<cword>'), {'options': '--exact --select-1 --exit-0'})<CR>

" Do I need this?
function! s:my_fzf_handler(lines) abort
  if empty(a:lines)
    return
  endif
  let cmd = get({ 'ctrl-t': 'tabedit',
                \ 'ctrl-x': 'split',
                \ 'ctrl-v': 'vsplit' }, remove(a:lines, 0), 'e')
  for item in a:lines
   execute cmd escape(item, ' %#\')
  endfor
endfunction

"noremap <silent> <leader>f :call fzf#run({
"  \ 'options': '--expect=ctrl-t,ctrl-x,ctrl-v',
"  \ 'up':      '40%',
 "'sink*':   function('<sid>my_fzf_handler')})<cr>


" Terminal mode
" Create new side terminal with T

" http://vimcasts.org/episodes/neovim-terminal-mappings/
tnoremap <Esc> <C-\><C-n>
tnoremap <A-[> <Esc> 

"NerdTree
nmap D :NERDTreeToggle<CR>
call SourceIfExists("~/.config/nvim/local.vim")
