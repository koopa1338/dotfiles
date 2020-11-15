local Color, c, Group, group, styles = require("colorbuddy").setup()

local themeColors = {
    "#090B3B",
    "#386188",
    "#4C7495",
    "#5F9CA7",
    "#73CDB5",
    "#90AEA6",
    "#99DEAF",
    "#c9ecdb",
    "#0f1266",
    "#3c7ebd",
    "#5498d0",
    "#6ad6ea",
    "#80fff4",
    "#a6f6e1",
    "#aeffda",
    "#eaffff",
  }
for i, color in ipairs(themeColors) do Color.new("wpg_" .. i - 1, color) end
Color.new("fg", "#eaffff")
Color.new("bg", "#0f1266")

-- Diff
Group.new("DiffAdd", c.none, c.wpg_10)
Group.new("DiffChange", c.none, c.wpg_12)
Group.new("DiffDelete", c.none, c.wpg_9)
Group.new("DiffText", c.none, c.wpg_3)

Group.new("Normal", c.fg:dark(), c.wpg_0)

-- Conceal
Group.new("Conceal", c.wpg_3:light(), c.none)

Group.new("VertSplit", c.wpg_0, c.none)

Group.new("Function", c.wpg_8, c.none, styles.bold)

Group.new("Error", c.wpg_9, c.none, styles.bold)
Group.new("ErrorMsg", c.wpg_1:dark(), c.wpg_1:dark(.75))

Group.new("WarningMsg", c.wpg_4:light(.3), c.wpg_12:dark(.3))
Group.new("Exception", c.wpg_9, c.none, styles.NONE)

Group.new("Boolean", c.wpg_2:dark(), c.none, styles.NONE)
Group.new("Character", c.wpg_14, c.none, styles.NONE)
Group.new("Comment", c.wpg_3:dark(), c.bg:light(.04), styles.NONE)
Group.new("Conditional", c.wpg_10, c.none, styles.NONE)
Group.new("Constant", c.wpg_4, c.none, styles.NONE)

Group.new("Underlined", c.none, c.none, styles.italic)

Group.new("Float", c.wpg_4, c.none, styles.NONE)

Group.new("NormalFloat", c.wpg_4, c.wpg_0:dark(.4))

-- Search
Group.new("IncSearch", c.wpg_10:light(), c.wpg_10:dark(.5), styles.italic)
Group.new("Search", c.wpg_10, c.wpg_10:dark(.8))

-- Numbers
Group.new("Number", c.wpg_15, c.none, styles.NONE)

Group.new("Define", c.wpg_10, c.none, styles.NONE)

Group.new("Delimiter", c.wpg_6, c.none, styles.NONE)

Group.new("Directory", c.wpg_4)

Group.new("Function", c.wpg_8)

-- Folds
Group.new("Folded", c.wpg_4:dark(.1))
Group.new("FoldColumn", c.wpg_4:light())

Group.new("Identifier", c.wpg_2, c.none, styles.NONE)
Group.new("Include", c.wpg_10, c.none, styles.NONE)

Group.new("Keyword", c.wpg_4, c.none, styles.italic)

Group.new("Label", c.wpg_10, c.none, styles.italic)

Group.new("Operator", c.wpg_12:dark(), c.none, styles.NONE)

Group.new("PreProc", c.wpg_10, c.none, styles.NONE)

Group.new("Repeat", c.wpg_12:dark(), c.none, styles.NONE)

Group.new("Statement", c.wpg_10, c.none, styles.NONE)
Group.new("StorageClass", c.wpg_10, c.none, styles.NONE)
Group.new("String", c.wpg_14, c.none, styles.NONE)
Group.new("Structure", c.wpg_10, c.none, styles.NONE)
Group.new("Tag", c.wpg_4, c.none, styles.NONE)

Group.new("Title", c.wpg_4, c.none)

Group.new("Todo", c.wpg_13, c.none, styles.NONE)

Group.new("Type", c.wpg_10:light(), c.none, styles.italic)
Group.new("Typedef", c.wpg_10, c.none, styles.NONE)

-- Side Column
Group.new("CursorColumn", c.wpg_1, c.none, styles.NONE)
Group.new("LineNr", c.wpg_10, c.none, styles.NONE)
Group.new("CursorLineNr", c.wpg_5, c.none, styles.NONE)
Group.new("Line", c.wpg_12, c.none, styles.bold)
Group.new("SignColumn", c.none, c.none, styles.NONE)

Group.new("ColorColumn", c.none, c.wpg_1)
Group.new("Cursor", c.wpg_0, c.wpg_4)
Group.new("CursorLine", c.none, c.wpg_0)
Group.new("iCursor", c.wpg_0, c.wpg_4)

Group.new("EndOfBuffer", c.wpg_3, c.none)

Group.new("MatchParen", c.none, c.wpg_13:dark())
Group.new("NonText", c.wpg_0:light(), c.none)

-- Popup Menu
Group.new("PMenu", c.wpg_2:light(), c.wpg_5:dark(.3))
Group.new("PmenuSbar", c.wpg_4, c.wpg_0:dark())
Group.new("PMenuSel", c.wpg_2:light(.2), c.wpg_0:dark(.7))
Group.new("PmenuThumb", c.wpg_8:light(), c.wpg_3)

-- Special
Group.new("Special", c.wpg_4, c.none, styles.NONE)
Group.new("SpecialChar", c.wpg_13, c.none, styles.NONE)
Group.new("SpecialKey", c.wpg_13)
Group.new("SpecialComment", c.wpg_8, c.none, styles.NONE)

