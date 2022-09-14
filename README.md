# vim-nocmdline

⚠ THIS HAS MANY BUGS !  
📜 Powered by vim9script

## INTRODUCTION
nocmdline is a Vim plugin emulates statusline with `echo`.  
So, it looks like `cmdheight=0`.

<img width="600" src="https://user-images.githubusercontent.com/6848636/190131571-b58d55a4-c258-42d9-bf4a-379cc8106490.png">

also, Zen mode (emulates the next line). 🧘

<img width="600" src="https://user-images.githubusercontent.com/6848636/190131844-dd95d5d4-0f18-44c1-a50b-35bddec8e1c6.png">

## USAGE
### Require
- vim9script

### Install
- Example of `.vimrc`
  ```vim
  vim9script
  ⋮
  dein# add('utubo/vim-nocmdline')
  ⋮
  g:nocmdline = get(g:, 'nocmdline', {})
  g:nocmdline.format = '%t %m%r %=%`%3l:%-2c%`%{&ff} %{&fenc} %L'
  # require nerd fonts
  g:nocmdline.tail = "\ue0be"
  g:nocmdline.sep  = "\ue0bc"
  g:nocmdline.sub  = "\ue0bb"
  nnoremap ZZ <ScriptCmd>nocmdline# ToggleZen()<CR>
  # You can disable nocmdline at VimEnter
  #g:nocmdline.at_start = 0
  ```


## INTERFACE

### API
#### `nocmdline#Invalidate()`
Update statusline.

#### `nocmdline#ToggleZen([{enable}])`
Toggle Zen mode.  
Zen echos the next line instead of statusline.  
(sorry, Zen don't support hilight, tabstop, conceal and others...)  
`enable` is number `0`(disable) or `1`(enable).

### VARIABLES
#### `g:nocmdline`
`g:nocmdline` is dictionaly.  

- `at_start`  
  number.  
  `0`: disable nocmdline at VimEnter.  
  `1`: enable nocmdline at VimEnter.  
  `default` is `1`.  
- `delay`  
  seconds of show statusline when return from Command-mode.  
  default is `&updatetime` / 1000.
- `zen`  
  number.  
  `0`: disable zen mode.  
  `1`: enable zen mode.  
  default is `0`.
- `tail`  
  the char of right of statusline.
- `sep`  
  the char of the separator of the mode.
- `sub`  
  the char of the sub-separators.  
  default is `|`
- `horiz`  
  the char of the horizontal line on zen mode.
- `format`  
  the format of statusline.
- `mode`  
  the names of mode.

#### `g:nocmdline.format`
see `:help statusline`.
nocmdline supports these only.

```
t S   File name (tail) of file in the buffer.
m F   Modified flag, text is "[+]"; "[-]" if 'modifiable' is off.
r F   Readonly flag, text is "[RO]".
l N   Line number.
L N   Number of lines in buffer.
c N   Column number (byte index).
{ NF  Evaluate expression between '%{' and '}' and substitute result.
= -   Separation point between left and right aligned items.
```

and `%|` sugar-coats `%{g:nocmdline.sub}`

`%{expr}` evalute expr with legacy vimscript. (not vim9script)

#### `g:nocmdline.mode`
see `:help mode()`.

```vim
# default
g:nocmdline.mode = {
n:    'Normal',
v:    'Visual',
V:    'V-Line',
'^V': 'V-Block',
s:    'Select',
S:    'S-Line',
'^S': 'S-Block',
i:    'Insert',
R:    'Replace',
c:    'Command',
r:    'Prompt',
t:    'Terminal',
'!':  'Shell',
'*':  '      ', # for unknown mode.
'NC': '------', # for not-current windows.
}
```

### COLORS
the mode colors.

|Hilight group        |Default color               |
|---------------------|----------------------------|
|NoCmdline            |StatusLine                  |
|NoCmdlineNormal      |ToolBarButton               |
|NoCmdlineVisual      |Visual                      |
|NoCmdlineVisualLine  |VisualNOS                   |
|NoCmdlineVisualBlock |link to NoCmdlineVisualLine |
|NoCmdlineSelect      |DiffChange                  |
|NoCmdlineSelectLine  |link to NoCmdlineSelect     |
|NoCmdlineSelectBlock |link to NoCmdlineSelect     |
|NoCmdlineInsert      |DiffAdd                     |
|NoCmdlineReplace     |DiffChange                  |
|NoCmdlineCommand     |WildMenu                    |
|NoCmdlinePrompt      |Search                      |
|NoCmdlineTerm        |StatusLineTerm              |
|NoCmdlineShell       |StatusLineTermNC            |
|NoCmdlineModeNC      |StatusLineNC for not-current windows. |
|NoCmdlineOther       |link to NoCmdlineModeNC for unknown mode. |

