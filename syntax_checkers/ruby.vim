"============================================================================
"File:        ruby.vim
"Description: Syntax checking plugin for syntastic.vim
"Maintainer:  Martin Grenfell <martin_grenfell at msn dot com>
"License:     This program is free software. It comes without any warranty,
"             to the extent permitted by applicable law. You can redistribute
"             it and/or modify it under the terms of the Do What The Fuck You
"             Want To Public License, Version 2, as published by Sam Hocevar.
"             See http://sam.zoy.org/wtfpl/COPYING for more details.
"
"============================================================================
if exists("loaded_ruby_syntax_checker")
    finish
endif
let loaded_ruby_syntax_checker = 1

"bail if the user doesnt have ruby installed
if !executable("ruby")
    finish
endif

function! SyntaxCheckers_ruby_GetQFList()
    set makeprg=ruby\ -c\ %
    set errorformat=%A%f:%l:\ syntax\ error\\,\ %m,%Z%p^,%-C%.%#
    silent make!
    return getqflist()
endfunction
