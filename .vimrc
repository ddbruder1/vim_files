" Pathogen
"{
	" Ignore list
	let g:pathogen_disabled = []

	if v:version < '703'
		call add(g:pathogen_disabled, 'numbers')
	endif

	call pathogen#infect()
	call pathogen#helptags()
"}

"Powerline
"{
	let g:Powerline_symbols = 'fancy'
"}

" set up color scheme
"{
	syntax enable
	set background=dark
	set t_Co=256
	let g:solarized_termcolors=256
	colorscheme solarized
"}

"Session options
"{
	" do not store global and local values in a session
	set ssop-=options

	" do not store folds
	set ssop-=folds"
"}

" Spell check
"{
	setlocal spell spelllang=en_us
	setlocal spellfile+=~/.vim/spell/en.utf-8.add
"}

" Only do this part when compiled with support for autocommands (work in progress)
"{
	if has("autocmd")
		" Enable file type detection
		filetype on

		" Customisations based on house-style (arbitrary)
		autocmd FileType php setlocal ts=4 sts=4 sw=4 noexpandtab
		autocmd FileType html setlocal ts=4 sts=4 sw=4 noexpandtab
		autocmd FileType css setlocal ts=4 sts=4 sw=4 noexpandtab
		autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab
		autocmd FileType markdown setlocal wrap linebreak

		" Treat .rss files as XML
		autocmd BufNewFile,BufRead *.rss setfiletype xml

		"Only add closetag on appropriate file types"
		autocmd FileType html,htmldjango,jinjahtml,eruby,mako let b:closetag_html_style=1
		autocmd FileType html,xhtml,xml,htmldjango,jinjahtml,eruby,mako source ~/.vim/bundle/closetag/plugin/closetag.vim

	endif
"}

" Search
"{
	" clear search with space bar
	nnoremap <silent> <Space> :silent noh<Bar>echo<CR>
	" find as you type search
	set incsearch
	" highlight search terms
	set hlsearch
	" case insensitive search
	set ignorecase
	set smartcase

	command! -nargs=+ MyGrep execute 'silent grep! <args>' | copen 33
"}

"Misc
"{
	" Set directory to current file
	"set autochdir

	" normal mode with jk
	:imap kj <Esc>

	" calculator in insert mode
	imap <silent> <C-C> <C-R>=string(eval(input("Calculate: ")))<CR> 

	" Save files after accidently forgetting to sudo
	cmap w!! w !sudo tee % >/dev/null

	" Insert mode then line feed then normal mode
	let @e='i'

	" Set pastetoggle to <F12>
	set pastetoggle=<F12>

	" Don't create .swp file
	set noswapfile

	" No visual or audible errors
	set noerrorbells visualbell t_vb=
	if has('autocmd')
		autocmd GUIEnter * set visualbell t_vb=
	endif

	" set paste toggle
	noremap <F2> :set invpaste paste?<CR>
	set pastetoggle=<F2>

"}

" File
"{
	" Set utf8 as standard encoding and en_US as the standard language
	set encoding=utf8

	" Use Unix as the standard file type
	set ffs=unix,dos,mac
"} 

"Leader Commands
"}
	" use ,, for omni completion
	let mapleader=","
	inoremap <leader>, <C-x><C-o>
	set completeopt+=longest
	autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
	autocmd InsertLeave * if pumvisible() == 0|pclose|endif

	" Select pasted text
	nnoremap <leader>v V`]
	noremap <F2> :set invpaste paste?<CR>
	set pastetoggle=<F2>

	" put new split window on the right
	set splitright
"}

" Window and file management
"{
	" Use tree-mode as default view
	let g:netrw_liststyle=3 

	" Set tree-mode file ignores
	let g:netrw_list_hide= '.sass-cache,.svn,nbproject'

	" preview window shown in a vertically split
	let g:netrw_preview=1 

	" navigate splits
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l

	" open file in split to right
	map oo o<C-w>L

	" expand current vert split to full width
	map ff <C-w><Bar>

	" sets the min widnow height to 0 - only show the file name
	set wmh=0

	" navigate tabs
	map <C-m> gt

"}

" Comment Block formating
"{
	" auto format comment blocks
	set comments=sl:/**,mb:\ *,elx:\ */
	set formatoptions+=r
"}

" Yank rink config
"{
	let g:yankring_min_element_length = 2
	let g:yankring_history_dir = '~/.vim/yanks'
	let g:yankring_zap_keys = 'f F t T / ?'
	let g:yankring_enabled = 0	" Disables the yankring
"}
" Below from - https://github.com/spf13/spf13-vim/blob/master/.vimrc (partial)

" Vim UI
"{
	" only show 15 tabs
	set tabpagemax=15
	" display the current mode
	set showmode

	" highlight current line
	set cursorline
	" highlight bg color of current line
	hi cursorline guibg=#333333
	" highlight cursor
	hi CursorColumn guibg=#333333

	if has('cmdline_info')
		" show the ruler
		set ruler
		" a ruler on steroids
		set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
		" show partial commands in status line and
		set showcmd
	endif

	" backspace for dummys
	set backspace=indent,eol,start
	" No extra spaces between rows
	set linespace=
	" Line numbers on
	set nu
	" show matching brackets/parenthesis
	set showmatch
	" windows can be 0 line high
	set winminheight=0
	" backspace and cursor keys wrap to
	set whichwrap=b,s,h,l,<,>,[,]
	" lines to scroll when cursor leaves screen
	set scrolljump=5
	" minimum lines to keep above and below cursor
	set scrolloff=3
" }

" Formatting
"{
	" wrap long lines
	set nowrap
	" indent at the same level of the previous line
	set autoindent
	set smartindent
	" don't expand tab to spaces
	set noexpandtab
	" use indents of 4 spaces
	set shiftwidth=4
	" an indentation every four columns
	set tabstop=4
	" let backspace delete indent
	set softtabstop=4
	" do not expand tabs to spaces
	set noexpandtab
" }

" Folding
"{
	"fold based on indent
	set foldmethod=indent
	"deepest fold is 10 levels
	set foldnestmax=10
	"don't fold by default
	set nofoldenable
	set foldlevel=1
"}

" Highligts
"{
	highlight ExtraWhiteSpace ctermbg=darkgray
	" Show trailing whitespace
	" Show spaces before a tab
	" Show tabs that are not at the start of a line:
	" Show spaces used for indenting (so you use only tabs for indenting).
	match ExtraWhitespace /\s\+$\| \+\ze\t\| [^\t]\zs\t\+\|^\t*\zs \+/

"}
" Status Line
"{
	set laststatus=2
"}

" Add add extra files if they exist
"{
	let APPEND = expand("~/.vim/.vimrc_append")
	if filereadable(APPEND)
		source ~/.vim/.vimrc_append
	endif
"}
