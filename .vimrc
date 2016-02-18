

" Script settings
" ===============

" Memory usage: I allow vim to use a lot of memory.
let s:RD_use_mem = 1

" I allow vim to use colors
let s:RD_use_conn = 1

" I allow vim to save as much information as possible.
let s:RD_privacy = 0

" I change the above values as needed when I copy my .vimrc to different servers.


" Settings
" ========

" I do not like the vi-compatible mode.
set nocompatible

" Make backspace work as usual.
set backspace=indent,eol,start

" Diff option: ignore whitespace
set diffopt+=iwhite

" Allow changing the buffer without saving.
set hidden

if s:RD_use_mem
	" How many lines of history to remember.
	set history=1000

	" Use all the memory needed, for maximum performance.
	set maxmemtot=2000000
	set maxmem=2000000
	set maxmempattern=2000000
endif


" Do not place the cursor at the start of the line when using Page up/down.
set nostartofline

set nrformats=alpha,hex

" Allow the cursor to be positioned where there is no actual character.
" Visual block mode only.
set virtualedit=block

if s:RD_privacy == 1
	set viminfo=''
else
	" Remember information between vim restarts.
	set viminfo='200,<300,s150,%,h,!
endif

" Allow specified keys that move the cursor left/right to move to the previous/next line when the cursor is on the first/last character in the line.
" b (backspace), s (space) and the arrows.
set whichwrap=b,s,<,>


" Auto-complete
" =============

" Scanning included files is really slow for Perl files
" Maybe I should change this only for Perl files
set complete-=i

" Turn on wild menu which shows auto-complete options in the command mode
set wildmenu


" File-related
" ============

" Unicode support
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,latin1,default

" Support all three, in this order
set fileformats=unix,dos,mac

" Detect the type of file and enable filetype-specific indenting.
filetype plugin indent on

" Backups
set backup
set backupcopy=auto
set backupskip=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*test*,*temp*,*tmp*,*tst*,*~,*bak

" (I decided I like the Visual mode more)
" Start the selection mode with Shift+Arrows/Home/End/PageUp/PageDown, and with
" the mouse
"set selectmode=mouse,key

" Start the Visual/Selection mode with using Shift+Arrows/etc
set keymodel=startsel


" User interface
" ==============

if has("gui_win32")
	set guifont=Bitstream_Vera_Sans_Mono:h10:cANSI
endif

if (has("gui_running") || $TERM == 'xterm')
	set background=light
else
	set background=dark
endif

" The command line height.
set cmdheight=2

" As much as possible of the last line in a window will be displayed. When not included, a last line that doesn't fit is replaced with "@" lines.
set display=lastline

" GUI Options:
if has("gui_running")
	" GUI cursor: no blinking
	set guicursor+=a:blinkon0

	" no toolbar
	set guioptions-=T
	" no autoselect
	set guioptions-=a

	" Use console messages instead of GUI dialogs
	set guioptions+=c
endif

" Always show the status line
set laststatus=2

" Don't blink!
set novisualbell

" Show the line numbers.
set number

" Threshold for reporting number of lines changed.
set report=0

" Enable the ruler with the format:
" {buffer number}{modified/readonly flag}: {file type} [current line, current column] {position percentage in file}
set ruler
set rulerformat=%25(%n%m%r:\ %Y\ [%l,%v]\ %p%%%)

" Minimal number of screen lines to keep above and below the cursor.
set scrolloff=3

" Shorter messages.
set shortmess=as

" Show (partial) command in status line.
set showcmd

" Status line format:
" {buffer number}: {file name, relative path to the current working directory}{modified flag}{readonly flag}
" {help flag}{preview flag} [file type, encoding, format] [current line-total lines, current column][position percentage in file]
set statusline=%n:\ %f%m%r%h%w\ [%Y,%{&fileencoding},%{&fileformat}]\ [%l-%L,%v][%p%%]

if s:RD_use_conn
	set ttyfast
