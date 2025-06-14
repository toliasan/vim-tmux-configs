call plug#begin('~/.config/nvim/autoload')

  Plug 'preservim/nerdtree'
	Plug 'Xuyuanp/nerdtree-git-plugin'
 	Plug 'ryanoasis/vim-devicons'

	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'

	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	 
	Plug 'Mofiqul/dracula.nvim'

	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'jiangmiao/auto-pairs'
	Plug 'frazrepo/vim-rainbow'
	Plug 'airblade/vim-gitgutter'
	" Plug 'tmhedberg/matchit'

	Plug 'prettier/vim-prettier', {
        \ 'do': 'yarn install',
        \ 'branch': 'release/0.x',
				\ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html']
  			\ }

	Plug 'moll/vim-node'
	Plug 'pangloss/vim-javascript'
	Plug 'leafgarland/typescript-vim'
	Plug 'maxmellon/vim-jsx-pretty'
	Plug 'peitalin/vim-jsx-typescript'
	Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
	Plug 'jparise/vim-graphql'
	Plug 'nvie/vim-flake8'
	Plug 'bam9523/vim-decompile'
	Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
	Plug 'tpope/vim-commentary' " Can read more about this plug lower
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	Plug 'mfussenegger/nvim-dap'
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/nvim-cmp'

call plug#end()

"  : for command mode
"  ! to run a shell command
"  % to refer to the file in the current buffer
"  :p to use the full path of the current file
"  Ex: :! git blame -L 14 %
"  Shell command refer to current file - %

colorscheme dracula
set background=dark
set encoding=UTF-8

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50
set incsearch  "alias 'is' "Set incremental search. When you type "/to" will be highlighted first occurence of your searching pattern
set hlsearch "alias 'hls' "Set highlighted search. All matching patterns are highlighted. Proplem is highlight still highlight after search, to stop highlighting press (:nohls)
set ignorecase "Ignoring case when searching
set smartcase "Add case sensitive search if there are uppercase in search pattern
set showcmd "Show on the right bottom corner command you typing ex(2yw)
set scrolloff=3 "Show five line on the edge of curcor
set nofixendofline "Vim command to stop adding extra lines at the end of file
syntax on " Without this line html syntax is not highlighted (this line is not help!)

set noro " Default to not read-only in vimdiff. With "set noro" can edit

"Numbering of lines
set number
set numberwidth=2 "In command mode on tab showing autocompletion
set wildmenu "Enable mouse mode in all modes
set mouse=a

"Tabs
set tabstop=2 "Set tab width
set shiftwidth=2 "Set shift width (shift->)
" set expandtab "Add spaces when tab
set autoindent "Copy indentation when you press (o) go to new line
set smartindent "Add indentation when you create block of code with curly braces etc.
"Disable backups and swap files
set nobackup
set nowritebackup
set noswapfile

autocmd FileType java setlocal shiftwidth=4
autocmd FileType java setlocal softtabstop=4
autocmd FileType java setlocal tabstop=4
autocmd FileType java setlocal shiftwidth=4

au FileType java let browser="htmlview" 

map <C-\> :NERDTreeToggle<CR>
"Fix NERDTreeFind and NERDTreeFocus!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
map <S-\> :NERDTreeFind<CR>
"map <A-\> :NERDTreeFocus<CR>
map <C-p> :Files<CR>
map <Leader>b :Buffers<CR>
map <Leader>h :History<CR>

" Tabs
nmap <C-L> gt<CR>
nmap <C-H> gT<CR>
nmap <C-N> :tabedit<CR>
nmap <C-A-H> :-tabmove<CR>
nmap <C-A-L> :+tabmove<CR>

nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}

