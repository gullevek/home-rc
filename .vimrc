execute pathogen#infect()
"set encoding=utf-8
set nocompatible
set hidden " background buffers
set history=1000
set wildmenu " tab complete like bash
" set ignorecase " ignore case for search
" set smartcase " but if capital letter, make case sensitive again
set scrolloff=3 " keep 3 lines before/after
set bs=2 " backspace command, alt: indent,eol,start
set noexpandtab
set tabstop=4
set softtabstop=4 " soft tab, only important if tabstop > than softtabstop
set shiftwidth=4 " if > or < is used
set ruler
syn on
filetype plugin indent on " eg, sets spaces insted of tabs for python
set autoindent
" set smartindent
set laststatus=2 " always show bottom info line
"set cmdheight=2 " bottom info bar hight, keep at 1 for the moment, any
set showtabline=1 " top tab bar, only if tabs are used
set incsearch " show match during search
set showmatch
set showcmd
set showmode
set hlsearch
set pastetoggle=<F11>
set nolbr
"set cursorline " highlight cursor pos
set ttyfast " smoother changes
"set t_Co=256
set whichwrap=b,s,h,l,<,>,[,] " move freely between files
" default listchars
set listchars=tab:\→\ ,trail:▫︎,nbsp:•,eol:¶,extends:»,precedes:«
" show break in no wrap lines
"set showbreak=>\
let &showbreak = '↳ '
let g:bufferline_echo=0
let g:bufferline_solo_highlight=1
" line number column different
autocmd ColorScheme * highlight LineNr ctermfg=grey
"autocmd ColorScheme * highlight CursorLineNr ctermbg=black ctermfg=darkyellow
"autocmd ColorScheme * highlight CursorLine ctermbg=darkgrey
"autocmd ColorScheme * highlight SignColumn ctermbg=black
" better search highlight
autocmd ColorScheme * highlight Search ctermfg=black ctermbg=yellow
" highlight white spaces
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red
" highlight white spaces at the end of a line
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
" git gutter background color
"let g:gitgutter_override_sign_column_highlight=0
" always show sign column
"set signcolumn=yes
let g:NERDTreeMapMenu='M'
let g:SignatureMarkTextHLDynamic=1

"colorscheme desert
"colorscheme badwolf
colorscheme default
"colorscheme afterglow
"colorscheme Tomorrow

"let g:airline_theme='sol'
"let g:airline_theme='light'
let g:airline_theme='dark'
"let g:airline_solarized_bg='dark'
"let g:airline_tomorrow_bg='light'
let g:airline_powerline_fonts=0
" alternative buffer/tab bar on top
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#tab_nr_type = 2
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffer_min_count = 2
let g:airline#extensions#tabline#tab_min_count = 1
let g:airline#extensions#tabline#left_sep = '▶'
let g:airline#extensions#tabline#left_alt_sep = '>'
let g:airline#extensions#tabline#right_sep = '◀'
let g:airline#extensions#tabline#right_alt_sep = '<'
" more symbols definers for bottom line
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

nnoremap <F4> :NERDTreeToggle<cr>
nnoremap <F5> :UndotreeToggle<cr>

" Show Numbers On/Off
map <F9> :call ToggleRelNumber()<CR>
map <F10> :call Number_on_off()<CR>
map <F12> :call List_on_off()<CR>

let number_mode = 0 " 0 = normal, 1 = show number
let list_mode = 0 " 0 = normal, 1 = show tabs
:highlight LineNr ctermfg=grey

function! ToggleRelNumber()
	if(&relativenumber == 1)
		set norelativenumber
	else
		set relativenumber
	endif
endfunc

func! Number_on_off()
	if g:number_mode == 0
		set nu
		let g:number_mode = 1
	else
		set nonu
		let g:number_mode = 0
	endif
	return
endfunc

func! List_on_off()
	if g:list_mode == 0
		set listchars=tab:\→\ ,trail:▫︎,nbsp:•
		set list
		let g:list_mode = 1
	else
		set listchars=tab:\→\ ,trail:▫︎,nbsp:•,eol:¶,extends:»,precedes:«
		set nolist
		let g:list_mode = 0
	endif
	return
endfunc

" just for testing
function! ShowColors()
	let num = 255
	while num >= 0
		exec 'hi col_'.num.' ctermbg='.num.' ctermfg=white'
		exec 'syn match col_'.num.' "ctermbg='.num.':...." containedIn=ALL'
		call append(0, 'ctermbg='.num.':....')
		let num = num - 1
	endwhile
endfunction

" tab keys
map <C-t><up> :tabr<cr>
map <C-t><down> :tabl<cr>
map <C-t><left> :tabp<cr>
map <C-t><right> :tabn<cr>

hi TabLine ctermbg=white
hi TabLineFill ctermfg=black ctermbg=white
hi TabLineSel ctermbg=red ctermfg=white

hi statusline ctermbg=black ctermfg=darkyellow
hi statuslineNC ctermbg=yellow ctermfg=darkgrey
hi ModeMsg cterm=bold ctermfg=yellow ctermbg=red

set statusline=%f\ %#error#%m%*[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%#error#%r%*%y%=%-20([%n]\ %c%V,%l/%L%)\ [%o]\ %p%%
"%#error#%{&paste?'[paste]':''}%*

" update curring vim with new vimrc settings
map ,u :source ~/.vimrc<cr>
" turn off search highlighted words
noremap ,<space> :nohlsearch<CR>
" highlight last inserted text
nmap gV `[v`]

if exists("+showtabline")
	function! MyTabLine()
		let s = ''
		let t = tabpagenr()
		let i = 1
		while i <= tabpagenr('$')
			let buflist = tabpagebuflist(i)
			let winnr = tabpagewinnr(i)
			let s .= '%' . i . 'T'
			let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
			let s .= ' ['
			let s .= i . ':'
			let s .= winnr . '/' . tabpagewinnr(i,'$')
			let s .= ' %*'
			let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
			let file = bufname(buflist[winnr - 1])
			let file = fnamemodify(file, ':p:t')
			if file == ''
				let file = '[No Name]'
			endif
			let s .= '%m'
			let s .= file
			let s .= '] '
			let i = i + 1
		endwhile
		let s .= '%T%#TabLineFill#%='
		let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
		return s
	endfunction
	set stal=1
	set tabline=%!MyTabLine()
endif

" folding
" optional set fdm=manual
inoremap <F8> <C-O>za
nnoremap <F8> za
onoremap <F8> <C-C>za
vnoremap <F8> zf
" turn off fold depth side bar (2)
map <F7> :call FoldSideBar_on_off()<CR>
let foldsidebar_mode = 0

func! FoldSideBar_on_off()
	if g:foldsidebar_mode == 0
		set fdc=2
		let g:foldsidebar_mode = 1
	else
		set fdc=0
		let g:foldsidebar_mode = 0
	endif
	return
endfunc

" set cursorline on off
map <F6> :call Cursorline_on_off()<CR>
let cursorline_mode = 0

func! Cursorline_on_off()
	if g:cursorline_mode == 0
		set cursorline
		let g:cursorline_mode = 1
	else
		set nocursorline
		let g:cursorline_mode = 0
	endif
	return
endfunc

" turn on off no wrap break char
map <F3> :call ShowBreak_on_off()<CR>
func! ShowBreak_on_off()
	if (&showbreak == '')
		let &showbreak = '↳ '
	else
		let &showbreak = ''
	endif
	return
endfunc

" buffer left/right quick
map ]b :bn<cr>
map [b :bp<cr>
