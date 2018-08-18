call plug#begin('~/.local/share/nvim/plugged')

Plug 'tpope/vim-sensible'
Plug 'mhartington/oceanic-next'
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-syntastic/syntastic'
Plug 'w0rp/ale'
Plug 'tpope/vim-fugitive'
Plug 'bling/vim-airline'
Plug 'Raimondi/delimitMate'
Plug 'mklabs/split-term.vim'
Plug 'rust-lang/rust.vim'
Plug 'fishbullet/deoplete-ruby'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/BufOnly.vim'
Plug 'brettanomyces/nvim-terminus'
Plug 'majutsushi/tagbar'
Plug 'ludovicchabant/vim-gutentags'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'ntpeters/vim-better-whitespace'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/neosnippet.vim'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

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

" ************************* tabs/spaces *******************************
set tabstop=4       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.
set shiftwidth=4    " Indents will have a width of 4
set softtabstop=4   " Sets the number of columns for a TAB
set expandtab       " Expand TABs to spaces
set autoindent      " turns it on
set smartindent     " does the right thing (mostly) in programs

" Copy paste
set clipboard+=unnamed

" function! g:ToggleNuMode()
" 	if &nu == 1
" 		set nornu nonumber
" 	else
" 		set number relativenumber
" 	endif
" endfunction
set number
set relativenumber

"Learn VIM correctly
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

" inoremap <Up> <nop>
" inoremap <Down> <nop>
" inoremap <Left> <nop>
" inoremap <Right> <nop>

" Write the default yank register to a file so we can pull it locally
" To do make this use $HOME
nnoremap Y :call writefile(getreg('"', 1, 1), "/home/anujp/.remote_copy")<cr>

"Set leader key to space
nnoremap <SPACE> <nop>
let mapleader=" "
set notimeout

nnoremap <Leader>l <c-w>l
nnoremap <Leader>h <c-w>h
nnoremap <Leader>j <c-w>j
nnoremap <Leader>k <c-w>k

vnoremap <Leader>l <c-w>l
vnoremap <Leader>h <c-w>h
vnoremap <Leader>j <c-w>j
vnoremap <Leader>k <c-w>k
"Tabs
" nnoremap <Leader>t :tabnew<CR>
" nnoremap <Leader>w :q<CR>
" nnoremap <Leader>q :q<CR> Seems to work without mapping
" nnoremap <Leader>] gt
" nnoremap <Leader>[ gT

nnoremap <Leader>d :vsplit<CR>
nnoremap <Leader>D :split<CR>
nnoremap <Leader>t :tabnew<CR>
nnoremap <Leader>w :close<CR>
let g:terminus_use_xterm_title = 1
nnoremap <Leader>T :TerminusOpen<CR>

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
" map  <Leader>f <Plug>(easymotion-bd-f)
" nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
" nmap s <Plug>(easymotion-overwin-f2)

" Move to line
" map <Leader>l <Plug>(easymotion-bd-jk)
" nmap <Leader>l <Plug>(easymotion-overwin-line)

" Move to word
" map  <Leader>s <Plug>(easymotion-bd-w)
" nmap <Leader>s <Plug>(easymotion-overwin-w)

" Search above and below. Commenting in in favor of leader keys to move around
" splits
" map <Leader>j <Plug>(easymotion-j)
" map <Leader>k <Plug>(easymotion-k)

" Theme
syntax enable
syntax on
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
let g:airline_theme='oceanicnext'
colorscheme OceanicNext

" Autocomplete
" let g:python3_host_prog = '/Users/anuj/.pyenv/versions/neovim3/bin/python'
" let g:python_host_prog = '/Users/anuj/.pyenv/versions/neovim2/bin/python'

" Function to source only if file exists {
function! SourceIfExists(file)
	if filereadable(expand(a:file))
		exe 'source' a:file
	endif
endfunction

"Syntastic cpp
" let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'

"Auto chdir
autocmd BufEnter * silent! lcd %:p:h

"Fzf
let g:fzf_layout = { 'up': '~40%' }
" nmap <Leader>o :GFiles<CR>
nmap <Leader>o :GFiles<CR>/
" nmap <Leader>s :Tags<CR>
nmap <Leader>f :Ag<CR>

" Command for git grep
" - fzf#vim#grep(command, with_column, [options], [fullscreen])
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 0,
  \   { 'dir': systemlist('git rev-parse --show-toplevel')[0] }, <bang>0)

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

"nnoremap <silent> <leader>f :call fzf#run({
"  \ 'options': '--expect=ctrl-t,ctrl-x,ctrl-v',
"  \ 'up':      '40%',
"'sink*':   function('<sid>my_fzf_handler')})<cr>


" Terminal mode
" Create new side terminal with T

" http://vimcasts.org/episodes/neovim-terminal-mappings/
tnoremap <Esc> <C-\><C-n>
tnoremap <A-[> <Esc>
"Auto start in insert mode
au TermOpen * setlocal listchars= nonumber norelativenumber
au TermOpen * startinsert
au BufEnter,BufWinEnter,WinEnter term://* startinsert
" au BufWinEnter,WinEnter term://* startinsert

"NerdTree
nnoremap <leader>D :NERDTreeToggle<CR>
call SourceIfExists("~/.config/nvim/local.vim")

"Buffers
" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
" nmap <leader>t :enew<cr>

" Move to the next buffer
" nmap <leader>n :bnext<CR>
nnoremap <leader>] :bnext<CR>
nnoremap <leader>[ :bprevious<CR>

" Move to the previous buffer
" nmap <leader>p :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
function! QuitBuffer()
	if &buftype == 'terminal'
		:bd!
	else
		:bd
	endif
endfunction
"adfix"
nnoremap <leader>q :call QuitBuffer()<CR>

" Show all open buffers and their status
nmap <leader>p :Buffers<CR>

nnoremap <Leader>b :ls<CR>:b<Space>

" http://www.blog.bdauria.com/?p=609
let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#buffer_idx_mode = 1
" let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#show_splits = 1 "enable/disable displaying open splits per tab (only when tabs are opened). >
let g:airline#extensions#tabline#show_buffers = 1 " enable/disable displaying buffers with a single tab
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
" let g:airline#extensions#syntastic#enabled = 1

"Ale
let g:airline#extensions#ale#enabled = 1
"Necessary to parse compile commands
let g:ale_c_parse_compile_commands = 1

" let g:airline_powerline_fonts = 1
" let g:airline_theme='powerlineish'
" set laststatus=2
"Tags
nnoremap <leader>' <c-]>
nnoremap <leader>; <c-t>

"deoplete
let g:deoplete#enable_at_startup = 1


"Neosnippet
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" https://github.com/Shougo/neosnippet.vim
" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif


"LanguageClient
" c++ cquery language client
 let g:LanguageClient_serverCommands = {
 \ 'cpp': ['~/.local/bin/cquery', '--log-file=~/.log/cquery/cq.log'],
 \ 'c': ['~/.local/bin/cquery', '--log-file=~/.log/cquery/cq.log'],
 \ }

let g:LanguageClient_loadSettings = 1 " Use an absolute configuration path if you want system-wide settings
let g:LanguageClient_settingsPath = '~/.config/nvim/settings.json'
set completefunc=LanguageClient#complete
set formatexpr=LanguageClient_textDocument_rangeFormatting()

nnoremap <silent> gh :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> gr :call LanguageClient#textDocument_references()<CR>
nnoremap <silent> gs :call LanguageClient#textDocument_documentSymbol()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
