" Plugins

call plug#begin(stdpath('data') . '/plugged')

    " Plug 'dense-analysis/ale' " asynchronous static analysis
    Plug 'sheerun/vim-polyglot' " curated language packs
    " Plug 'prettier/vim-prettier' " make things pretty
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " fuzzy file finder
    Plug 'junegunn/fzf.vim' " usefully packaged fzf commands
    Plug 'janko/vim-test' " run file tests with command
    " Plug 'SirVer/ultisnips' " snippet
    Plug 'benmills/vimux' " vim integration with tmux
    Plug 'tpope/vim-projectionist' " project setup files
    Plug 'tpope/vim-commentary' " (un)comment code quickly
    " Plug 'tpope/vim-surround' " working with surrounding symbols
    Plug 'tpope/vim-vinegar' " file traversing with -
    Plug 'tpope/vim-fugitive' " git git git
    Plug 'rbong/vim-flog' " git tree viewer (needs fugitive)
    " Plug 'tpope/vim-endwise' " Add ends to things
    Plug 'tpope/vim-eunuch' " Unix commands in vim
    Plug 'tpope/vim-abolish' " Abolish + Subvert for better matching
    Plug 'tpope/vim-unimpaired' " [p etc
    Plug 'tpope/vim-repeat' " better .
    Plug 'vim-airline/vim-airline' " Bottom bar
    Plug 'myusuf3/numbers.vim'

    " Color schemes....
    " Plug 'jacoborus/tender.vim'
    Plug 'nanotech/jellybeans.vim'
    Plug 'vim-airline/vim-airline-themes'

    " COC
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
    Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
    Plug 'neoclide/coc-tslint-plugin', {'do': 'yarn install --frozen-lockfile'}
    Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
    Plug 'iamcco/coc-vimlsp', {'do': 'yarn install --frozen-lockfile'}

" Initialize plugin system
call plug#end()

let g:coc_node_path = '/usr/local/bin/node'

if (has("termguicolors"))
 set termguicolors
endif
syntax enable
colorscheme jellybeans
" set airline theme
let g:airline_theme='jellybeans'

set title
set encoding=utf-8

" Hide buffers
set hidden

set tabstop=2
set shiftwidth=2
set expandtab

set mouse=a " Mouse support

" line numbering
set number

" Automatically update contents of vim if file has changed
set autoread

" jk - escape / save
inoremap <silent> jk <esc>
inoremap <silent> kj <esc>
nnoremap <silent> jk :w<CR>
nnoremap <silent> kj :w<CR>

" Strip trailing whitespace
autocmd BufWritePre * %s/\s\+$//e

" Turn off line wrapping
set nowrap

" Make Y consistent with D and C
nnoremap Y y$

" set timeoutlen=200
set timeoutlen=200 ttimeoutlen=0

set magic          " Changes the way backslashes work in search patterns
set ignorecase     " Ignore case when searching
set smartcase      " Try and be smart about cases when searching
set incsearch      " Shows match for partly typed search commands
set hlsearch       " Highlights search results

" Use <C-L> to clear the highlighting of :set hlsearch.
nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>

set laststatus=2
set ruler
set wildmenu

set noequalalways " prevent splits automatically equalizing in size

nnoremap <silent> <leader>. :A<CR>

" Space is generally pretty useless, remapping to page-up / page-down
" nnoremap <Space> <C-d>
" nnoremap <C-Space> <C-u>


" {{{ LanguageClient

    " let g:LanguageClient_serverCommands = {
    "     \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    "     \ 'rust': ['~/.nix-profile/bin/rls'],
    "     \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    "     \ 'python': ['/usr/local/bin/pyls'],
    "     \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
    "     \ }

    " nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
    " nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
    " nnoremap <silent> cd :call LanguageClient#textDocument_rename()<CR>

    " nnoremap <silent> K  :ALEHover<CR>
    " nnoremap <silent> gd :ALEGoToDefinition<CR>
    " nnoremap <silent> cd :ALERename<CR>
" }}}

" {{{ FZF

    " setup fuzzy finder to work like ctrlp
    let $FZF_DEFAULT_COMMAND = 'rg --files' " Use ripgrep
    nnoremap <C-p> :Files<CR>

    " project search with \a
    nnoremap <leader>a :Rg<space>

" }}}

" " {{{ ALE

"     let g:ale_sign_column_always = 1

" " }}}
"

" {{{ COC

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming. -- cd for change definition
nmap cd <Plug>(coc-rename)

" Formatting selected code. -- p for prettier ;-)
xmap <leader>p  <Plug>(coc-format)
nmap <leader>p  <Plug>(coc-format)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

"}}}

" {{{ Airline


    " Airline separators look rubbish wihtout powerline...
    let g:airline_left_sep=' '
    let g:airline_right_sep=' '
    let g:airline_mode_map = {
            \ '__' : '-',
            \ 'n'  : 'N',
            \ 'i'  : 'I',
            \ 'R'  : 'R',
            \ 'c'  : ':',
            \ 'v'  : 'v',
            \ 'V'  : 'V',
            \ 's'  : 's',
            \ 'S'  : 'S',
            \ }
     let g:airline#extensions#whitespace#enabled = 0

    " " Shell Prompt
    " let g:promptline_powerline_symbols = 0
    " let g:promptline_preset = {
    "     \'a'    : [ '$USER' ],
    "     \'b'    : [ promptline#slices#cwd() ],
    "     \'c'    : [ promptline#slices#vcs_branch() ],
    "     \'warn' : [ promptline#slices#last_exit_code() ]}
    " let g:promptline_theme = 'jelly'
    " let g:promptline_symbols = {
    "             \ 'left'       : '',
    "             \ 'left_alt'   : ' ',
    "             \ 'dir_sep'    : '/',
    "             \ 'truncation' : '...',
    "             \ 'vcs_branch' : ' ',
    "             \ 'space'      : ' '}

" }}}
"
"


" Source vimrc on save
augroup source_vimrc_on_save
    autocmd!
    autocmd bufwritepost init.vim source $MYVIMRC
augroup END
