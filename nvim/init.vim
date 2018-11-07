
""" General vim settings
""" ----------------------------------------------------------------------------

" Leader key
	let mapleader=","

" swap files recorded in tmp
	set dir=/tmp/

" vv selects the whole line in v.mode
	noremap vv 0v$

" CTRL+L remapped to nohl
	nnoremap <C-l> :nohl<CR><C-l>:echo "Search cleared"<CR>

" Yank from buffer to clipboard
"	set clipboard+=unnamedplus

" Set relative numbers
	nnoremap <C-c> :set norelativenumber<CR>:set nonumber<CR>:echo "Line numbers turned off."<CR>
	nnoremap <C-n> :set relativenumber<CR>:set number<CR>:echo "Line numbers turned on."<CR>
	set relativenumber
	set number

" Case insensitive search
	set ignorecase
	set smartcase

" Word wrapping
	set textwidth=80

" Backspace, cursor, misc
	syntax on
	set backspace=indent,eol,start
	set cursorline
	set mouse=a
	set incsearch

" Use indendation of previous line
	set autoindent

" Set <Enter> key to add new line in vim command mode
	map <Enter> o<ESC>
	map <S-Enter> O<ESC>

" Call language specific tabs
	so ~/dotfiles/nvim/tabs.vim

""" Plugin based settings 
""" ----------------------------------------------------------------------------

" Plugins source
	so ~/dotfiles/nvim/plugins.vim

" Set color scheme
	colo seoul256
	let g:seoul256_background = 234

" NERDTree settings 
	nnoremap <leader>n :NERDTreeToggle<CR>
	let NERDTreeShowHidden=1

" Map fzf Commands to the leader
	nnoremap <leader>c :Commands<CR>

" NERDCommenter
	filetype plugin on "enable it
	let NERDSpaceDelims=1 "add an extra space after comment symbol
 
" Vim airline theme
	let g:airline_theme='bubblegum'

" Distraction free mode function
	function! GoyoMode()
		call goyo#execute(0, [])
		" Goyo
		let g:goyo_width = 100
		let g:goyo_height = 90
		" seoul256
		let g:seoul256_background = 234
		colo seoul256
		" UndoTree
		let g:undotree_CustomUndotreeCmd = 'vertical 32 new'
		let g:undotree_CustomDiffpanelCmd= 'belowright 12 new'
	endfunction
	command! GoyoMode call GoyoMode()
	nmap \p :GoyoMode<CR>

" Disable R_assign <- placement by (_) underscore Nvim-R
	let R_assign = 0

" Map fzf :Files to <leader>-f
	nnoremap <leader>f :Files<CR>

" Use deoplete.
	" let g:deoplete#enable_at_startup = 1
