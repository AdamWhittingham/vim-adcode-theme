#! /usr/bin/env ruby

# Colors
plain_fg     = '#FAFAFA'
plain_bg     = '#07071A'
dark_bg      = '#030340'
muted        = '#8C8CAF'
super_muted  = '#283048'
float_bg     = '#0A1840'
none         = 'NONE'
@none        = none

vertical_div = '#0C0C2C'
gutter = '#0C0C2C'
cursor_column = '#10084A'

white        = '#FFFFFF'
red          = '#E9475A'
dark_orange  = '#FF9800'
orange       = '#FFB633'
yellow       = '#FFFF40'
lime         = '#70FF5A'
light_green  = '#50E080'
green        = '#50DF40'
dark_green   = '#107020'
teal         = '#30D0C0'
dark_teal    = '#107090'
darker_blue  = '#104080'
dark_blue    = '#2070FF'
mid_blue     = '#20A0FF'
blue         = '#40B0FF'
light_blue   = '#70D0FF'
light_purple = "#A080FF"
purple       = '#8860FF'
dark_purple  = '#7050FF'
darker_purple= '#5040E0'
pink         = '#D040B0'
magenta      = '#C030C0'
highlight    = '#F8D454'
visual       = '#003050'

bg_red       = '#200C20'
bg_orange    = '#231A1D'
bg_green     = '#103030'
bg_light_blue= '#131D33'

diff_add_bg  = '#063806'
diff_del_bg  = '#380505'
diff_moddel_bg  = '#383805'

conflict_mine  = '#103050'
conflict_theirs  = '#503010'

def hi(name, fg: nil, bg: nil, styles: [], guisp: nil, undercurl: nil, underdotted: nil)
  puts vim_hi(name, fg: fg, bg: bg, styles: Array(styles), guisp: guisp, undercurl: undercurl, underdotted: nil)
end

def vim_hi(name, fg: nil, bg: nil, styles: [], guisp: nil, undercurl: nil, underdotted: nil)
  out = ["hi"]
  out << name

  if fg
    out << "ctermfg=#{cterm(fg)}"
    out << "guifg=#{fg}"
  end

  if bg
    out << "ctermbg=#{cterm(bg)}"
    out << "guibg=#{bg}"
  end

  out << resolve_style(styles)
  out << undercurl(undercurl) if undercurl
  out << underdotted(underdotted) if underdotted
  out << "guisp=#{guisp}" if guisp
  out.compact.join(" ")
end

XT_VALUES = [0, 95, 135, 175, 215, 255].freeze # the set of possible RGB values in XTerm
RESERVED_COLORS = 16

@cterm_cache = {}

def cterm(hex)
  return hex if hex == @none
  return unless hex.length == 7

  cached = @cterm_cache[hex]
  return cached if cached

  r = hex[1..2].to_i(16)
  g = hex[3..4].to_i(16)
  b = hex[5..6].to_i(16)
  c = [r, g, b]

  lookup = (0..239).map do |n| # Create the array of Xterm triplets
    if n < 216
      [
        XT_VALUES[n / 36],
        XT_VALUES[(n % 36) / 6],
        XT_VALUES[n % 6]
      ]
    else
      [n * 10 - 2152] * 3 # create a uniform triplet
    end
  end

  # Map from triplets to Manhattan distance
  lookup.map! do |t|
    t.zip(c).map do |xterm_channel, hex_channel|
      (xterm_channel - hex_channel).abs
    end.sum
  end

  cterm = lookup.rindex(lookup.min) + RESERVED_COLORS
  @cterm_cache[hex] = cterm
  cterm
end

def resolve_style(opts)
  return unless opts

  valid_opts = Array(opts).map { |opt| resolve_opt!(opt) }
  if valid_opts.any?
    "gui=#{valid_opts.join(',')}"
  end
end

def undercurl(guisp)
  "term=underline cterm=undercurl guisp=#{guisp}"
end

