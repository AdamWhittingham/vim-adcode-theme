#! /usr/bin/env ruby

# Colors
plain_fg     = '#FAFAFA'
plain_bg     = '#07071A'
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
lime         = '#9FFF5A'
light_green  = '#50E080'
green        = '#50DF40'
dark_green   = '#107020'
teal         = '#30D0C0'
dark_teal    = '#107090'
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

def hi(name, fg: nil, bg: nil, styles: [], guisp: nil)
  puts vim_hi(name, fg: fg, bg: bg, styles: Array(styles), guisp: guisp)
end

def vim_hi(name, fg: nil, bg: nil, styles: [], guisp: nil)
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

  out << "guisp=#{guisp}" if guisp
  out << resolve_style(styles)
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

####################################
#            Programming           #
####################################
# Vim Syntax groups
hi("Boolean",                     fg: orange)
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
hi("Identifier",                  fg: lime)
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
hi("@comment",                    fg: muted,        styles: :italic)
hi("@conditional",                fg: light_purple)
hi("@exception",                  fg: red)
hi("@function",                   fg: light_blue,   styles: :bold)
hi("@function.call",              fg: light_blue)
hi("@include",                    fg: pink)
hi("@keyword",                    fg: purple,       styles: :italic)
hi("@keyword.return",             fg: magenta,      styles: :italic)
hi("@namespace",                  fg: dark_teal)
hi("@operator",                   fg: white)
hi("@parameter",                  fg: plain_fg)
hi("@property",                   fg: light_blue)
hi("@punctuation.bracket",        fg: dark_blue)
hi("@punctuation.delimiter",      fg: light_blue)
hi("@punctuation.special",        fg: light_purple)
hi("@label",                      fg: teal)
hi("@string",                     fg: light_green)
hi("@string.escape",              fg: lime)
hi("@string.regex",               fg: lime)
hi("@symbol",                     fg: teal)
hi("@variable",                   fg: plain_fg)
hi("@variable.builtin",           fg: plain_fg,     styles:  :italic)
hi("@field",                      fg: light_blue)

####################################
#               Text               #
####################################
hi("@text.title",                 styles: %i[bold italic])
hi("@text.todo",                  fg: blue,   bg: bg_light_blue, styles: %i[bold italic])
hi("@text.warning",               fg: orange, bg: bg_orange,     styles: %i[bold italic])
hi("@text.danger",                fg: red,    bg: bg_red,        styles: %i[bold italic])

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
hi("StartLogo1",                  fg: '#14067E')
hi("StartLogo2",                  fg: '#15127B')
hi("StartLogo3",                  fg: '#171F78')
hi("StartLogo4",                  fg: '#182B75')
hi("StartLogo5",                  fg: '#193872')
hi("StartLogo6",                  fg: '#1A446E')
hi("StartLogo7",                  fg: '#1C506B')
hi("StartLogo8",                  fg: '#1D5D68')
hi("StartLogo9",                  fg: '#1E6965')
hi("StartLogo10",                 fg: '#1F7562')
hi("StartLogo11",                 fg: '#21825F')
hi("StartLogo12",                 fg: '#228E5C')
hi("StartLogo13",                 fg: '#239B59')
hi("StartLogo14",                 fg: '#24A755')
hi("StartLogo15",                 fg: '#26B352')
hi("StartLogo16",                 fg: '#27C04F')
hi("StartLogo17",                 fg: '#28CC4C')
hi("StartLogo18",                 fg: '#29D343')
hi("StartLogoPop1",               fg: '#EC9F05')
hi("StartLogoPop2",               fg: '#F08C04')
hi("StartLogoPop3",               fg: '#F37E03')
hi("StartLogoPop4",               fg: '#F77002')
hi("StartLogoPop5",               fg: '#FB5D01')
hi("StartLogoPop6",               fg: '#FF4E00')