endif

" Do not redraw while running macros (much faster).
set lazyredraw

" What to show when you do :set list.
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,eol:$

" Allow using the mouse everywhere.
set mouse=a

" Nice, but too slow..
"
"set cursorline
"set cursorcolumn
"highlight CursorLine guibg=#f7f7f7
"highlight CursorColumn guibg=#f7f7f7


" Formatting and indenting
" ========================

set formatoptions=tcroqn " see help

" Automatic indenting, on new line.
set autoindent

" Enable C-style indenting.
set cindent

" Real tab chars.
set noexpandtab

" Smart indenting, based on the typed code.
set smartindent

" Tab spacing.
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Use tabs at the start of a line, spaces elsewhere.
set smarttab

" If on Vim will wrap long lines at a character in 'breakat' rather than at the last character that fits on the screen.
set linebreak


" Syntax highlighting and related
" ===============================

if s:RD_use_conn
	" Enable syntax highlighting
	syntax on
endif

" Show matching brackets.
set showmatch

" How many tenths of a second to blink matching brackets for
"set mat=5

" Do not highlight the string we searched.
set nohlsearch

" Highlight the searched string, while typing.
set incsearch

" Highlight advanced perl vars inside strings
let perl_extended_vars=1

" Highlight HTML code inside PHP strings
let php_htmlInStrings=1

" Highlight mySQL queries inside PHP strings
"let php_sql_query=1

" Highlight PHP code inside ASP-like tags
let php_asp_tags=1


" Code folding
" ============

set nofoldenable

" Fold column width
set foldcolumn=4

" Make folding indent sensitive
set foldmethod=indent

set foldminlines=2

" Folds with a higher level will be automatically closed.
set foldlevel=4

" Don't auto-open folds
set foldopen=


" (Auto) commands
" ===============

" Add the Eretidy command
command Eretidy call <SID>RD_EditRetidy()

" This adds the new Fullscreen command.
command Fullscreen call <SID>RD_Fullscreen()

" Skip file change notifications in mounted folders
"autocmd FileChangedShell /mnt/*,~/mnt/* call <SID>RD_FileChanged()

" Automatically update $Date: ... $ when the file is saved.
autocmd FileWritePre,BufWritePre * call <SID>RD_FileWritePre()

" Mappings
" ========

" DISABLED: These cause small issues.
" I like automatic completion for quotes and parentheses.
"inoremap " ""<LEFT>
"inoremap ' ''<LEFT>
"inoremap ( ()<LEFT>
"inoremap [ []<LEFT>
"inoremap ` ``<LEFT>
"inoremap { {}<LEFT>

" Make the Home key jump to the first non-white space, or to the start of the
" line.
inoremap <silent> <Home> <C-o>:call <SID>RD_map_home('i')<CR>
"vnoremap <silent> <Home> :<C-u>call <SID>RD_map_home('v')<CR>
nnoremap <silent> <Home> :call <SID>RD_map_home('n')<CR>

let mapleader='_'

" Quick way to change the directory to the file I am currently editing
noremap <silent> <Leader>. :exe 'cd ' . substitute(expand("%:p:h"), ' ', "\\\\ ", 'g')<CR>

