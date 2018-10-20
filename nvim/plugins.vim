
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

" Essentials
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'

" git wrapper
Plug 'tpope/vim-fugitive'

" Syntax checkers
Plug 'vim-syntastic/syntastic'
Plug 'w0rp/ale'

" Auto completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'Valloric/YouCompleteMe'

" Colors
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Snippets
Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'

" Text editing
Plug 'tpope/vim-surround'
Plug 'mbbill/undotree'
Plug 'plasticboy/vim-markdown'

" Distraction-free writing
Plug 'junegunn/goyo.vim'
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/limelight.vim'

" R plugins
Plug 'jalvesaq/Nvim-R'
Plug 'gaalcaras/ncm-R'

call plug#end()

