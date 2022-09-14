" emulate `%{expr}` of statusline
function! nocmdline_legacy#Execute(expr)
	return execute(a:expr)
endfunction
