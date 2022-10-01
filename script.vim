function SyntaxColor()
    syn match Function / t \| n /
    syn match Number /[0-9]\+/
    syn match Conditional / L \| G /
endfunction

function Sendline()
	silent exe '!bash pf2pd.sh ' . getline('.') . ' | pdsend 9999' | redraw!
endfunction

function Sendbpm()
	silent exe '!echo ' . getline('.') . ' | pdsend 9998' | redraw
endfunction

map <F5> <esc> :call Sendline() <enter>
map <F9> <esc> :call Sendbpm() <enter>
call SyntaxColor()