-- Spell
Group.new("SpellBad", c.wpg_11, c.none)
Group.new("SpellCap", c.wpg_13, c.none)
Group.new("SpellLocal", c.wpg_5, c.none)
Group.new("SpellRare", c.wpg_6, c.none)

-- Statusline
Group.new("StatusLine", c.wpg_10, c.wpg_0:light(.2))
Group.new("StatusLineNC", c.wpg_4, c.wpg_0:light(.3))

-- Tabline
Group.new("TabLine", c.wpg_2, c.wpg_8:dark())
Group.new("TabLineSel", c.wpg_10:light(), c.wpg_13, styles.bold)
Group.new("TabLineFill", c.wpg_2, c.wpg_8:dark())

Group.new("Question", c.wpg_10, c.none, styles.bold)

-- Visual
Group.new("Visual", c.wpg_10, c.wpg_13:dark(.2))
Group.new("VisualNOS", c.wpg_2, c.wpg_1)

-- LSP
Group.new("LspDiagnosticsDefaultHint", c.wpg_13:light(), c.wpg_13:dark(.9))
Group.new("LspDiagnosticsDefaultError", c.wpg_1:dark(),
        c.wpg_1:dark(.7))
Group.new("LspDiagnosticsDefaultWarning", c.wpg_6, c.wpg_6:dark(.6))
Group.new("LspDiagnosticsDefaultInformation", c.fg)

-- Telescope
Group.new("TelescopeBorder", c.fg:dark(.3))
Group.new("TelescopeNormal", c.wpg_0:light(.3))
Group.new("TelescopePromptPrefix", c.wpg_10:dark(.2))

Group.new("TelescopeSelection", c.wpg_10:light(), c.wpg_0:light(.2), styles.bold)
Group.new("TelescopeMatching", c.wpg_4:light())

-- Treesitter
local error = {"TSError"}
local punctuation = {"TSPunctDelimiter", "TSPunctBracket", "TSPunchSpecial"}
local constants = {"TSConstant", "TsConstBuiltin", "TSConstMacro"}
local constructors = {"TSConstructor"}
local string = {"TSStringRegex", "TSString", "TSStringEscape"}
local boolean = {"TSBoolean"}
local functions = {"TSFunction", "TSFuncBuiltin", "TSFuncMacro"}
local methods = {"TSMethod"}
local fields = {"TSField", "TSProperty"}
local number = {"TSNumber", "TSFloat"}
local parameters = {"TSParameter", "TSParameterReference"}
local operators = {"TSOperator"}
local forwords = {"TSConditional", "TSRepeat"}
local keyword = {"TSKeyword", "TSKeywordOperator"}
local types = {"TSType", "TSTypeBuiltin"}
local labels = {"TSLabel"}
local namespaces = {"TSNamespace"}
local includes = {"TSInclude"}
local variables = {"TSVariable", "TSVariableBuiltin"}
local tags = {"TSTag", "TSTagDelimiter"}
local text = {"TSText", "TSStrong", "TSEmphasis", "TSUnderline", "TSTitle", "TSLiteral", "TSURI"}
local groups = {
  {error, c.wpg_1:light(), c.wpg_9:dark(.5)},
  {punctuation, c.wpg_3:dark(.35)},
  {constants, c.wpg_5:light()},
  {string, c.wpg_10:light():light()},
  {boolean, c.wpg_2:light()},
  {functions, c.wpg_14:light(.1)},
  {methods, c.wpg_14:light(.1)},
  {fields, c.wpg_8:light()},
  {number, c.wpg_6:light()},
  {parameters, c.wpg_6:dark()},
  {operators, c.wpg_3:dark():dark()},
  {forwords, c.wpg_8:light(), c.none},
  {keyword, c.wpg_4:dark(.2), c.none, styles.italic},
  {constructors, c.wpg_10},
  {types, c.wpg_10},
  {includes, c.wpg_4},
  {labels, c.wpg_4:light()},
  {namespaces, c.wpg_4},
  {variables, c.wpg_6},
  {tags, c.wpg_8},
  {text, c.fg},
}

-- Apply grouping to each color group
for _, group in ipairs(groups) do
  for _, color in ipairs(group[1]) do Group.new(color, group[2], group[3], group[4]) end
end

Group.new("TSPunctDelimiter", c.wpg_3:dark():dark())
Group.new("TSVariableBuiltin", c.wpg_6:dark(), c.none, styles.bold)

-- null
Group.new("TSConstBuiltin", c.wpg_6:dark(.3), c.none, styles.bold)

Group.new("TSTypeBuiltin", c.wpg_10:dark(.2), c.none, styles.bold)
Group.new("TSFuncBuiltin", c.wpg_8:light(.1), c.none, styles.bold)

-- Vim
Group.new("vimcommand", c.wpg_4)
Group.new("vimmap", c.wpg_4)
Group.new("vimbracket", c.wpg_10)
Group.new("vimmapmodkey", c.wpg_6)
Group.new("vimnotation", c.wpg_6)
Group.new("vimmaplhs", c.wpg_10)
Group.new("vimiscommand", c.wpg_10:light())
Group.new("vimFilter", c.wpg_7)
Group.new("vimMapRhs", c.wpg_15:dark(.1))
Group.new("vimMapRhsExtend", c.wpg_15:dark(.1))

Group.new("vimlet", c.wpg_4:dark())
Group.new("vimnotfunc", c.wpg_4:dark())
Group.new("vimAutoCmdSfxList", c.wpg_6)
Group.new("vimUserFunc", c.wpg_10)
Group.new("vimSetEqual", c.wpg_6)