# Menus
hi("PMenu",                       fg: plain_fg,     bg: visual)
hi("PMenuSbar",                   fg: none,         bg: muted)
hi("PMenuSel",                    fg: plain_fg,     bg: dark_blue)
hi("PMenuThumb",                  fg: plain_bg,     bg: blue)

# Quick Find window
hi("qfFileName",                  fg: light_blue)
hi("qfLineNr",                    fg: yellow)

# Spelling and Search
hi("SpellBad",                    bg: bg_red,       styles: :undercurl, guisp: red)
hi("SpellCap",                    bg: bg_orange,    styles: :undercurl, guisp: orange)
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
hi("LspReferenceText",            fg: none,         bg: bg_light_blue,  styles: :bold)
hi("LspReferenceRead",            fg: blue,         bg: bg_light_blue,  styles: :bold)
hi("LspReferenceWrite",           fg: blue,         bg: bg_light_blue,  styles: :bold)

### LSPsaga
hi("SagaNormal",                                    bg: float_bg)
hi("SagaBorder",                  fg: dark_blue,    bg: float_bg)
hi("DiagnosticInfo",              fg: light_blue)
hi("DiagnostiError",              fg: red)
hi("DiagnosticWarn",              fg: orange)

# Indentation guidelines
hi("InentBlanklineChar",         fg: super_muted)
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
hi("TelescopeBorder",             fg: super_muted)
hi("TelescopeNormal",             fg: plain_fg,     bg: plain_bg)
hi("TelescopePreviewTitle",       fg: white,        bg: super_muted)
hi("TelescopeResultsTitle",       fg: white,        bg: super_muted)
hi("TelescopeSelection",          fg: white,        bg: visual)
hi("TelescopePromptBorder",       fg: dark_purple)
hi("TelescopePromptTitle",        fg: white,        bg: dark_purple)
hi("TelescopePromptNormal",       fg: white,        bg: plain_bg)
hi("TelescopePromptPrefix",       fg: lime)

# Packer
hi("packerStatus",                fg: purple)
hi("packerStatusCommit",          fg: yellow)
hi("packerStatusSuccess",         fg: green)
hi("packerStatusFail",            fg: red)
hi("packerPackageName",           fg: plain_fg)
hi("packerPackageNotLoaded",      fg: yellow)
hi("packerString",                fg: blue)
hi("packerBool",                  fg: blue)
hi("packerBreakingChange",        fg: red)
hi("packerWorking",               fg: blue)
hi("packerSuccess",               fg: green)
hi("packerFail",                  fg: red)
hi("packerHash",                  fg: yellow)
hi("packerRelDate",               fg: muted)
hi("packerProgress",              fg: purple)
hi("packerOutput",                fg: plain_fg)
hi("packerTimeTrivial",           fg: muted)
hi("packerTimeLow",               fg: plain_fg)
hi("packerTimeMedium",            fg: yellow)
hi("packerTimeHigh",              fg: orange)

# Gitsigns & Diffs
hi("GitGutterAdd",                fg: green,        bg: vertical_div)
hi("GitGutterAddLine",            fg: none,         bg: diff_add_bg)
hi("DiffAdd",                     fg: green,        bg: vertical_div)
hi("DiffAddLn",                   fg: none,         bg: diff_add_bg)
hi("GitGutterChange",             fg: yellow,       bg: vertical_div)

hi("GitGutterChangeLine",         fg: none,         bg: diff_moddel_bg)
hi("DiffChange",                  fg: yellow,       bg: vertical_div)
hi("DiffChangeLn",                fg: none,         bg: diff_moddel_bg)

hi("GitGutterDelete",             fg: red,          bg: vertical_div)
hi("GitGutterDeleteLine",         fg: none,         bg: diff_del_bg)
hi("DiffDelete",                  fg: red,          bg: vertical_div)
hi("DiffDeleteLn",                fg: none,         bg: diff_del_bg)

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