"Go to definition/implementation shortcuts
nmap gd :call CocActionAsync('jumpDefinition')<CR>
nmap gh :call CocActionAsync('doHover')<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" 
" "Changing cursor behavior for vim | no need because nvim already did it by default
" let &t_SI = "\<esc>[5 q" "SI - Insert mode
" let &t_SR = "\<esc>[5 q" "SR - Replace mode
" let &t_EI = "\<esc>[1 q" "EI - Normal mode

let g:airline_powerline_fonts = 1
let g:airline_theme="zenburn"
let g:rainbow_active=1

"Coc extensions declared here instead of implicit CocInstall
"Auto format on save coc set in config by command ":CocConfig"
"Coc-action can auto-import modules from anywhere
	" \ 'coc-graphql',
let g:coc_global_extensions = [
	\ 'coc-tsserver',
	\ 'coc-actions',
	\ 'coc-html',
	\ 'coc-css',
	\ 'coc-highlight',
	\ 'coc-json',
	\ 'coc-yaml',
	\ 'coc-xml',
	\ '@yaegassy/coc-nginx',
	\ 'coc-rls',
	\ 'coc-sh',
	\ 'coc-sql',
	\ 'coc-git',
	\ 'coc-prettier',
	\ 'coc-eslint',
	\ 'coc-pyright',
	\ 'coc-java',
	\ 'coc-java-debug',
	\ 'coc-go',
	\ 'coc-lua',
\ ]

let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.yml,*.html silent! PrettierAsync
" silent! - added to stop showing error on each save when there is no prettier
" Grep with ":Rg"

" Comments
" Comment stuff out. Use gcc to comment out a line (takes a count), gc to comment out the target of a motion (for example, gcap to comment out a paragraph), gc in visual mode to comment out the selection, and gc in operator pending mode to target a comment. You can also use it as a command, either with a range like :7,17Commentary, or as part of a :global invocation like with :g/TODO/Commentary. That's it

"Some cheatsheet of shortcuts
" to write 10 asterisks ********** by commans need to write 80(i)*(C-c)
" to find character on the line press (f)[letter] ex: (f)a
" IMPORTANT also can find spaces ex: (f)[space]
" to find character from right to left just press F[letter]
" to repeat find character press (;)
" to repeat find character in opposite way press (,)
" to find character and move cursor before found letter press (t)[letter]
" to find character and move back press (t)[letter]
" to move view from current line to the top press (z)return
" to move current line to the center of screen predd (zz)
" to search matching pattern press (/[pattern]) When you want to change
" occurence and apply it to rest of occurences press (n.) ex: (/from) (cw)to
" after that press (n.) and previous changes will apply to next occurence
" to search nearest match (pattern is where cursor currently now) press (*)
" to search nearest matching pattern in reversed way press (#)
" to find and replace through file with confirmation press (:%s/from/to/gc)
" to check name of opened file press (Ctrl-g)
" to chekc full path to opened file press (1-Ctrl-g)
" to minimize vertically window press (Ctrl-w_)
" to minimize horizontally window press (Ctrl-w|)
" to set window size equally press (Ctrl-w=)
"
"nnoremap ö <esc>         " Remap in Normal mode
"inoremap ö <esc>         " Remap in Insert and Replace mode
"vnoremap ö <esc>         " Remap in Visual and Select mode
"xnoremap ö <esc>         " Remap in Visual mode
"snoremap ö <esc>         " Remap in Select mode
"cnoremap ö <C-C>         " Remap in Command-line mode         
"onoremap ö <esc>         " Remap in Operator pending          mode
                                                               
                                                               
                                                               
                                                               
 "set nocompatible            " disable compatibility to old-time vi                                                              
 "set showmatch               " show matching 
 "set ignorecase              " case insensitive 
 "set mouse=v                 " middle-click paste with 
 "set hlsearch                " highlight search 
 "set incsearch               " incremental search
 "set tabstop=4               " number of columns occupied by a tab 
 "set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
 "set expandtab               " converts tabs to white space
 "set shiftwidth=4            " width for autoindents
 "set autoindent              " indent a new line the same amount as the line just typed
 "set number                  " add line numbers
 "set wildmode=longest,list   " get bash-like tab completions
 "set cc=80                  " set an 80 column border for good coding style
 "filetype plugin indent on   "allow auto-indenting depending on file type
 "syntax on                   " syntax highlighting
 "set mouse=a                 " enable mouse click
 "set clipboard=unnamedplus   " using system clipboard
 "filetype plugin on
 "set cursorline              " highlight current cursorline
 "set ttyfast                 " Speed up scrolling in Vim
 "set spell                 " enable spell check (may need to download language package)
 "set backupdir=~/.cache/vim " Directory to store backup files.
 "set noswapfile            " disable creating swap file



" to save vim session use command:
" :mksession ~/mysession.vim
" Then later you can source that vim file and you'll have your old session back:
" :source ~/mysession.vim
" or open vim with the -S option:
" $ vim -S ~/mysession.vim