def underdotted(guisp)
  "term=underline cterm=underdotted guisp=#{guisp}"
end

VALID_OPTS = %i[
  bold
  underline
  underdouble
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
hi('Normal',                      fg: plain_fg,     bg: plain_bg)
hi('Visual',                      bg: visual)
hi('LineNr',                      fg: muted,        bg: vertical_div)
hi('Cursor',                      fg: plain_fg,     bg: white)
hi('CursorLine',                  fg: none,         bg: gutter)
hi('CursorLineNr',                fg: green,        bg: gutter,         styles: :bold)
hi('CursorColumn',                fg: none,         bg: cursor_column)
hi('MatchParen',                  fg: green,        bg: bg_green,           styles: :bold)
hi('SignColumn',                  fg: plain_fg,     bg: vertical_div)
hi('VertSplit',                   fg: vertical_div, bg: vertical_div)
hi('NonText',                     fg: super_muted,  styles: :bold)
hi('SpecialKey',                  fg: dark_orange,  styles: :bold)
hi('RedundantSpaces',             fg: none,         bg: red)
hi('BadSpaces',                   fg: muted,        bg: red)
hi('NormalFloat',                 fg: plain_fg,     bg: float_bg)
hi('FloatBorder',                 fg: muted,        bg: float_bg)
hi('Folded',                      fg: dark_blue,    bg: float_bg)
hi('InactiveWindow',              fg: none,         bg: vertical_div)
hi('ErrorMsg',                    fg: red,          bg: bg_red)
hi('StatusLine',                  fg: muted,        bg: float_bg)

####################################
#            Programming           #
####################################
# Vim Syntax groups
hi("Boolean",                     fg: light_purple)
hi("Conceal",                     fg: orange, bg: bg_orange)
hi("Character",                   fg: green)
hi("Comment",                     fg: muted,        bg: none,           styles: :italic)
hi("Conditional",                 fg: magenta)
hi("Constant",                    fg: blue)
hi("Debug",                       fg: dark_orange)
hi("Define",                      fg: plain_fg)
hi("Delimiter",                   fg: dark_blue)
hi("Exception",                   fg: red)
hi("Field",                       fg: teal)
hi("Float",                       fg: lime)
hi("Function",                    fg: light_blue)
hi("Identifier",                  fg: plain_fg)
hi("Include",                     fg: pink)
hi("Keyword",                     fg: light_purple, styles: :italic)
hi("KeywordFunction",             fg: light_purple, styles: :italic)
hi("Label",                       fg: light_green)
hi("Number",                      fg: green)
hi("Operator",                    fg: plain_fg)
hi("Parameter",                   fg: teal)
hi("PunctBracket",                fg: green)
hi("PunctDelimiter",              fg: white)
hi("PunctSpecial",                fg: green)
hi("Special",                     fg: blue)
hi("Statement",                   fg: light_purple)
hi("String",                      fg: green)
hi("StringRegex",                 fg: teal)
hi("Structure",                   fg: blue)
hi("Symbol",                      fg: blue)
hi("Title",                       fg: blue)
hi("Todo",                        fg: orange)
hi("Type",                        fg: blue)
hi("Typedef",                     fg: blue)
hi("Warning",                     fg: orange,       styles: :bold)
hi("bracket",                     fg: plain_fg)

# Treesitter Syntax groups
hi("@comment",               fg: muted,      styles: :italic)
hi("@conditional",           fg: light_purple) # Depreacted
hi("@keyword.conditional",   fg: light_purple)
hi("@exception",             fg: red) # Depreacted
hi("@keyword.exception",     fg: red)
hi("@function",              fg: light_blue, styles: :bold)
hi("@function.call",         fg: light_blue)
hi("@include",               fg: pink)
hi("@keyword.include",       fg: pink)
hi("@keyword",               fg: purple,     styles: :italic)
hi("@keyword.return",        fg: magenta,    styles: :italic)
hi("@namespace",             fg: dark_teal) # Depreacted
hi("@module",                fg: dark_teal)
hi("@operator",              fg: white)
hi("@parameter",             fg: plain_fg) # Depreacted
hi("@variable.parameter",    fg: plain_fg)
hi("@property",              fg: light_blue)
hi("@punctuation.bracket",   fg: dark_blue)
hi("@punctuation.delimiter", fg: light_blue)
hi("@punctuation.special",   fg: light_purple)
hi("@label",                 fg: teal)
hi("@string",                fg: light_green)
hi("@string.escape",         fg: lime)
hi("@string.regex",          fg: lime)
hi("@string.regexp",         fg: lime) # Depreacted
hi("@symbol",                fg: teal) # Depreacted
hi("@string.special.symbol", fg: teal)
hi("@string.special.uri",    fg: light_blue, undercurl: blue)
hi("@variable",              fg: plain_fg)
hi("@variable.builtin",      fg: plain_fg,   styles:  :italic)
hi("@field",                 fg: light_blue) # Depreacted
hi("@variable.member",       fg: light_blue)
hi("@number.float",          fg: lime)

# Treesitter Context
hi("TreesitterContext",           fg: muted, bg: dark_bg, styles: :italic)
hi("TreesitterContextLineNumber", fg: darker_blue, bg: dark_bg, styles: :italic)

####################################
#               Text               #
####################################
hi("@text.title",      fg: light_green, styles: %i[bold])
hi("@text.todo",       fg: blue,        bg: bg_light_blue, styles: %i[bold italic]) # Deprecated
hi("@comment.todo",    fg: blue,        bg: bg_light_blue, styles: %i[bold italic])
hi("@text.warning",    fg: orange,      bg: bg_orange,     styles: %i[bold italic]) # Deprecated
hi("@comment.warning", fg: orange,      bg: bg_orange,     styles: %i[bold italic])
hi("@text.danger",     fg: red,         bg: bg_red,        styles: %i[bold italic]) # Deprecated
hi("@comment.danger",  fg: red,         bg: bg_red,        styles: %i[bold italic])
hi("@comment.error",   fg: red,         bg: bg_red,        styles: %i[bold italic])
hi("ghostText",        fg: super_muted, styles: %i[italic])

# Markdown
hi("@markup.heading",               fg: light_green, styles: %i[bold])
hi("@markup.raw",                   fg: light_blue, bg: bg_light_blue)
hi("@text.literal.markdown",        fg: light_blue, bg: bg_light_blue)
hi("@text.literal.markdown_inline", fg: light_blue, bg: bg_light_blue)
hi("@markup.link",                  fg: muted, undercurl: blue)
hi("@markup.link.label",            fg: blue)
hi("@markup.link.url",              fg: purple, styles: %i[italic])
hi("@markup.list",                  fg: pink)
hi("@markup.strong",                            styles: %i[bold])
hi("@markup.italic",                            styles: %i[italic])

####################################
#                UI                #
####################################
# Start page
hi("StartifyBracket",             fg: muted)
hi("StartifyPath",                fg: blue)
hi("StartifySlash",               fg: muted)
hi("StartifyFile",                fg: light_blue)
hi("StartifyFooter",              fg: muted)
hi("StartifyHeader",              fg: green)
hi("StartifyNumber",              fg: orange)
hi("StartifySpecial",             fg: light_blue)

# Thanks to https://colordesigner.io/gradient-generator
%w[
  #29d142
  #00d05f
  #00ce79
  #00cb92
  #00c8aa
  #00c4c0
  #00bfd3
  #00bae3
  #00b4f0
  #00adf8
  #00a6fc
  #009dfc
  #0095f8
  #008bf0
].each_with_index do |hex, i|
    hi("StartLogo#{i}",   fg: hex)
  end


%w[
  #bd075c
  #b7015f
  #b00062
  #a90064
  #a20066
  #9a0069
  #92006a
  #8a006c
].each_with_index do |hex, i|
    hi("StartLogoPop#{i}",   fg: hex)
  end

# Menus
hi("PMenu",                       fg: plain_fg,     bg: float_bg)
hi("PMenuSel",                                      bg: darker_blue)
hi("PMenuSbar",                   fg: plain_fg,     bg: float_bg)
hi("PMenuThumb",                  fg: plain_bg,     bg: darker_purple)

# Quick Find window
hi("qfFileName",                  fg: light_blue)
hi("qfLineNr",                    fg: yellow)

# Spelling and Search
hi("SpellBad",                    bg: bg_red,       undercurl: red)
hi("SpellCap",                    bg: bg_orange,    undercurl: orange)
hi("Search",                      fg: highlight,    bg: bg_orange,      styles: :bold)

# LSP
hi("DiagnosticSignError",         fg: red,          bg: gutter)
hi("DiagnosticVirtualTextError",  fg: red,          bg: bg_red)
hi("DiagnosticSignWarn",          fg: orange,       bg: gutter)
hi("DiagnosticVirtualTextWarn",   fg: orange,       bg: bg_orange)
hi("DiagnosticSignInfo",          fg: light_blue,   bg: gutter)
hi("DiagnosticVirtualTextInfo",   fg: light_blue,   bg: bg_light_blue)
hi("DiagnosticSignHint",          fg: white)
hi("LspSignatureActiveParameter", fg: light_blue)

hi("LspReferenceText",            fg: none,         bg: bg_light_blue,  styles: :bold, underdotted: yellow)
hi("LspReferenceRead",            fg: blue,         bg: bg_light_blue,  styles: :bold, underdotted: yellow)
hi("LspReferenceWrite",           fg: blue,         bg: bg_light_blue,  styles: :bold, underdotted: yellow)

### LSPsaga
hi("SagaNormal",                                    bg: float_bg)
hi("SagaBorder",                  fg: dark_blue,    bg: float_bg)
hi("DiagnosticInfo",              fg: light_blue)
hi("DiagnostiError",              fg: red)
hi("DiagnosticWarn",              fg: orange)

# Indentation guidelines
# ## V3
hi("IblIndent",                   fg: super_muted)
hi("IblScope",                    fg: darker_purple)

## V2
hi("InentBlanklineChar",          fg: super_muted)
hi("IndentBlanklineContextChar",  fg: darker_purple, styles: :nocombine)
hi("IndentBlanklineContextStart", fg: none,          styles: :bold)

## CMP
hi("CmpItemKindText",             fg: muted)
hi("CmpItemKindMethod",           fg: purple)
hi("CmpItemKindFunction",         fg: light_blue)
hi("CmpItemKindConstructor",      fg: blue)
hi("CmpItemKindField",            fg: light_green)
hi("CmpItemKindVariable",         fg: green)
hi("CmpItemKindClass",            fg: yellow)
hi("CmpItemKindInterface",        fg: orange)
hi("CmpItemKindValue",            fg: teal)
hi("CmpItemKindEnum",             fg: teal)
hi("CmpItemKindKeyword",          fg: purple)
hi("CmpItemKindSnippet",          fg: lime)
hi("CmpItemKindFile",             fg: plain_fg)
hi("CmpItemKindFolder",           fg: plain_fg)

## Telescope
hi("TelescopeNormal",             fg: plain_fg,     bg: plain_bg)
hi("TelescopeBorder",             fg: super_muted)

hi("TelescopeSelection",          fg: white,        bg: visual)
hi("TelescopeSelectionCaret",     fg: pink)
hi("TelescopeMatching",           fg: lime)

hi("TelescopePreviewTitle",       fg: white,        bg: plain_bg)
hi("TelescopePreviewNormal",                        bg: float_bg)
hi("TelescopePreviewBorder",      fg: float_bg,     bg: float_bg)

hi("TelescopeResultsTitle",       fg: white,        bg: super_muted)
hi("TelescopeResultsDiffAdd",                       bg: bg_green)
hi("TelescopeResultsDiffChange",                    bg: bg_orange)
hi("TelescopeResultsDiffDelete",                    bg: bg_red)
hi("TelescopeResultsDiffUntracked",                 bg: bg_light_blue)

hi("TelescopePromptTitle",        fg: white,        bg: dark_purple)
hi("TelescopePromptNormal",       fg: white,        bg: plain_bg)
hi("TelescopePromptPrefix",       fg: lime)
hi("TelescopePromptBorder",       fg: dark_purple,  bg: plain_bg)
hi("TelescopePromptCounter",      fg: dark_purple)

# Lazy
hi("LazyDimmed", fg: muted, styles: :italic)

# Gitsigns & Diffs
## Added
hi("GitGutterAdd",        fg: green,  bg: vertical_div)
hi("GitGutterAddLine",    fg: none,   bg: diff_add_bg)
hi("DiffAdd",             fg: green,  bg: vertical_div)
hi("DiffAddLn",           fg: none,   bg: diff_add_bg)
hi("@text.diff.plus",     fg: none,   bg: diff_add_bg)

## Changed
hi("GitGutterChange",     fg: yellow, bg: vertical_div)
hi("GitGutterChangeLine", fg: none,   bg: diff_moddel_bg)
hi("DiffChange",          fg: yellow, bg: vertical_div)
hi("DiffChangeLn",        fg: none,   bg: diff_moddel_bg)
hi("DiffText",            fg: none,   bg: diff_moddel_bg)
hi("@text.diff.delta",    fg: none,   bg: diff_moddel_bg)

## Deleted
hi("GitGutterDelete",     fg: red,    bg: vertical_div)
hi("GitGutterDeleteLine", fg: none,   bg: diff_del_bg)
hi("DiffDelete",          fg: red,    bg: vertical_div)
hi("DiffDeleteLn",        fg: none,   bg: diff_del_bg)
hi("@text.diff.minus",    fg: none,   bg: diff_del_bg)

## ChangeDelete
hi("GitGutterChangeDelete",       fg: orange,       bg: vertical_div)
hi("GitGutterChangeDeleteLine",   fg: none,         bg: diff_moddel_bg)
hi("DiffChangeDelete",            fg: orange,       bg: vertical_div)
hi("DiffChangeDeleteLn",          fg: none,         bg: diff_moddel_bg)


## Gitsigns preview window
hi("DiffAdded",                   fg: green,        bg: diff_add_bg)
hi("DiffRemoved",                 fg: red,          bg: diff_del_bg)

hi("DiffConflictMine",                              bg: conflict_mine)
hi("DiffConflictTheirs",                            bg: conflict_theirs)

# DAP
hi("DapBreakpoint",               fg: orange,       bg: vertical_div)
hi("DapBreakpointConditional",    fg: yellow,       bg: vertical_div)
hi("DapBreakpointRejected",       fg: red,          bg: vertical_div)
hi("DapStopped",                  fg: green,        bg: vertical_div)
hi("DapStoppedLine",              fg: none,         bg: super_muted,    styles: :italic)

# Whichkey
hi("WhichKey",                    fg: light_blue)
hi("WhichKeySeparator",           fg: muted)
hi("WhichKeyDesc",                fg: light_purple)
hi("WhichKeyGroup",               fg: teal)

# Yanky
hi("YankyPut",                    fg: none,         bg: dark_purple)
hi("YankyYanked",                 fg: none,         bg: dark_purple)

## SSH Config
hi("sshconfigMatch",              fg: purple)
hi("sshconfigHostPort",           fg: blue,         styles: :bold)
hi("sshconfigKeyword",            fg: mid_blue)
hi("sshconfigPreferredAuth",      fg: yellow)
hi("sshconfigYesNo",              fg: orange)
hi("sshconfigNumber",             fg: lime)
hi("sshconfigLogLevel",           fg: orange)
