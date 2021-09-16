" Nerdtree
map <C-b> :NERDTreeToggle<CR>
map <C-i> :NERDTreeFind<CR>
let g:NERDDefaultAlign = 'left'
let g:NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1
let NERDTreeShowLineNumbers=1
let g:NERDTreePatternMatchHighlightFullName = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1


"Gruvbox
syntax enable
set termguicolors
set background=dark
colorscheme dracula
highlight Normal ctermbg=None
" let g:airline_theme = "dracula"
if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

"vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#buffer_nr_show = 1

" ALE
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['eslint'],
\   'cpp': ['g++'],
\   'python': ['pylint']
\}
let g:ale_fixers = {
\   '*': ['remove_trail thing_lines', 'trim_whitespace','prettier'],
\   'python': ['black']
\}
let g:ale_linters_explicit = 1
let g:airline#extensions#ale#enabled = 1
nmap <leader>df :ALEGoToDefinition<CR>

"coc.nvim
let g:coc_global_extensions = ['coc-tsserver', 'coc-css', 'coc-json', 'coc-clangd', 'coc-pyright']
" " TextEdit might fail if hidden is not set.
set hidden

" " Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" " Give more space for displaying messages.
set cmdheight=2

" " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" " delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
if has("patch-8.1.1564")
	" Recently vim can merge signcolumn and number column into one
	set signcolumn=number
else
	set signcolumn=yes
endif


function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction


inoremap <silent><expr> <TAB>
       \ pumvisible() ? "\<C-n>" :
       \ <SID>check_back_space() ? "\<TAB>" :
       \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
	inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
	inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif


function! s:show_documentation()
	if (index(['nvim','help'], &filetype) >= 0)
		xecute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction

" Vim-javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1

set conceallevel=1

" Vim-jsx
let g:vim_jsx_pretty_highlight_close_tag = 1
let g:vim_jsx_pretty_colorful_config = 1

" Nerdcommenter
let g:NERDSpaceDelims = 1
let g:NERDCreateDefaultMappings = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1

" Git
nmap <leader>gs :G<CR>
nmap <leader>gd :Gdiffsplit<CR>
nmap <leader>gc :Git commit<CR>
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gb :Gblame<CR>

" Fzf
map <C-f> <Esc><Esc>:Files!<CR>
inoremap <C-f> <Esc><Esc>:Blines!<CR>
map <C-g> <Esc><Esc>:BCommits!<CR>
noremap <leader>f :Rg
nmap <leader>bs :Buffers<CR>

" Floaterm
let g:floaterm_width = 0.8
let g:floaterm_height = 0.8
"Map list floaterms
noremap <leader>tt :FloatermNew<CR>
noremap <leader>td :FloatermKill<CR>
noremap <leader>tn :FloatermNext<CR>
noremap <leader>tp :FloatermPrev<CR>
noremap <leader>th :FloatermToggle<CR>
noremap <leader>ts :Floaterms<CR>
tnoremap <Esc> <C-\><C-n>

" Nerdtree git plugin
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

" Close tag
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.php,*.jsx,*.js,*.tsx"
let g:closetag_shortcut = '>'

"Neoformat
nmap <leader>py :Neoformat<CR>
let g:neoformat_try_formatprg = 1

"Tagalong
let g:tagalong_additional_filetypes = ['javascript']

" set filetypes as typescriptreact
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact
