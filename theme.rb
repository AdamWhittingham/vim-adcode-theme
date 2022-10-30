#! /usr/bin/env ruby

# Colors
plain_fg     = '#FAFAFA'
plain_bg     = '#07071A'
muted        = '#8C8CAF'
super_muted  = '#283048'
float_bg     = '#0A1840'
none         = 'none'

vertical_div = '#0C0C2C'
gutter = '#0C0C2C'
cursor_column = '#10084A'

white        = '#FFFFFF'
red          = '#E9475A'
dark_orange  = '#FF9800'
orange       = '#FFB633'
yellow       = '#FFFF40'
lime         = '#9FFF5A'
light_green  = '#A0FF80'
green        = '#50DF40'
dark_green   = '#107020'
teal         = '#16C0B0'
dark_teal    = '#107090'
dark_blue    = '#2070FF'
blue         = '#40B0FF'
light_blue   = '#7FCFFF'
light_purple = '#9F60FF'
purple       = '#7050FF'
dark_purple  = '#5040E0'
pink         = '#F06080'
magenta      = '#C030C0'
highlight    = '#F8D454'
visual       = '#003050'

bg_red       = '#200E21'
bg_orange    = '#231A1D'
bg_green     = '#103030'
bg_light_blue= '#131D33'

diff_add_bg  = '#063806'
diff_del_bg  = '#380505'
diff_moddel_bg  = '#383805'

def hi(name, fg: nil, bg: nil, styles: [])
  puts vim_hi(name, fg: fg, bg: bg, styles: Array(styles))
end

def vim_hi(name, fg: nil, bg: nil, styles: [])
  out = ["hi"]
  out << name
  out << "guifg=#{fg}" if fg
  out << "guibg=#{bg}" if bg
  out << resolve_style(styles)
  out.compact.join(" ")
end

def resolve_style(opts)
  return unless opts

  valid_opts = Array(opts).map {|opt| resolve_opt!(opt)}
  if valid_opts.any?
    "gui=#{valid_opts.join(',')}"
  end
end

VALID_OPTS = %i[
  bold
  underline
  undercurl
  underdouble
  underdotted
  underdashed
  strikethrough
  reverse
  italic
  standout
  nocombine
].freeze

def resolve_opt!(opt)
  return unless opt
  return opt if VALID_OPTS.include?(opt.to_sym)

  raise ArgumentError, "Opt #{opt} is not a valid option"
end

####################################
#               Core               #
####################################
# Core Vim Elemets
hi('Normal',               fg: plain_fg,      bg: plain_bg)
hi('Visual',                                  bg: visual)
hi('LineNr',               fg: muted,         bg: vertical_div)
hi('Cursor',               fg: plain_fg,      bg: white)
hi('CursorLine',           fg: none,          bg: gutter)
hi('CursorLineNr',         fg: green,         bg: gutter,       styles: :bold)
hi('CursorColumn',         fg: none,          bg: cursor_column)
hi('MatchParen',           fg: highlight,     bg: none,         styles: :bold)
hi('SignColumn',           fg: plain_fg,      bg: vertical_div)
hi('VertSplit',            fg: vertical_div,  bg: vertical_div)
hi('NonText',              fg: super_muted,                     styles: :bold)
hi('SpecialKey',           fg: dark_orange,                     styles: :bold)
hi('RedundantSpaces',      fg: none,          bg: red)
hi('BadSpaces',            fg: muted,         bg: red)
hi('NormalFloat',          fg: plain_fg,      bg: float_bg)
hi('FloatBorder',          fg: muted,         bg: float_bg)
hi('Folded',               fg: dark_blue,     bg: float_bg)
hi('InactiveWindow',       fg: none,          bg: vertical_div)

####################################
#            Programming           #
####################################
# Vim Syntax groups
hi("Boolean",              fg: orange)
hi("Character",            fg: green)
hi("Comment",              fg: muted, bg: none, styles: :italic)
hi("Conditional",          fg: magenta)
hi("Constant",             fg: blue)
hi("Debug",                fg: dark_orange)
hi("Define",               fg: plain_fg)
hi("Delimiter",            fg: dark_blue)
hi("Exception",            fg: red)
hi("Field",                fg: teal)
hi("Float",                fg: lime)
hi("Function",             fg: light_blue)
hi("Identifier",           fg: lime)
hi("Include",              fg: yellow)
hi("Keyword",              fg: light_purple, styles: :italic)
hi("KeywordFunction",      fg: light_purple, styles: :italic)
hi("Label",                fg: light_green)
hi("Number",               fg: green)
hi("Operator",             fg: plain_fg)
hi("Parameter",            fg: teal)
hi("PunctBracket",         fg: green)
hi("PunctDelimiter",       fg: white)
hi("PunctSpecial",         fg: green)
hi("Special",              fg: blue)
hi("Statement",            fg: light_purple)
hi("String",               fg: green)
hi("StringRegex",          fg: teal)
hi("Structure",            fg: blue)
hi("Symbol",               fg: blue)
hi("Title",                fg: blue)
hi("Todo",                 fg: orange)
hi("Type",                 fg: blue)
hi("Typedef",              fg: blue)
hi("Warning",              fg: orange, styles: :bold)
hi("bracket",              fg: plain_fg)

# Treesitter Syntax groups
hi("@comment",               fg: muted)
hi("@conditional",           fg: purple)
hi("@exception",             fg: red)
hi("@function",              fg: light_blue, styles: :bold)
hi("@function.call",         fg: light_blue)
hi("@keyword.return",        fg: magenta,    styles: :italic)
hi("@parameter",             fg: white)
hi("@property",              fg: light_blue)
hi("@punctuation.bracket",   fg: plain_fg)
hi("@punctuation.delimiter", fg: light_blue)
hi("@punctuation.special",   fg: light_purple)
hi("@string",                fg: teal)
hi("@symbol",                fg: light_blue)
hi("@variable",              fg: plain_fg)
hi("@variable.builtin",      fg: plain_fg,   style:  :italic)

####################################
#               Text               #
####################################
hi("@text.title", styles: %i[bold italic])

####################################
#                UI                #
####################################
# Start page
hi("StartifyBracket",  fg: muted)
hi("StartifyPath",     fg: blue)
hi("StartifySlash",    fg: muted)
hi("StartifyFile",     fg: light_blue)
hi("StartifyFooter",   fg: muted)
hi("StartifyHeader",   fg: green)
hi("StartifyNumber",   fg: orange)
hi("StartifySpecial",  fg: light_blue)
hi("StartLogo1",       fg: '#14067E')
hi("StartLogo2",       fg: '#15127B')
hi("StartLogo3",       fg: '#171F78')
hi("StartLogo4",       fg: '#182B75')
hi("StartLogo5",       fg: '#193872')
hi("StartLogo6",       fg: '#1A446E')
hi("StartLogo7",       fg: '#1C506B')
hi("StartLogo8",       fg: '#1D5D68')
hi("StartLogo9",       fg: '#1E6965')
hi("StartLogo10",      fg: '#1F7562')
hi("StartLogo11",      fg: '#21825F')
hi("StartLogo12",      fg: '#228E5C')
hi("StartLogo13",      fg: '#239B59')
hi("StartLogo14",      fg: '#24A755')
hi("StartLogo15",      fg: '#26B352')
hi("StartLogo16",      fg: '#27C04F')
hi("StartLogo17",      fg: '#28CC4C')
hi("StartLogo18",      fg: '#29D343')

# Menus
hi("PMenu"        , fg: plain_fg, bg: visual)
hi("PMenuSbar"    , fg: none,     bg: muted)
hi("PMenuSel"     , fg: plain_fg, bg: dark_blue)
hi("PMenuThumb"   , fg: plain_bg, bg: blue)

# Quick Find window
hi("qfFileName",    fg: light_blue)
hi("qfLineNr",      fg: yellow)

# Spelling and Search
hi("SpellBad", fg: red,       bg: bg_red,    styles: :undercurl)
hi("SpellCap", fg: orange,    bg: bg_orange, styles: :undercurl)
hi("Search",   fg: highlight, bg: bg_orange, styles: :bold)

# LSP
hi("DiagnosticSignError",        fg: red,        bg: gutter)
hi("DiagnosticVirtualTextError", fg: red,        bg: bg_red)
hi("DiagnosticSignWarn",         fg: orange,     bg: gutter)
hi("DiagnosticVirtualTextWarn",  fg: orange,     bg: bg_orange)
hi("DiagnosticSignInfo",         fg: light_blue, bg: gutter)
hi("DiagnosticVirtualTextInfo",  fg: light_blue, bg: bg_light_blue)
hi("DiagnosticSignHint",         fg: white)
hi("LspSignatureActiveParameter",fg: light_blue)
hi("LspReferenceText",           fg: none,       bg: bg_light_blue, styles: :bold)
hi("LspReferenceRead",           fg: blue,       bg: bg_light_blue, styles: :bold)
hi("LspReferenceWrite",          fg: blue,       bg: bg_light_blue, styles: :bold)

# Indentation guidelines
hi("IndentBlanklineChar",        fg: super_muted)
hi("IndentBlanklineContextChar", fg: dark_purple)
hi("IndentBlanklineContextStart",fg: none,       bg: super_muted, styles: :bold)

## CMP
hi("CmpItemKindText",            fg: muted)
hi("CmpItemKindMethod",          fg: purple)
hi("CmpItemKindFunction",        fg: light_blue)
hi("CmpItemKindConstructor",     fg: blue)
hi("CmpItemKindField",           fg: light_green)
hi("CmpItemKindVariable",        fg: green)
hi("CmpItemKindClass",           fg: yellow)
hi("CmpItemKindInterface",       fg: orange)
hi("CmpItemKindValue",           fg: teal)
hi("CmpItemKindEnum",            fg: teal)
hi("CmpItemKindKeyword",         fg: purple)
hi("CmpItemKindSnippet",         fg: lime)
hi("CmpItemKindFile",            fg: plain_fg)
hi("CmpItemKindFolder",          fg: plain_fg)

## Telescope
hi("TelescopeBorder",            fg: super_muted)
hi("TelescopeNormal",            fg: plain_fg,   bg: plain_bg)
hi("TelescopePreviewTitle",      fg: white,      bg: super_muted)
hi("TelescopeResultsTitle",      fg: white,      bg: super_muted)
hi("TelescopeSelection",         fg: white,      bg: visual)
hi("TelescopePromptBorder",      fg: dark_purple)
hi("TelescopePromptTitle",       fg: white,      bg: dark_purple)
hi("TelescopePromptNormal",      fg: white,      bg: plain_bg)
hi("TelescopePromptPrefix",      fg: lime)

# Packer
hi("packerStatus", fg: purple)
hi("packerStatusCommit", fg: yellow)
hi("packerStatusSuccess", fg: green)
hi("packerStatusFail", fg: red)
hi("packerPackageName", fg: plain_fg)
hi("packerPackageNotLoaded", fg: yellow)
hi("packerString", fg: blue)
hi("packerBool", fg: blue)
hi("packerBreakingChange", fg: red)
hi("packerWorking", fg: blue)
hi("packerSuccess", fg: green)
hi("packerFail", fg: red)
hi("packerHash", fg: yellow)
hi("packerRelDate", fg: muted)
hi("packerProgress", fg: purple)
hi("packerOutput", fg: plain_fg)
hi("packerTimeTrivial", fg: muted)
hi("packerTimeLow", fg: plain_fg)
hi("packerTimeMedium", fg: yellow)
hi("packerTimeHigh", fg: orange)

# Gitsigns & Diffs
hi("GitGutterAdd", fg: green, bg: vertical_div)
hi("GitGutterAddLine", fg: none, bg: diff_add_bg)
hi("DiffAdd", fg: green, bg: vertical_div)
hi("DiffAddLn", fg: none, bg: diff_add_bg)
hi("GitGutterChange", fg: yellow, bg: vertical_div)

hi("GitGutterChangeLine", fg: none, bg: diff_moddel_bg)
hi("DiffChange", fg: yellow, bg: vertical_div)
hi("DiffChangeLn", fg: none, bg: diff_moddel_bg)

hi("GitGutterDelete", fg: red, bg: vertical_div)
hi("GitGutterDeleteLine", fg: none, bg: diff_del_bg)
hi("DiffDelete", fg: red, bg: vertical_div)
hi("DiffDeleteLn", fg: none, bg: diff_del_bg)

hi("GitGutterChangeDelete", fg: orange, bg: vertical_div)
hi("GitGutterChangeDeleteLine", fg: none, bg: diff_moddel_bg)
hi("DiffChangeDelete", fg: orange, bg: vertical_div)
hi("DiffChangeDeleteLn", fg: none, bg: diff_moddel_bg)

## Gitsigns preview window
hi("DiffAdded", fg: green, bg: diff_add_bg)
hi("DiffRemoved", fg: red, bg: diff_del_bg)

# DAP
hi("DapBreakpoint", fg: orange, bg: vertical_div)
hi("DapBreakpointConditional", fg: yellow, bg: vertical_div)
hi("DapBreakpointRejected", fg: red, bg: vertical_div)
hi("DapStopped", fg: green, bg: vertical_div)
hi("DapStoppedLine", fg: none, bg: super_muted, styles: :italic)

# Yanky
hi("YankyPut", fg: none, bg: dark_purple)
hi("YankyYanked", fg: none, bg: dark_purple)

# Artificially stop processing below here as Ruby for incremental dev
__END__

# NetRW
  "netrwData"	   blue
  "netrwSymLink" green

# BufExplorer
  "bufExplorerCurFile" light_blue
  "bufExplorerAltBuf"  blue
  "bufExplorerHelp"    muted
  "bufExplorerSortBy"  green

# Language Specific
## Ruby
  "rubyAccess"               purple,     none, gui: :italic
  "rubyAttribute"            light_purple
  "rubyBlockParameter"       teal
  "rubyBlockParameterList"   dark_teal
  "rubyBoolean"              yellow, none
  "rubyClass"                magenta, gui: :italic
  "rubyClassName"            yellow, gui: :bold
  "rubyClassVariable"        light_blue
  "rubyConditional"          teal
  "rubyConstant"             yellow
  "rubyControl"              teal
  "rubyComment"              muted,  none,  gui: :italic
  "rubyDefine"               purple
  "rubyDoBlock"              none,            none
  "rubyException"            red
  "rubyExceptional"          orange
  "rubyFloat"                lime
  "rubyFunction"             light_blue
  "rubyGlobalVariable"       orange
  "rubyInclude"              light_purple
  "rubyInstanceVariable"     green
  "rubyInteger"              lime
  "rubyInterpolation"        lime
  "rubyInterpolationDelimiter" lime
  "rubyKeyword"              teal
  "rubyMacro"                magenta,    none, gui:  'italic'
  "rubyMethodBlock"          none,       none
  "rubyMethodDeclaration"    light_blue
  "rubyModule"               purple,     none, gui:  'italic'
  "rubyPredefinedIdentifier" orange
  "rubyPseudoVariable"       yellow
  "rubyRegexp"               lime
  "rubyRegexpAnchor"         green
  "rubyRegexpDelimiter"      green
  "rubyRegexpSpecial"        lime
  "rubyRegexpQuantifier"     lime
  "rubyRailsTestMethod"      plain_fg
  "rubyString"               green
  "rubyStringDelimiter"      teal
  "rubySymbol"               blue
  "rubyReturn"               magenta, none, gui: 'bold'
  "rubyTodo"                 orange,       none, gui: 'bold'

## Rspec
  "rspecBeforeAndAfter"      light_purple
  "rspecGroupMethods"        light_purple
  "rspecMatchers"            teal, none, gui: 'bold'
  "rspecMocks"               orange

## Elixir
  "elixirAlias"               yellow
  "elixirAtom"                blue
  "elixirBlockDefinition"     pink
  "elixirBoolean"             orange
  "elixirDefine"              light_purple
  "elixirFunctionDeclaration" light_blue
  "elixirGuard"               pink
  "elixirInclude"             purple
  "elixirKeyword"             pink
  "elixirMacroDeclaration"    light_blue
  "elixirMacroDefine"         pink
  "elixirModuleDefine"        light_purple
  "elixirModuleDeclaration"   yellow
  "elixirNumber"              lime
  "elixirPrivateDefine"       purple
  "elixirSigil"               green
  "elixirSigilDelimiter"      green
  "elixirStringDelimiter"     green
  "elixirUnusedVariable"      plain_fg
  "elixirVariable"            yellow

## HTML
  "htmlTag"                 green
  "htmlTagN"                green
  "htmlSpecialTagName"      green
  "htmlEndTag"              green
  "htmlArg"                 blue
  "htmlString"              plain_fg
  "htmlTagName"             green
  "htmlLink"                plain_fg
  "htmlComment"             muted, gui:    'italic', cterm: 'italic'
  "htmlCommentPart"         muted, gui:    'italic', cterm: 'italic'
  "htmlCSSStyleComment"     lime, gui:    'italic', cterm: 'italic'
  "htmlitalic"              plain_fg, none, gui: 'italic'
  "htmlboldunderlineitalic" plain_fg, none, gui: 'italic,bold,underline'
  "htmlbolditalic"          plain_fg, none, gui: 'italic,bold'
  "htmlunderlineitalic"     plain_fg, none, gui: 'italic,underline'
  "htmlbold"                plain_fg, none, gui: 'bold'
  "htmlboldunderline"       plain_fg, none, gui: 'bold,underline'
  "htmlunderline"           plain_fg, none, gui: 'underline'

## XML
  "xmlTag"                  light_blue
  "xmlEndTag"               blue
  "xmlAttrib"               purple

## CSS
  "cssAttributeSelector"    green
  "cssBackgroundProp"       green
  "cssBorderAttr"           light_blue
  "cssBorderProp"           green
  "cssBoxAttr"              light_blue
  "cssBackgroundAttr"       light_blue
  "cssUIAttr"               light_blue
  "cssBoxProp"              green
  "cssBraces"               plain_fg
  "cssColor"                blue
  "cssColorAttr"            light_blue
  "cssColorProp"            green
  "cssCommonAttr"           light_blue
  "cssDefinition"           blue
  "cssDefinition"           green
  "cssDimensionProp"        green
  "cssFontAttr"             light_blue
  "cssFontProp"             green
  "cssFunctionName"         yellow
  "cssGeneratedContentProp" green
  "cssNoise"                plain_fg
  "cssPositioningProp"      green
  "cssPositioningAttr"      yellow
  "cssPseudoClassId"        yellow
  "cssRenderProp"           green
  "cssTableProp"            green
  "cssTagName"              plain_fg
  "cssTextAttr"             light_blue
  "cssTextProp"             green
  "cssURL"                  lime

## Javascript
  "jsRegexpOr"              magenta
  "jsRegexpAnd"             magenta
  "jsRegexpString"          magenta
  "jsRegexpCharClass"       pink
  "jsFuncArgs"              light_blue
  "jsGlobalObjects"         orange
  "jsFloat"                 teal
  "jsReturn"                light_purple
  "jsStorageClass"          light_blue
  "jsObjectKey"             blue
  "jsStringS"               green
  "jsStringD"               lime
  "jsParens"                purple
  "jsNoise"                 purple
  "jsOperator"              yellow
  "jsFuncAssignExpr"        muted

## Markdown
  "TSTitle"                 light_green, gui: :bold

## SSH Config
  "sshConfigHostSect"       blue,         gui: 'bold'
  "sshConfigHostPort"       light_blue,   gui: 'bold'
  "sshConfigKeyword"        purple
  "sshconfigPreferredAuth"  yellow
  "sshconfigNumber"         lime
