" Pathogen
"{
    call pathogen#runtime_append_all_bundles()
    call pathogen#helptags()
"}

" set up color scheme
"{
    syntax enable
    set background=light
    set t_Co=256
    let g:solarized_termcolors=256
    colorscheme solarized
"}

" Spell check
"{
    set spell
    setlocal spellfile+=~/.vim/spell/en.utf-8.add
"}

" Mouse
"{
    " Enable mouse everywhere
    set mouse=a
    " Hide mouse pointer while typing
    set mousehide
    set mousemodel=popup
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
    " jumps to search word as you type
    set incsearch
    " find as you type search
	set incsearch
    " highlight search terms
	set hlsearch
    " case insensitive search
	set ignorecase
    " set working dir to current file
	set smartcase
"}

"Misc
"{
    " Set directory to current file
    set autochdir

    " normal mode with jk
    :imap jk <Esc>

    " calculator in insert mode
    imap <silent> <C-C> <C-R>=string(eval(input("Calculate: ")))<CR> 

    " Save files after accidently forgetting to sudo
    cmap w!! w !sudo tee % >/dev/null
"}

" Window and file management 
"{
    " Use tree-mode as default view
    let g:netrw_liststyle=3 

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
"}

" Comment Block formating
"{
    " auto format comment blocks
    set comments=sl:/**,mb:\ *,elx:\ */
    set formatoptions+=r
"}

" Below from - https://github.com/spf13/spf13-vim/blob/master/.vimrc (partial)

" Vim UI 
"{
	set tabpagemax=15 				" only show 15 tabs
	set showmode                   	" display the current mode

	set cursorline  				" highlight current line
	hi cursorline guibg=#333333 	" highlight bg color of current line
	hi CursorColumn guibg=#333333   " highlight cursor

	if has('cmdline_info')
		set ruler                  	" show the ruler
		set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
		set showcmd                	" show partial commands in status line and
	endif

	set backspace=indent,eol,start	" backspace for dummys
	set linespace=0					" No extra spaces between rows
	set nu							" Line numbers on
	set showmatch					" show matching brackets/parenthesis
	set winminheight=0				" windows can be 0 line high 
	set whichwrap=b,s,h,l,<,>,[,]	" backspace and cursor keys wrap to
	set scrolljump=5 				" lines to scroll when cursor leaves screen
	set scrolloff=3 				" minimum lines to keep above and below cursor
" }

" Formatting 
"{
	set nowrap                     	" wrap long lines
	set autoindent                 	" indent at the same level of the previous line
    set smartindent
	set shiftwidth=4               	" use indents of 4 spaces
   	set et!                         " turn off tab to spaces
	set tabstop=4 					" an indentation every four columns
	set softtabstop=4 				" let backspace delete indent
" }