" This allows me to quickly wrap any selection with some usual characters
" (quotes, angle quotes, parentheses, etc)
vnoremap <silent> <Leader>" :<C-u>call <SID>RD_wrapper('"')<CR>
vnoremap <silent> <Leader>' :<C-u>call <SID>RD_wrapper("'")<CR>
vnoremap <silent> <Leader>` :<C-u>call <SID>RD_wrapper('`')<CR>
vnoremap <silent> <Leader>{ :<C-u>call <SID>RD_wrapper('{')<CR>
vnoremap <silent> <Leader>( :<C-u>call <SID>RD_wrapper('(')<CR>
vnoremap <silent> <Leader>[ :<C-u>call <SID>RD_wrapper('[')<CR>
vnoremap <silent> <Leader>< :<C-u>call <SID>RD_wrapper('<')<CR>
vnoremap <silent> <Leader>t :<C-u>call <SID>RD_wrapper('t')<CR>
nnoremap <silent> <Leader>W :call <SID>RD_unwrapper()<CR>
nnoremap <silent> <Leader>T :call <SID>RD_unwrap_tag()<CR>

" Add/remove comments
vnoremap <silent> <Leader>c :<C-u>call <SID>RD_comment('v')<CR>
vnoremap <silent> <Leader>C :<C-u>call <SID>RD_uncomment('v')<CR>
nnoremap <silent> <Leader>c :call <SID>RD_comment('n')<CR>
nnoremap <silent> <Leader>C :call <SID>RD_uncomment('n')<CR>

" Tag lists toggle.
" If the taglist vim plugin is available.
if (exists('loaded_taglist') && loaded_taglist != 'no')
	noremap <silent> <F8> :TlistToggle<CR>
	noremap <silent> <S-F8> :TlistOpen<CR>
endif

" Autocommands
" ============

" Ensure every file does syntax highlighting (full)
"autocmd BufEnter * :syntax sync fromstart

autocmd FileType html,xml,xhtml call <SID>RD_XML_edit()
autocmd FileType php setlocal iskeyword+=@


" Abbreviations
" =============

" Current date and time, ISO format.
iab isodate <C-r>=<SID>RD_isodate()<CR>
iab $Date$  <C-r>="$Date: " . <SID>RD_isodate() . " $"<CR>
iab :vimset: <C-r>=<SID>RD_vimset_generate()<CR>

" My usual "copyright" line. I put this in almost all files I code.
iab rdcopy <C-o>:call <SID>RD_copyright()<CR>


" Variables
" =========

" Changes for the :TOhtml command
let use_xhtml = 1
let html_use_css = 1
let html_ignore_folding = 1
let html_number_lines = 0

" Changes for the TagList
let Tlist_Enable_Fold_Column = 0
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Sort_Type = 'order'
let Tlist_Use_Right_Window = 1
let Tlist_Inc_Winwidth = 0

" Functions
" =========

" Output ISO date.
function s:RD_isodate ()
	return strftime("%Y-%m-%d %H:%M:%S %z")
endfunction

" Output a vim:set ... : modeline, based on current settings.
function s:RD_vimset_generate ()
	let l:str = 'vim:set'

	if (&spell && (&filetype == 'html' || &filetype == 'xhtml'))
		let l:str .= ' spell'
		if !empty(&spelllang)
			let l:str .= ' spl=' . &spelllang
		endif
	endif

	let l:str .= ' ts=' . &tabstop . ' sw=' . &shiftwidth . ' sts=' . &softtabstop

	if &smarttab
		let l:str .= ' sta'
	else
		let l:str .= ' nosta'
	endif

	if &expandtab
		let l:str .= ' et'
	else
		let l:str .= ' noet'
	endif

	if !empty(&fileencoding)
		let l:str .= ' fenc=' . &fileencoding
	endif

	if !empty(&fileformat)
		let l:str .= ' ff=' . &fileformat
	endif

	let l:str .= ':'

	return l:str
endfunction

" This function toggles the 'fullscreen' mode. I sometimes need this, so I can
" just view my files, without all the 'clutter': line numbers, folding,
" command line, status line, etc.
let s:fullscreen_toggle = 0
function s:RD_Fullscreen ()
	if s:fullscreen_toggle == 0
		set cmdheight=1
		set nonumber
		set laststatus=0
		set foldcolumn=0
		let s:fullscreen_toggle = 1
	else
		set cmdheight=2
		set number
		set laststatus=2
		set foldcolumn=4
		let s:fullscreen_toggle = 0
	endif
endfunction


" This function is used for quickly opening my ReTidy script (often needed
" when cleaning pages).
" Check out: http://www.robodesign.ro/mihai/my-projects/retidy
let s:eretidy_toggle = 0
function s:RD_EditRetidy ()
	if s:eretidy_toggle == 0
		let l:cwd = getcwd()
		cd /path/to/retidy
		e src/retidy.php
		e examples/retidy-stdio.php
		e profiles/awebitor.php
		e profiles/maximum.php
		e profiles/custom.php
		cd `=l:cwd`
		let s:eretidy_toggle = 1
	else
		bdel src/retidy.php examples/retidy-stdio.php profiles/awebitor.php profiles/maximum.php profiles/custom.php
		let s:eretidy_toggle = 0
	endif
endfunction

" This function updates the $Date: ... $ definition to always be the date and
" time of the last file write.
function s:RD_FileWritePre ()
	if (&readonly || !&modified)
		return
	endif

	let l:my_search = "\\$Date: [0-9- +:]\\+ \\$"
	let l:my_cpos   = getpos('.')
	call cursor(1,1)
	let l:my_spos   = search(l:my_search, 'n', 400)

	if l:my_spos > 0
		let l:my_date = <SID>RD_isodate()
		let l:my_line = getline(l:my_spos)
		let l:my_line = substitute(l:my_line, l:my_search, "$Date: " . l:my_date . " $", "e")
		call setline(l:my_spos, l:my_line)
	endif

	call setpos('.', l:my_cpos)
endfunction

" This function avoids an annoying FileChanged dialog for some folders I want
" (cifs mounted folders)
function s:RD_FileChanged ()
	echohl WarningMsg

	if v:fcs_reason == 'deleted'
		let v:fcs_choice = 'ask'
		echo 'File deleted!'
	else
		echo 'File changed!'
	endif

	echohl None
endfunction


" This makes the Home key jump to the first non-whitespace character, or to
" the start of the line. Inspired by Cream. (cream.sf.net)
function s:RD_map_home (mode)
	let l:oldcol = col('.')
	if l:oldcol == 1
		return 1
	endif

	normal ^

	let l:newcol = col('.')
	if l:oldcol != l:newcol
		return l:newcol
	endif

	normal 0

	return 1
endfunction


" This function nicely wraps a selection within quotes, curly braces, square
" brackets, angle brackets, tags and more.
function s:RD_wrapper (str) range
	let l:allowed_strs = {
				\ '"' : ['"', '"'],
				\ "'" : ["'", "'"],
				\ '{' : ['{', '}'],
				\ '(' : ['(', ')'],
				\ '[' : ['[', ']'],
				\ '`' : ['`', '`'],
				\ '<' : ['<', '>'],
				\ 't' : ['', '']
				\ }

	if has_key(l:allowed_strs, a:str) != 1
		echohl ErrorMsg
		echo 'Unknown wrapper: "' . a:str . '".'
		echohl None

		return 0
	endif

	" Wrap the selection with a tag.
	if a:str == 't'
		let l:tname = inputdialog('Tag name: ')
		if strlen(l:tname) < 1
			return 0
		endif
		let l:allowed_strs[a:str][0] = '<' . l:tname . '>'
		let l:allowed_strs[a:str][1] = '</' . l:tname . '>'
	endif

	let l:prefix = l:allowed_strs[a:str][0]
	let l:suffix = l:allowed_strs[a:str][1]
	let l:lenp = strlen(l:prefix)

	let l:old_x = @x
	let l:old_reg = @"

	let @x = l:prefix
	normal `<"xP
	let l:line1 = line('.')

	normal `>
	let l:line2 = line('.')

	if l:line1 == l:line2
		exe 'normal ' . lenp . 'l'
	endif

	let @x = l:suffix
	normal "xp

	" If we are wrapping the selection with a tag, lets put the cursor exactly
	" where the user can just press 'i' to start writing the attributes.
	if a:str == 't'
		normal h%h%
	endif

	let @x = l:old_x
	let @" = l:old_reg

	return 1
endfunction


" Similar to the RD_wrapper function, this one removes the quotes, curly
" braces, etc.
function s:RD_unwrapper () range
	let l:allowed_strs = ['"', "'", '{', '}', '(', ')', '[', ']', '`', '<', '>']
	let l:xml_types = ['xhtml', 'html', 'xml']
	let l:str = strpart(getline('.'), col('.') - 1, 1)

	if index(l:allowed_strs, l:str) == -1

		" If this is a known XML/SGML file type, then try to strip the current
		" tag
		if index(l:xml_types, &filetype) != -1
			return <SID>RD_unwrap_tag()
		endif

		echohl ErrorMsg
		echo 'The character under the cursor was not recognized: "' . l:str . '"'
		echohl None

		return 0
	endif

	let l:old_x = @x
	let l:old_reg = @"

	exe 'normal vi' . l:str . 'v'

	normal `<X
	let l:line1 = line('.')

	normal `>
	let l:line2 = line('.')
	if(l:line1 != l:line2)
		normal l
	endif
	normal x

	let @x = l:old_x
	let @" = l:old_reg

	return 1
endfunction


" This function strips the tag under the cursor.
function s:RD_unwrap_tag()
	let l:line1 = line('.')
	let l:col1 = col('.')

	" If the cursor is positioned on the '<', move to the right
    if strpart (getline('.'), l:col1-1, 1) == '<'
        normal l
		let l:col1 = col('.')
    endif

	" We have to check if we are inside a tag definition

	" Move to the next >
	let [l:line2, l:col2] = searchpos(">", 'W')

	if (l:line2 == 0 && l:col2 == 0)
		return 0
	endif

	" If we found a singleton tag '/>' or a malformed <> tag, then we don't do anything
	let l:tmp = strpart(getline(l:line2), l:col2-2, 2)
    if (l:tmp == '/>' || l:tmp == '<>')
		let l:tmp = cursor(l:line1, l:col1)
        return 0
    endif

	" Move to the previous <
	let [l:line0, l:col0] = searchpos("<", 'bW')

    if (l:line0 == 0 && l:col0 == 0)
        return 0
    endif

	" If the < was found after current cursor position, then we are not inside
	if (l:line0 > l:line1 || (l:line0 == l:line1 && l:col0 > l:col1))
		" Put the cursor back
		let l:tmp = cursor(l:line1, l:col1)
		return 0
	endif

	" If the cursor is positioned on the '</' (end of tag), move to the start
	" of the tag.
    if strpart (getline(l:line0), l:col0-1, 2) == '</'
        normal l%h
	else
		" Check if the cursor is positioned on the tag name (not on attributes).
		let [l:lineS, l:colS] = searchpos('$\|\s\|>', 'nW')
		let l:colS -= 1
		if (l:lineS != l:line1 || l:colS < l:col1 || (l:lineS == l:line2 && l:colS > l:col2) || l:lineS > l:line2)
			let l:tmp = cursor(l:line1, l:col1)
			return 0
		endif
    endif

	" Update the position
	let l:cline = line('.')
	let l:ccol = col('.')

	let l:old_reg = @"

	" Delete the closing tag
	normal l%da<
	" Remove the line if it's empty
	silent! s/^\s\+\n//e

	" Go back and the delete the start tag
	let l:tmp = cursor(l:cline, l:ccol)
	normal lda<
	silent! s/^\s\+\n//e

	let @" = l:old_reg

	return 1
endfunction


" This function makes the selection commented, based on &filetype.
" This is something simple, sufficient for my needs.
function s:RD_comment (mode) range
	let l:known_types = {
				\ 'vim' : [1, '"'],
				\ 'sh' : [1, '#'],
				\ 'php' : [2, '/*', '*/'],
				\ 'css' : [2, '/*', '*/'],
				\ 'javascript' : [2, '/*', '*/'],
				\ 'html' : [2, '<!--', '-->'],
				\ 'xhtml' : [2, '<!--', '-->'],
				\ 'xml' : [2, '<!--', '-->']
				\ }

	if has_key(l:known_types, &filetype) != 1
		echohl ErrorMsg
		echo 'Unknown file type.'
		echohl None

		return 0
	endif

	if (a:mode != 'v' && a:mode != 'n')
		echohl ErrorMsg
		echo 'Unknown mode.'
		echohl None

		return 0
	endif

	let l:old_x = @x
	let l:old_reg = @"

	let l:ctype = l:known_types[&filetype][0]
	let l:cprefix = l:known_types[&filetype][1]
	let l:lenp = strlen(l:cprefix)

	if l:ctype == 2
		let l:csuffix = l:known_types[&filetype][2]
	endif

	if l:ctype == 1
		if a:mode == 'v'
			exe "'<,'>s~^~" . l:cprefix . "~e"
		else
			exe "s~^~" . l:cprefix . "~e"
		endif
	elseif l:ctype == 2
		if a:mode == 'v'
			normal `<
		else
			normal ^
		endif

		let @x = l:cprefix
		normal "xP
		let l:line1 = line('.')

		if a:mode == 'v'
			normal `>
		else
			normal $
		endif

		let l:line2 = line('.')

		if (l:line1 == l:line2 && a:mode == 'v')
			exe 'normal ' . l:lenp . 'l'
		endif

		let @x = l:csuffix
		normal "xp
	endif

	let @x = l:old_x
	let @" = l:old_reg

	return 1
endfunction


" This function uncomments the text within the selection.
function s:RD_uncomment (mode) range
	let l:known_types = {
				\ 'vim' : {
					\ '1l' : '"'
					\ },
				\ 'sh' : {
					\ '1l' : '#'
					\ },
				\ 'php' : {
					\ '1l' : '//\|#',
					\ 'multi' : ['/\*', '\*/']
					\ },
				\ 'css' : {
					\ 'multi' : ['/\*', '\*/']
					\ },
				\ 'javascript' : {
					\ '1l' : '//',
					\ 'multi' : ['/\*', '\*/']
					\ },
				\ 'html' : {
					\ 'multi' : ['<!--', '-->']
					\ },
				\ 'xhtml' : {
					\ 'multi' : ['<!--', '-->']
					\ },
				\ 'xml' : {
					\ 'multi' : ['<!--', '-->']
					\ }
				\ }

	if has_key(l:known_types, &filetype) != 1
		echohl ErrorMsg
		echo 'Unknown file type.'
		echohl None

		return 0
	endif

	if (a:mode != 'v' && a:mode != 'n')
		echohl ErrorMsg
		echo 'Unknown mode.'
		echohl None

		return 0
	endif

	let l:ctype = l:known_types[&filetype]

	if has_key(l:ctype, '1l') == 1
		if a:mode == 'v'
			exe "'<,'>s~^\\(\\s*\\)" . l:ctype['1l'] . "~\\1~e"
		else
			exe "s~^\\(\\s*\\)" . l:ctype['1l'] . "~\\1~e"
		endif
	endif

	if has_key(l:ctype, 'multi') == 1
		if a:mode == 'v'
			exe "'<s~" . l:ctype['multi'][0] . "~~e"
			exe "'>s~" . l:ctype['multi'][1] . "~~e"
		else
			exe "s~" . l:ctype['multi'][0] . "~~e"
			exe "s~" . l:ctype['multi'][1] . "~~e"
		endif
	endif

	return 1
endfunction


" This function nicely generates the copyright string I want, in a comment
" suited for the current filetype
function s:RD_copyright ()
	exe "normal i © " . strftime("%Y") . " ROBO Design\rhttp://www.robodesign.ro "

	normal Vk_c$
endfunction


" This function makes some changes which enhance the editing of XML/SGML
" documents.
" Inspired by http://www.pinkjuice.com/howto/vimxml/setup.xml
function s:RD_XML_edit()
	setlocal matchpairs+=<:>
    inoremap <silent> <buffer> > ><Esc>:call <SID>RD_autocomplete_tag()<Cr>
    inoremap <buffer> <LocalLeader>> >
endfunction

" This function automatically adds the close tag as you type, in (X)HTML and
" XML
function s:RD_autocomplete_tag( )
	" Save registers
	let l:old_reg = @"

	let l:tmp = strpart (getline ("."), col (".") - 2, 2)
	if l:tmp == '/>'
		silent! normal l
		if col('.') == (col('$')-1)
			startinsert!
		else
			startinsert
		endif
		return 0
	endif

	if (!exists("g:xml_no_auto_nesting") && l:tmp == '>>')
		let l:multiline = 1
		normal X
	else
		let l:multiline = 0
	endif

	if (&filetype == 'html' || &filetype == 'xhtml')
		let l:html_mode = 1
		let l:html_tags = ['area', 'base', 'br', 'frame', 'hr', 'img', 'input', 'link', 'meta', 'param']
	else
		let l:html_mode = 0
	endif

	normal y%%
	let l:ltag = @"
	let l:space = stridx(l:ltag, ' ')
	let l:lbracket = stridx(l:ltag, '<', 1)
	let l:rbracket = stridx(l:ltag, '>')

	" Check if this is a malformed tag
	if (l:lbracket != -1 || l:rbracket != ( strlen(l:ltag)-1 ) || (l:space != -1 && l:space < 2) )
		let @" = l:old_reg
		startinsert
		return 0
	endif

	" Get the tag name
	if l:space != -1
		let l:tname = strpart(l:ltag, 1, l:space-1)
	else
		let l:tname = strpart(l:ltag, 1, strlen(l:ltag)-2)
	endif

	" Tag name too short ... or it's the end tag.
	" Also check if this is <!...> or <?...>.
	" Additionally, don't autocomplete some known HTML tags
	if ( strlen(l:tname) < 1 || stridx(l:tname, '/') != -1 || stridx(l:tname, '!') != -1 || stridx(l:tname, '?') != -1 || (l:html_mode == 1 && index(l:html_tags, l:tname) != -1) )
		let @" = l:old_reg
		silent! normal l
		if col('.') == (col('$')-1)
			startinsert!
		else
			startinsert
		endif
		return 0
	endif

	let @" = l:tname

	" Add the ending tag if multiline!=1
	if l:multiline == 1
		exe "silent! normal! ax\<Esc>r\nOx\<Esc>x"
		startinsert!
	else
		exe "normal! a</\<Esc>pa>\<Esc>%"
		startinsert
	endif

	let @" = l:old_reg

	return 1
endfunction


" The end
" =======

" Enable .exrc files (.vimrc files per-directory)
set exrc

" Disable any unsafe commands in .exrc files
set secure

" vim:set spell spl=en ts=4 sw=4 sts=4 sta noet fenc=utf-8 ff=unix:

function! DoPrettyXML()
  " save the filetype so we can restore it later
  let l:origft = &ft
  set ft=
  " delete the xml header if it exists. This will
  " permit us to surround the document with fake tags
  " without creating invalid xml.
  1s/<?xml .*?>//e
  " insert fake tags around the entire document.
  " This will permit us to pretty-format excerpts of
  " XML that may contain multiple top-level elements.
  0put ='<PrettyXML>'
  $put ='</PrettyXML>'
  silent %!xmllint --format -
  " xmllint will insert an <?xml?> header. it's easy enough to delete
  " if you don't want it.
  " delete the fake tags
  2d
  $d
  " restore the 'normal' indentation, which is one extra level
  " too deep due to the extra tags we wrapped around the document.
  silent %<
  " back to home
  1
  " restore the filetype
  exe "set ft=" . l:origft
endfunction
command! PrettyXML call DoPrettyXML()

set mouse=
