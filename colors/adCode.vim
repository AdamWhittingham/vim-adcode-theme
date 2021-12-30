" Vim color file
"   This file was generated by Palette
"   http://rubygems.org/gems/palette
"
" Author: Adam Whittingham
" Notes:  A colourful scheme for bright programmers

hi clear
if version > 580
    if exists("syntax_on")
        syntax reset
    endif
endif

let colors_name="adCode"

if has("gui_running")
    set background=dark
endif

hi Normal                      guifg=#FAFAFA ctermfg=231  guibg=#07071A ctermbg=232  gui=NONE cterm=NONE
hi Visual                      guifg=NONE    ctermfg=NONE guibg=#003050 ctermbg=23   gui=NONE cterm=NONE
hi LineNr                      guifg=#8C8CAF ctermfg=103  guibg=#0C0C2E ctermbg=233  gui=NONE cterm=NONE
hi Cursor                      guifg=#FAFAFA ctermfg=231  guibg=#FFFFFF ctermbg=231  gui=NONE cterm=NONE
hi CursorLine                  guifg=NONE    ctermfg=NONE guibg=#0C0C2E ctermbg=233  gui=NONE cterm=NONE
hi CursorLineNr                guifg=#50DF40 ctermfg=77   guibg=#0C0C2E ctermbg=233  gui=BOLD cterm=BOLD cterm=BOLD
hi CursorColumn                guifg=NONE    ctermfg=NONE guibg=#303030 ctermbg=236  gui=NONE cterm=NONE
hi Search                      guifg=#07071A ctermfg=232  guibg=#F8D454 ctermbg=221  gui=BOLD cterm=BOLD cterm=BOLD
hi MatchParen                  guifg=#F8D454 ctermfg=221  guibg=#07071A ctermbg=232  gui=BOLD cterm=BOLD cterm=BOLD
hi SignColumn                  guifg=#FAFAFA ctermfg=231  guibg=#0C0C2E ctermbg=233  gui=NONE cterm=NONE
hi VertSplit                   guifg=#0C0C2E ctermfg=233  guibg=#0C0C2E ctermbg=233  gui=NONE cterm=NONE
hi NonText                     guifg=#8C8CAF ctermfg=103  gui=BOLD cterm=BOLD cterm=BOLD
hi SpecialKey                  guifg=#8C8CAF ctermfg=103  guibg=#FF9800 ctermbg=208  gui=BOLD cterm=BOLD cterm=BOLD
hi RedundantSpaces             guifg=NONE    ctermfg=NONE guibg=#E9475A ctermbg=167  gui=NONE cterm=NONE
hi BadSpaces                   guifg=#8C8CAF ctermfg=103  guibg=#E9475A ctermbg=167  gui=NONE cterm=NONE
hi StatusLine                  guifg=#FAFAFA ctermfg=231  gui=NONE cterm=NONE
hi StatusLineNC                guifg=#0C0C2E ctermfg=233  guibg=#8C8CAF ctermbg=103  gui=NONE cterm=NONE
hi StatusAEnds                 guifg=#2050BF ctermfg=25   gui=NONE cterm=NONE
hi StatusA                     guifg=#FAFAFA ctermfg=231  guibg=#2050BF ctermbg=25   gui=NONE cterm=NONE
hi StatusBEnds                 guifg=#203080 ctermfg=24   gui=NONE cterm=NONE
hi StatusB                     guifg=#FAFAFA ctermfg=231  guibg=#203080 ctermbg=24   gui=NONE cterm=NONE
hi StatusCEnds                 guifg=#202848 ctermfg=235  gui=NONE cterm=NONE
hi StatusC                     guifg=#FAFAFA ctermfg=231  guibg=#202848 ctermbg=235  gui=NONE cterm=NONE
hi StatusDEnds                 guifg=#008387 ctermfg=30   gui=NONE cterm=NONE
hi StatusD                     guifg=#FAFAFA ctermfg=231  guibg=#008387 ctermbg=30   gui=NONE cterm=NONE
hi IndentBlanklineChar         guifg=#202848 ctermfg=235  gui=NONE cterm=NONE
hi IndentBlanklineContextChar  guifg=#6655DD ctermfg=62   gui=NONE cterm=NONE
hi IndentBlanklineContextStart guifg=NONE    ctermfg=NONE guibg=#202848 ctermbg=235  gui=NOCOMBINE cterm=NOCOMBINE
hi Boolean                     guifg=#FFB633 ctermfg=215  gui=NONE cterm=NONE
hi Character                   guifg=#50DF40 ctermfg=77   gui=NONE cterm=NONE
hi Comment                     guifg=#D7D7E3 ctermfg=188  guibg=NONE    ctermbg=NONE gui=ITALIC cterm=ITALIC cterm=NONE
hi Conditional                 guifg=#6FCFFF ctermfg=81   gui=NONE cterm=NONE
hi Constant                    guifg=#FFB633 ctermfg=215  gui=NONE cterm=NONE
hi Debug                       guifg=#FF9800 ctermfg=208  gui=NONE cterm=NONE
hi Define                      guifg=#FAFAFA ctermfg=231  gui=NONE cterm=NONE
hi Delimiter                   guifg=#2050BF ctermfg=25   gui=NONE cterm=NONE
hi Exception                   guifg=#E9475A ctermfg=167  gui=NONE cterm=NONE
hi Float                       guifg=#047F7F ctermfg=30   gui=NONE cterm=NONE
hi Function                    guifg=#6FCFFF ctermfg=81   gui=NONE cterm=NONE
hi Identifier                  guifg=#8FFF3A ctermfg=119  gui=NONE cterm=NONE
hi Include                     guifg=#FFB633 ctermfg=215  gui=NONE cterm=NONE
hi Keyword                     guifg=#50DF40 ctermfg=77   gui=NONE cterm=NONE
hi Label                       guifg=#7E8AA2 ctermfg=103  gui=NONE cterm=NONE
hi Number                      guifg=#8FFF3A ctermfg=119  gui=NONE cterm=NONE
hi Operator                    guifg=#7E8AA2 ctermfg=103  gui=NONE cterm=NONE
hi Special                     guifg=#40B0FF ctermfg=75   gui=NONE cterm=NONE
hi Statement                   guifg=#9C4FFF ctermfg=135  gui=NONE cterm=NONE
hi String                      guifg=#8FFF3A ctermfg=119  gui=NONE cterm=NONE
hi Structure                   guifg=#7E8AA2 ctermfg=103  gui=NONE cterm=NONE
hi Title                       guifg=#F6F3E8 ctermfg=255  gui=NONE cterm=NONE
hi Todo                        guifg=#FFB633 ctermfg=215  gui=NONE cterm=NONE
hi Type                        guifg=#40B0FF ctermfg=75   gui=NONE cterm=NONE
hi Typedef                     guifg=#7E8AA2 ctermfg=103  gui=NONE cterm=NONE
hi TSComment                   guifg=#8C8CAF ctermfg=103  gui=ITALIC cterm=ITALIC cterm=NONE
hi TSConditional               guifg=#CCA0FF ctermfg=183  gui=NONE cterm=NONE
hi TSConstant                  guifg=#40B0FF ctermfg=75   gui=NONE cterm=NONE
hi TSException                 guifg=#E9475A ctermfg=167  gui=NONE cterm=NONE
hi TSFunction                  guifg=#6FCFFF ctermfg=81   gui=NONE cterm=NONE
hi TSKeyword                   guifg=#9C4FFF ctermfg=135  gui=ITALIC cterm=ITALIC cterm=NONE
hi TSKeywordFunction           guifg=#9C4FFF ctermfg=135  gui=ITALIC cterm=ITALIC cterm=NONE
hi TSLabel                     guifg=#A0FF80 ctermfg=156  gui=NONE cterm=NONE
hi TSField                     guifg=#06B0B0 ctermfg=37   gui=NONE cterm=NONE
hi TSNumber                    guifg=#50DF40 ctermfg=77   gui=NONE cterm=NONE
hi TSFloat                     guifg=#8FFF3A ctermfg=119  gui=NONE cterm=NONE
hi TSOperator                  guifg=#FAFAFA ctermfg=231  gui=NONE cterm=NONE
hi TSParameter                 guifg=#06B0B0 ctermfg=37   gui=NONE cterm=NONE
hi TSPunctBracket              guifg=#50DF40 ctermfg=77   gui=NONE cterm=NONE
hi TSPunctSpecial              guifg=#50DF40 ctermfg=77   gui=NONE cterm=NONE
hi TSPunctDelimiter            guifg=#FFFFFF ctermfg=231  gui=NONE cterm=NONE
hi TSString                    guifg=#50DF40 ctermfg=77   gui=NONE cterm=NONE
hi TSStringRegex               guifg=#8FFF3A ctermfg=119  gui=NONE cterm=NONE
hi TSSymbol                    guifg=#40B0FF ctermfg=75   gui=NONE cterm=NONE
hi TSType                      guifg=#40B0FF ctermfg=75   gui=NONE cterm=NONE
hi TSWarning                   guifg=#FFB633 ctermfg=215  gui=BOLD cterm=BOLD cterm=BOLD
hi PMenu                       guifg=#FAFAFA ctermfg=231  guibg=#003050 ctermbg=23   gui=NONE cterm=NONE
hi PMenuSbar                   guifg=NONE    ctermfg=NONE guibg=#8C8CAF ctermbg=103  gui=NONE cterm=NONE
hi PMenuSel                    guifg=#FAFAFA ctermfg=231  guibg=#2050BF ctermbg=25   gui=NONE cterm=NONE
hi PMenuThumb                  guifg=#07071A ctermfg=232  guibg=#40B0FF ctermbg=75   gui=NONE cterm=NONE
hi StartifyBracket             guifg=#8C8CAF ctermfg=103  gui=NONE cterm=NONE
hi StartifyPath                guifg=#40B0FF ctermfg=75   gui=NONE cterm=NONE
hi StartifySlash               guifg=#8C8CAF ctermfg=103  gui=NONE cterm=NONE
hi StartifyFile                guifg=#6FCFFF ctermfg=81   gui=NONE cterm=NONE
hi StartifyFooter              guifg=#8C8CAF ctermfg=103  gui=NONE cterm=NONE
hi StartifyHeader              guifg=#50DF40 ctermfg=77   gui=NONE cterm=NONE
hi StartifyNumber              guifg=#FFB633 ctermfg=215  gui=NONE cterm=NONE
hi StartifySpecial             guifg=#6FCFFF ctermfg=81   gui=NONE cterm=NONE
hi NERDTreeCWD                 guifg=#8FFF3A ctermfg=119  gui=NONE cterm=NONE
hi NERDTreeDir                 guifg=#40B0FF ctermfg=75   gui=NONE cterm=NONE
hi NERDTreeDirSlash            guifg=#40B0FF ctermfg=75   gui=NONE cterm=NONE
hi NERDTreeUp                  guifg=#6FCFFF ctermfg=81   gui=NONE cterm=NONE
hi NERDTreeOpenable            guifg=#06B0B0 ctermfg=37   gui=NONE cterm=NONE
hi NERDTreeClosable            guifg=#008387 ctermfg=30   gui=NONE cterm=NONE
hi netrwData                   guifg=#40B0FF ctermfg=75   gui=NONE cterm=NONE
hi netrwSymLink                guifg=#50DF40 ctermfg=77   gui=NONE cterm=NONE
hi bufExplorerCurFile          guifg=#6FCFFF ctermfg=81   gui=NONE cterm=NONE
hi bufExplorerAltBuf           guifg=#40B0FF ctermfg=75   gui=NONE cterm=NONE
hi bufExplorerHelp             guifg=#8C8CAF ctermfg=103  gui=NONE cterm=NONE
hi bufExplorerSortBy           guifg=#50DF40 ctermfg=77   gui=NONE cterm=NONE
hi GitGutterAdd                guifg=#50DF40 ctermfg=77   gui=NONE cterm=NONE
hi GitGutterAddLine            guifg=NONE    ctermfg=NONE guibg=#063806 ctermbg=22   gui=NONE cterm=NONE
hi GitSignsAdd                 guifg=#50DF40 ctermfg=77   gui=NONE cterm=NONE
hi GitSignsAddLn               guifg=NONE    ctermfg=NONE guibg=#063806 ctermbg=22   gui=NONE cterm=NONE
hi GitGutterChange             guifg=#FFFF40 ctermfg=227  gui=NONE cterm=NONE
hi GitGutterChangeLine         guifg=NONE    ctermfg=NONE guibg=#383805 ctermbg=237  gui=NONE cterm=NONE
hi GitSignsChange              guifg=#FFFF40 ctermfg=227  gui=NONE cterm=NONE
hi GitSignsChangeLn            guifg=NONE    ctermfg=NONE guibg=#383805 ctermbg=237  gui=NONE cterm=NONE
hi GitGutterDelete             guifg=#E9475A ctermfg=167  gui=NONE cterm=NONE
hi GitGutterDeleteLine         guifg=NONE    ctermfg=NONE guibg=#380505 ctermbg=52   gui=NONE cterm=NONE
hi GitSignsDelete              guifg=#E9475A ctermfg=167  gui=NONE cterm=NONE
hi GitSignsDeleteLn            guifg=NONE    ctermfg=NONE guibg=#380505 ctermbg=52   gui=NONE cterm=NONE
hi GitGutterChangeDelete       guifg=#FFB633 ctermfg=215  gui=NONE cterm=NONE
hi GitGutterChangeDeleteLine   guifg=NONE    ctermfg=NONE guibg=#383805 ctermbg=237  gui=NONE cterm=NONE
hi GitSignsChangeDelete        guifg=#FFB633 ctermfg=215  gui=NONE cterm=NONE
hi GitSignsChangeDeleteLn      guifg=NONE    ctermfg=NONE guibg=#383805 ctermbg=237  gui=NONE cterm=NONE
hi qfFileName                  guifg=#6FCFFF ctermfg=81   gui=NONE cterm=NONE
hi qfLineNr                    guifg=#FFFF40 ctermfg=227  gui=NONE cterm=NONE
hi DiagnosticSignError         guifg=#E9475A ctermfg=167  gui=NONE cterm=NONE
hi DiagnosticSignWarn          guifg=#FFB633 ctermfg=215  gui=NONE cterm=NONE
hi DiagnosticSignInfo          guifg=#6FCFFF ctermfg=81   gui=NONE cterm=NONE
hi DiagnosticSignHint          guifg=#FFFFFF ctermfg=231  gui=NONE cterm=NONE
hi rubyAccess                  guifg=#6655DD ctermfg=62   guibg=NONE    ctermbg=NONE gui=ITALIC cterm=ITALIC cterm=NONE
hi rubyAttribute               guifg=#9C4FFF ctermfg=135  gui=NONE cterm=NONE
hi rubyBlockParameter          guifg=#06B0B0 ctermfg=37   gui=NONE cterm=NONE
hi rubyBlockParameterList      guifg=#008387 ctermfg=30   gui=NONE cterm=NONE
hi rubyBoolean                 guifg=#FFFF40 ctermfg=227  guibg=NONE    ctermbg=NONE gui=NONE cterm=NONE
hi rubyClass                   guifg=#CCA0FF ctermfg=183  gui=ITALIC cterm=ITALIC cterm=NONE
hi rubyClassName               guifg=#FFFF40 ctermfg=227  gui=BOLD cterm=BOLD cterm=BOLD
hi rubyClassVariable           guifg=#6FCFFF ctermfg=81   gui=NONE cterm=NONE
hi rubyConditional             guifg=#06B0B0 ctermfg=37   gui=NONE cterm=NONE
hi rubyConstant                guifg=#FFFF40 ctermfg=227  gui=NONE cterm=NONE
hi rubyControl                 guifg=#06B0B0 ctermfg=37   gui=NONE cterm=NONE
hi rubyComment                 guifg=#D7D7E3 ctermfg=188  guibg=NONE    ctermbg=NONE gui=ITALIC cterm=ITALIC cterm=NONE
hi rubyDefine                  guifg=#6655DD ctermfg=62   gui=NONE cterm=NONE
hi rubyDoBlock                 guifg=NONE    ctermfg=NONE guibg=NONE    ctermbg=NONE gui=NONE cterm=NONE
hi rubyException               guifg=#E9475A ctermfg=167  gui=NONE cterm=NONE
hi rubyExceptional             guifg=#FFB633 ctermfg=215  gui=NONE cterm=NONE
hi rubyFloat                   guifg=#8FFF3A ctermfg=119  gui=NONE cterm=NONE
hi rubyFunction                guifg=#6FCFFF ctermfg=81   gui=NONE cterm=NONE
hi rubyGlobalVariable          guifg=#FFB633 ctermfg=215  gui=NONE cterm=NONE
hi rubyInclude                 guifg=#9C4FFF ctermfg=135  gui=NONE cterm=NONE
hi rubyInstanceVariable        guifg=#50DF40 ctermfg=77   gui=NONE cterm=NONE
hi rubyInteger                 guifg=#8FFF3A ctermfg=119  gui=NONE cterm=NONE
hi rubyInterpolation           guifg=#8FFF3A ctermfg=119  gui=NONE cterm=NONE
hi rubyInterpolationDelimiter  guifg=#8FFF3A ctermfg=119  gui=NONE cterm=NONE
hi rubyKeyword                 guifg=#06B0B0 ctermfg=37   gui=NONE cterm=NONE
hi rubyMacro                   guifg=#CCA0FF ctermfg=183  guibg=NONE    ctermbg=NONE gui=ITALIC cterm=ITALIC cterm=NONE
hi rubyMethodBlock             guifg=NONE    ctermfg=NONE guibg=NONE    ctermbg=NONE gui=NONE cterm=NONE
hi rubyMethodDeclaration       guifg=#6FCFFF ctermfg=81   gui=NONE cterm=NONE
hi rubyModule                  guifg=#6655DD ctermfg=62   guibg=NONE    ctermbg=NONE gui=ITALIC cterm=ITALIC cterm=NONE
hi rubyPredefinedIdentifier    guifg=#FFB633 ctermfg=215  gui=NONE cterm=NONE
hi rubyPseudoVariable          guifg=#FFFF40 ctermfg=227  gui=NONE cterm=NONE
hi rubyRegexp                  guifg=#8FFF3A ctermfg=119  gui=NONE cterm=NONE
hi rubyRegexpAnchor            guifg=#50DF40 ctermfg=77   gui=NONE cterm=NONE
hi rubyRegexpDelimiter         guifg=#50DF40 ctermfg=77   gui=NONE cterm=NONE
hi rubyRegexpSpecial           guifg=#8FFF3A ctermfg=119  gui=NONE cterm=NONE
hi rubyRegexpQuantifier        guifg=#8FFF3A ctermfg=119  gui=NONE cterm=NONE
hi rubyRailsTestMethod         guifg=#FAFAFA ctermfg=231  gui=NONE cterm=NONE
hi rubyString                  guifg=#50DF40 ctermfg=77   gui=NONE cterm=NONE
hi rubyStringDelimiter         guifg=#06B0B0 ctermfg=37   gui=NONE cterm=NONE
hi rubySymbol                  guifg=#40B0FF ctermfg=75   gui=NONE cterm=NONE
hi rubyReturn                  guifg=#CCA0FF ctermfg=183  guibg=NONE    ctermbg=NONE gui=BOLD cterm=BOLD cterm=BOLD
hi rubyTodo                    guifg=#FFB633 ctermfg=215  guibg=NONE    ctermbg=NONE gui=BOLD cterm=BOLD cterm=BOLD
hi rspecBeforeAndAfter         guifg=#9C4FFF ctermfg=135  gui=NONE cterm=NONE
hi rspecGroupMethods           guifg=#9C4FFF ctermfg=135  gui=NONE cterm=NONE
hi rspecMatchers               guifg=#06B0B0 ctermfg=37   guibg=NONE    ctermbg=NONE gui=BOLD cterm=BOLD cterm=BOLD
hi rspecMocks                  guifg=#FFB633 ctermfg=215  gui=NONE cterm=NONE
hi elixirAlias                 guifg=#FFFF40 ctermfg=227  gui=NONE cterm=NONE
hi elixirAtom                  guifg=#40B0FF ctermfg=75   gui=NONE cterm=NONE
hi elixirBlockDefinition       guifg=#F4628D ctermfg=204  gui=NONE cterm=NONE
hi elixirBoolean               guifg=#FFB633 ctermfg=215  gui=NONE cterm=NONE
hi elixirDefine                guifg=#9C4FFF ctermfg=135  gui=NONE cterm=NONE
hi elixirFunctionDeclaration   guifg=#6FCFFF ctermfg=81   gui=NONE cterm=NONE
hi elixirGuard                 guifg=#F4628D ctermfg=204  gui=NONE cterm=NONE
hi elixirInclude               guifg=#6655DD ctermfg=62   gui=NONE cterm=NONE
hi elixirKeyword               guifg=#F4628D ctermfg=204  gui=NONE cterm=NONE
hi elixirMacroDeclaration      guifg=#6FCFFF ctermfg=81   gui=NONE cterm=NONE
hi elixirMacroDefine           guifg=#F4628D ctermfg=204  gui=NONE cterm=NONE
hi elixirModuleDefine          guifg=#9C4FFF ctermfg=135  gui=NONE cterm=NONE
hi elixirModuleDeclaration     guifg=#FFFF40 ctermfg=227  gui=NONE cterm=NONE
hi elixirNumber                guifg=#8FFF3A ctermfg=119  gui=NONE cterm=NONE
hi elixirPrivateDefine         guifg=#6655DD ctermfg=62   gui=NONE cterm=NONE
hi elixirSigil                 guifg=#50DF40 ctermfg=77   gui=NONE cterm=NONE
hi elixirSigilDelimiter        guifg=#50DF40 ctermfg=77   gui=NONE cterm=NONE
hi elixirStringDelimiter       guifg=#50DF40 ctermfg=77   gui=NONE cterm=NONE
hi elixirUnusedVariable        guifg=#FAFAFA ctermfg=231  gui=NONE cterm=NONE
hi elixirVariable              guifg=#FFFF40 ctermfg=227  gui=NONE cterm=NONE
hi htmlTag                     guifg=#50DF40 ctermfg=77   gui=NONE cterm=NONE
hi htmlTagN                    guifg=#50DF40 ctermfg=77   gui=NONE cterm=NONE
hi htmlSpecialTagName          guifg=#50DF40 ctermfg=77   gui=NONE cterm=NONE
hi htmlEndTag                  guifg=#50DF40 ctermfg=77   gui=NONE cterm=NONE
hi htmlArg                     guifg=#40B0FF ctermfg=75   gui=NONE cterm=NONE
hi htmlString                  guifg=#FAFAFA ctermfg=231  gui=NONE cterm=NONE
hi htmlTagName                 guifg=#50DF40 ctermfg=77   gui=NONE cterm=NONE
hi htmlLink                    guifg=#FAFAFA ctermfg=231  gui=NONE cterm=NONE
hi htmlComment                 guifg=#8C8CAF ctermfg=103  gui=ITALIC cterm=ITALIC cterm=NONE
hi htmlCommentPart             guifg=#8C8CAF ctermfg=103  gui=ITALIC cterm=ITALIC cterm=NONE
hi htmlCSSStyleComment         guifg=#8FFF3A ctermfg=119  gui=ITALIC cterm=ITALIC cterm=NONE
hi htmlitalic                  guifg=#FAFAFA ctermfg=231  guibg=NONE    ctermbg=NONE gui=ITALIC cterm=ITALIC cterm=NONE
hi htmlboldunderlineitalic     guifg=#FAFAFA ctermfg=231  guibg=NONE    ctermbg=NONE gui=ITALIC cterm=ITALIC,BOLD,UNDERLINE cterm=NONE
hi htmlbolditalic              guifg=#FAFAFA ctermfg=231  guibg=NONE    ctermbg=NONE gui=ITALIC cterm=ITALIC,BOLD cterm=NONE
hi htmlunderlineitalic         guifg=#FAFAFA ctermfg=231  guibg=NONE    ctermbg=NONE gui=ITALIC cterm=ITALIC,UNDERLINE cterm=NONE
hi htmlbold                    guifg=#FAFAFA ctermfg=231  guibg=NONE    ctermbg=NONE gui=BOLD cterm=BOLD cterm=BOLD
hi htmlboldunderline           guifg=#FAFAFA ctermfg=231  guibg=NONE    ctermbg=NONE gui=BOLD cterm=BOLD,UNDERLINE cterm=BOLD,UNDERLINE
hi htmlunderline               guifg=#FAFAFA ctermfg=231  guibg=NONE    ctermbg=NONE gui=UNDERLINE cterm=UNDERLINE
hi xmlTag                      guifg=#6FCFFF ctermfg=81   gui=NONE cterm=NONE
hi xmlEndTag                   guifg=#40B0FF ctermfg=75   gui=NONE cterm=NONE
hi xmlAttrib                   guifg=#6655DD ctermfg=62   gui=NONE cterm=NONE
hi cssAttributeSelector        guifg=#50DF40 ctermfg=77   gui=NONE cterm=NONE
hi cssBackgroundProp           guifg=#50DF40 ctermfg=77   gui=NONE cterm=NONE
hi cssBorderAttr               guifg=#6FCFFF ctermfg=81   gui=NONE cterm=NONE
hi cssBorderProp               guifg=#50DF40 ctermfg=77   gui=NONE cterm=NONE
hi cssBoxAttr                  guifg=#6FCFFF ctermfg=81   gui=NONE cterm=NONE
hi cssBackgroundAttr           guifg=#6FCFFF ctermfg=81   gui=NONE cterm=NONE
hi cssUIAttr                   guifg=#6FCFFF ctermfg=81   gui=NONE cterm=NONE
hi cssBoxProp                  guifg=#50DF40 ctermfg=77   gui=NONE cterm=NONE
hi cssBraces                   guifg=#FAFAFA ctermfg=231  gui=NONE cterm=NONE
hi cssColor                    guifg=#40B0FF ctermfg=75   gui=NONE cterm=NONE
hi cssColorAttr                guifg=#6FCFFF ctermfg=81   gui=NONE cterm=NONE
hi cssColorProp                guifg=#50DF40 ctermfg=77   gui=NONE cterm=NONE
hi cssCommonAttr               guifg=#6FCFFF ctermfg=81   gui=NONE cterm=NONE
hi cssDefinition               guifg=#40B0FF ctermfg=75   gui=NONE cterm=NONE
hi cssDefinition               guifg=#50DF40 ctermfg=77   gui=NONE cterm=NONE
hi cssDimensionProp            guifg=#50DF40 ctermfg=77   gui=NONE cterm=NONE
hi cssFontAttr                 guifg=#6FCFFF ctermfg=81   gui=NONE cterm=NONE
hi cssFontProp                 guifg=#50DF40 ctermfg=77   gui=NONE cterm=NONE
hi cssFunctionName             guifg=#FFFF40 ctermfg=227  gui=NONE cterm=NONE
hi cssGeneratedContentProp     guifg=#50DF40 ctermfg=77   gui=NONE cterm=NONE
hi cssNoise                    guifg=#FAFAFA ctermfg=231  gui=NONE cterm=NONE
hi cssPositioningProp          guifg=#50DF40 ctermfg=77   gui=NONE cterm=NONE
hi cssPositioningAttr          guifg=#FFFF40 ctermfg=227  gui=NONE cterm=NONE
hi cssPseudoClassId            guifg=#FFFF40 ctermfg=227  gui=NONE cterm=NONE
hi cssRenderProp               guifg=#50DF40 ctermfg=77   gui=NONE cterm=NONE
hi cssTableProp                guifg=#50DF40 ctermfg=77   gui=NONE cterm=NONE
hi cssTagName                  guifg=#FAFAFA ctermfg=231  gui=NONE cterm=NONE
hi cssTextAttr                 guifg=#6FCFFF ctermfg=81   gui=NONE cterm=NONE
hi cssTextProp                 guifg=#50DF40 ctermfg=77   gui=NONE cterm=NONE
hi cssURL                      guifg=#8FFF3A ctermfg=119  gui=NONE cterm=NONE
hi jsRegexpOr                  guifg=#CCA0FF ctermfg=183  gui=NONE cterm=NONE
hi jsRegexpAnd                 guifg=#CCA0FF ctermfg=183  gui=NONE cterm=NONE
hi jsRegexpString              guifg=#CCA0FF ctermfg=183  gui=NONE cterm=NONE
hi jsRegexpCharClass           guifg=#F4628D ctermfg=204  gui=NONE cterm=NONE
hi jsFuncArgs                  guifg=#6FCFFF ctermfg=81   gui=NONE cterm=NONE
hi jsGlobalObjects             guifg=#FFB633 ctermfg=215  gui=NONE cterm=NONE
hi jsFloat                     guifg=#06B0B0 ctermfg=37   gui=NONE cterm=NONE
hi jsReturn                    guifg=#9C4FFF ctermfg=135  gui=NONE cterm=NONE
hi jsStorageClass              guifg=#6FCFFF ctermfg=81   gui=NONE cterm=NONE
hi jsObjectKey                 guifg=#40B0FF ctermfg=75   gui=NONE cterm=NONE
hi jsStringS                   guifg=#50DF40 ctermfg=77   gui=NONE cterm=NONE
hi jsStringD                   guifg=#8FFF3A ctermfg=119  gui=NONE cterm=NONE
hi jsParens                    guifg=#6655DD ctermfg=62   gui=NONE cterm=NONE
hi jsNoise                     guifg=#6655DD ctermfg=62   gui=NONE cterm=NONE
hi jsOperator                  guifg=#FFFF40 ctermfg=227  gui=NONE cterm=NONE
hi jsFuncAssignExpr            guifg=#8C8CAF ctermfg=103  gui=NONE cterm=NONE
hi sshConfigHostSect           guifg=#40B0FF ctermfg=75   gui=BOLD cterm=BOLD cterm=BOLD
hi sshConfigHostPort           guifg=#6FCFFF ctermfg=81   gui=BOLD cterm=BOLD cterm=BOLD
hi sshConfigKeyword            guifg=#6655DD ctermfg=62   gui=NONE cterm=NONE
hi sshconfigPreferredAuth      guifg=#FFFF40 ctermfg=227  gui=NONE cterm=NONE
hi sshconfigNumber             guifg=#8FFF3A ctermfg=119  gui=NONE cterm=NONE
