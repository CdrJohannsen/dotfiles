
syn keyword     brfStatement    assign
syn keyword     brfConditional  if else then switch
syn match       brfComment	    "#.*$" contains=brfUIElement
syn match	    brfNumber       "\d\+\%(u\=l\{0,2}\|ll\=u\)\>"
syn match       brfFloat        "\d\+\.\d*\%(e[-+]\=\d\+\)\=[fl]\="
syn keyword     brfConstant     true false yes no
syn keyword     brfOperator     not or and xor
syn keyword     brfOperator     multiply add sub
syn keyword     brfOperator     max min
syn keyword     brfOperator     equal greater lesser
syn match       brfContext      "\v---context:(global|way|node)"
syn match       brfUIElement    "\v\%[a-zA-Z_]+\%\s*\|[^|]*\|.*" contained contains=brfUIVar,brfUIType
syn match       brfUIVar        "\v\%[a-zA-Z_]+\%" contained
syn match       brfUIType        "\vboolean|number|\[(\d+\=[a-zA-Z0-9_ -]+(, )?)+\]" contained

hi def link brfConditional  Conditional
hi def link brfStatement    Statement
hi def link brfComment      Comment
hi def link brfConstant     Constant
hi def link brfNumber       Number
hi def link brfFloat        Float
hi def link brfOperator     Operator
hi def link brfContext      PreProc
hi def link brfUIElement    Comment
hi def link brfUIVar        Special
hi def link brfUIType       Type
