local lush = require('lush')

local function get_xresources_color(color_name)
   local command = io.popen('xrdb -query | grep ' .. color_name .. ' -m 1 | cut -f 2')
   local color = command:read("*l")
   return color
end

local xres = {
   fg      = get_xresources_color('foreground');
   bg      = get_xresources_color('background');
   color0  = get_xresources_color('color0');
   color1  = get_xresources_color('color1');
   color2  = get_xresources_color('color2');
   color3  = get_xresources_color('color3');
   color4  = get_xresources_color('color4');
   color5  = get_xresources_color('color5'),
   color6  = get_xresources_color('color6');
   color7  = get_xresources_color('color7');
   color8  = get_xresources_color('color8');
   color9  = get_xresources_color('color9');
   color10 = get_xresources_color('color10');
   color11 = get_xresources_color('color11');
   color12 = get_xresources_color('color12');
   color13 = get_xresources_color('color13');
   color14 = get_xresources_color('color14');
   color15 = get_xresources_color('color15');
   none    = 'NONE';
}

local walush = lush(function()
    return {

        -- General
        SpecialKey { fg = xres.color13, bg = xres.color0 },
        TermCursor { gui = 'reverse' },
        NonText { fg = xres.color12, bg = xres.bg },
        EndOfBuffer { NonText },
        Directory { fg = xres.color11, bg = xres.bg },
        ErrorMsg { fg = xres.color0, bg = xres.color9 },
        Search { fg = xres.color0, bg = xres.color12 },
        MoreMsg { fg = xres.color15, bg = xres.bg },
        ModeMsg { fg = xres.none, bg = xres.none, gui = 'bold' },
        LineNr { fg = xres.color7, bg = xres.color0 },
        LineNrAbove { LineNr },
        LineNrBelow { LineNr },
        CursorLineNr { fg = xres.color15, bg = xres.color6, gui = 'bold' },
        Type { fg = xres.color13, bg = xres.bg, gui = 'bold' },
        Question { Type },
        StatusLine { fg = xres.color15, bg = xres.color14, gui = 'reverse, bold' },
        StatusLineNC { fg = xres.color15, bg = xres.color8, gui = 'reverse' },
        Comment { fg = xres.color4, bg = xres.color0 },
        SignColumn { fg = xres.color12, bg = xres.color8 },
        VertSplit { fg = xres.color0, bg = xres.color8, gui = 'reverse' },
        Title { fg = xres.fg, bg = xres.bg },
        WildMenu { fg = xres.color0, bg = xres.color11 },
        Keyword { fg = xres.color13 },
        Pmenu { fg = xres.color15, bg = xres.color8 },
        PmenuSel { fg = xres.color0, bg = xres.color14 },
        PmenuSbar { fg = xres.fg },
        PmenuThumb { fg = xres.fg, bg = xres.color15 },
        QuickFixLine {Search},
        Substitute {Search},
        Whitespace {NonText},
        MsgSeparator {StatusLine},
        NormalFloat {Pmenu},
        Label {Type},
        Operator {Type},
        StorageClass {Type},
        Structure {Type},
        NvimNumberPrefix {Type},
        NvimOptionSigil {Type},
        Normal { fg = xres.color15, bg = xres.color0 },
        NvimTreePopup {Normal},
        NvimTreeNormal {Normal},
        DapUIFrameName {Normal},
        DapUIValue {Normal},
        DapUIVariable {Normal},
        NvimSpacing {Normal},
        Delimiter { fg = xres.color15, bg = xres.color8 },
        NvimParenthesis {Delimiter},
        NvimColon {Delimiter},
        NvimComma {Delimiter},
        NvimArrow {Delimiter},
        Constant { fg = xres.color11, bg = xres.bg },
        String {Constant},
        Character {Constant},
        DiagnosticWarning {Constant},
        Visual { fg = xres.color0, bg = xres.color14 },
        Function { fg = xres.color15, bg = xres.bg },
        Special { fg = xres.color9 },
        Tag {Special},
        Debug {Special},
        PreProc { fg = xres.color10 },
        Include {PreProc},
        Define {PreProc},
        Macro {PreProc},
        PreCondit {PreProc},
        Conditional { fg = xres.color11 },
        Repeat {Conditional},
        Statement { fg = xres.color10, gui = 'bold' },
        Method {},
        Boolean {Statement},
        FloatBorder {VertSplit},
        SpecialChar { fg = xres.color12, bg = xres.color8 },
        SpecialComment { fg = xres.color11, bg = xres.color8 },
        FoldColumn { fg = xres.color14, bg = xres.color15 }, --    ctermfg=14 ctermbg=242 guifg=Cyan guibg=Grey
        Folded { FoldColumn },
        WarningMsg { fg = xres.color10 }, -- WarningMsg     ctermfg=10 guifg=Red
        DiffAdd { fg = xres.color0, bg = xres.color4 }, -- DiffAdd        ctermfg=0 ctermbg=4 guibg=DarkBlue
        DiffChange { fg = xres.color0, bg = xres.color5 }, -- DiffChange     ctermfg=0 ctermbg=5 guibg=DarkMagenta
        DiffDelete { fg = xres.color0, bg = xres.color6 }, -- DiffDelete     ctermfg=0 ctermbg=6 gui=bold guifg=Blue guibg=DarkCyan
        DiffText { fg = xres.color0, bg = xres.color9, gui = 'bold' }, -- DiffText       cterm=bold ctermfg=0 ctermbg=9 gui=bold guibg=Red
        Conceal { fg = xres.color7 }, -- Conceal        ctermfg=7 ctermbg=242 guifg=LightGrey guibg=DarkGrey
        SpellBad { fg = xres.color8, bg = xres.color9 }, -- SpellBad       ctermfg=8 ctermbg=9 gui=undercurl guisp=Red
        SpellCap { bg = xres.color12, gui = 'undercurl' }, -- SpellCap       ctermbg=12 gui=undercurl guisp=Blue
        SpellRare { bg = xres.color13, gui = 'undercurl' }, -- SpellRare      ctermbg=13 gui=undercurl guisp=Magenta
        SpellLocal { bg = xres.color14, gui = 'undercurl' }, -- SpellLocal     ctermbg=14 gui=undercurl guisp=Cyan
        TabLine { fg = xres.color15, bg = xres.color8, gui = 'underline' }, -- TabLine        ctermfg=15 ctermbg=8 gui=underline guibg=DarkGrey
        TabLineSel { fg = xres.color0, bg = xres.color14, gui = 'bold' }, -- TabLineSel     ctermfg=0 ctermbg=14 gui=bold
        TabLineFill { fg =xres.color15, bg = xres.color8, gui = 'reverse' }, -- TabLineFill    ctermfg=15 ctermbg=8 gui=reverse
        CursorColumn {}, -- CursorColumn   ctermbg=242 guibg=Grey40
        CursorLine { bg = xres.color0 }, -- CursorLine     ctermbg=0 guibg=Grey40
        ColorColumn { bg = xres.color1 }, -- ColorColumn    ctermbg=1 guibg=DarkRed
        NormalNC {}, -- NormalNC       cleared
        MsgArea {}, -- MsgArea        cleared
        RedrawDebugNormal { gui = 'reverse' }, -- RedrawDebugNormal xxx cterm=reverse gui=reverse
        RedrawDebugClear { bg = xres.color11 }, -- RedrawDebugClear xxx ctermbg=11 guibg=Yellow
        RedrawDebugComposed { bg = xres.color10 }, -- RedrawDebugComposed xxx ctermbg=10 guibg=Green
        RedrawDebugRecompose { bg = xres.color9 }, -- RedrawDebugRecompose xxx ctermbg=9 guibg=Red
        Cursor { fg = xres.bg, bg = xres.fg }, -- Cursor         xxx guifg=bg guibg=fg
        lCursor { fg = xres.bg, bg = xres.fg }, -- lCursor        xxx guifg=bg guibg=fg
        -- FloatShadow {}, -- FloatShadow    xxx guibg=Black blend=80
        -- FloatShadowThrough {}, -- FloatShadowThrough xxx guibg=Black blend=100
        Error { fg = xres.color0, bg = xres.color1 }, -- Error          xxx ctermfg=0 ctermbg=1 guifg=White guibg=Red
        Todo { fg = xres.color14, bg = xres.color8 }, -- Todo           xxx ctermfg=15 ctermbg=8 guifg=Blue guibg=Yellow
        Number { fg = xres.color12 }, -- Number         xxx ctermfg=12
        Float { fg = xres.color14 }, -- Float          xxx ctermfg=14 guifg=#88AAEE
        Identifier { fg = xres.color12 }, -- Identifier     xxx ctermfg=12 guifg=#40ffff
        Exception { fg = xres.color10, bg = xres.color0 }, -- Exception      xxx ctermfg=10 ctermbg=0 guifg=Red guibg=White
        Typedef { fg = xres.color10, bg = xres.color8 }, -- Typedef        xxx ctermfg=10 ctermbg=8 gui=italic guifg=White guibg=Blue
        MatchParen { fg = xres.color12, bg = xres.color8 }, -- MatchParen     xxx ctermfg=12 ctermbg=8 guibg=DarkCyan
        Underlined { fg = xres.color12, gui = 'underline' }, -- Underlined     xxx cterm=underline ctermfg=12 gui=underline guifg=#80a0ff
        Ignore { fg = xres.color0 }, -- Ignore         xxx ctermfg=0 guifg=bg
        User1 { fg = xres.color15, bg = xres.color6 }, -- User1          xxx ctermfg=15 ctermbg=6
        User2 { fg = xres.color15, bg = xres.color8 }, -- User2          xxx ctermfg=15 ctermbg=8
        StatusLineTerm { fg = xres.color0 }, -- StatusLineTerm xxx ctermfg=0
        StatusLineTermNC { fg = xres.color15, bg = xres.color8 }, -- StatusLineTermNC xxx ctermfg=15 ctermbg=8
        YCMWarningSection { fg = xres.color0, bg = xres.color4 }, -- YCMWarningSection xxx ctermfg=0 ctermbg=4
        debugPC {}, -- debugPC {}, -- debugPC        xxx cleared

        -- Nvim groups
        NvimString {String},
        NvimStringBody {NvimString},
        NvimStringQuote {NvimString},
        NvimStringSpecial {SpecialChar},
        NvimSingleQuote {NvimStringQuote},
        NvimSingleQuotedBody {NvimStringBody},
        NvimSingleQuotedQuote {NvimStringSpecial},
        NvimDoubleQuote {NvimStringQuote},
        NvimDoubleQuotedBody {NvimStringBody},
        NvimDoubleQuotedEscape {NvimStringSpecial},
        NvimInternalError { fg = xres.color9, bg = xres.color9 }, -- NvimInternalError xxx ctermfg=9 ctermbg=9 guifg=Red guibg=Red
        NvimAssignment { Operator }, -- NvimAssignment xxx links to Operator
        NvimPlainAssignment { NvimAssignment }, -- NvimPlainAssignment xxx links to NvimAssignment
        NvimAugmentedAssignment { NvimAssignment }, -- NvimAugmentedAssignment xxx links to NvimAssignment
        NvimAssignmentWithAddition { NvimAugmentedAssignment }, -- NvimAssignmentWithAddition xxx links to NvimAugmentedAssignment
        NvimAssignmentWithSubtraction { NvimAugmentedAssignment }, -- NvimAssignmentWithSubtraction xxx links to NvimAugmentedAssignment
        NvimAssignmentWithConcatenation { NvimAugmentedAssignment }, -- NvimAssignmentWithConcatenation xxx links to NvimAugmentedAssignment
        NvimOperator { Operator }, -- NvimOperator   xxx links to Operator
        NvimUnaryOperator { NvimOperator }, -- NvimUnaryOperator xxx links to NvimOperator
        NvimUnaryPlus { NvimUnaryOperator }, -- NvimUnaryPlus  xxx links to NvimUnaryOperator
        NvimUnaryMinus { NvimUnaryOperator }, -- NvimUnaryMinus xxx links to NvimUnaryOperator
        NvimNot { NvimUnaryOperator }, -- NvimNot        xxx links to NvimUnaryOperator
        NvimBinaryOperator { NvimOperator }, -- NvimBinaryOperator xxx links to NvimOperator
        NvimComparison { NvimBinaryOperator }, -- NvimComparison xxx links to NvimBinaryOperator
        NvimComparisonModifier { NvimComparison }, -- NvimComparisonModifier xxx links to NvimComparison
        NvimBinaryPlus { NvimBinaryOperator }, -- NvimBinaryPlus xxx links to NvimBinaryOperator
        NvimBinaryMinus { NvimBinaryOperator }, -- NvimBinaryMinus xxx links to NvimBinaryOperator
        NvimConcat { NvimBinaryOperator }, -- NvimConcat     xxx links to NvimBinaryOperator
        NvimConcatOrSubscript { NvimConcat }, -- NvimConcatOrSubscript xxx links to NvimConcat
        NvimOr { NvimBinaryOperator }, -- NvimOr         xxx links to NvimBinaryOperator
        NvimAnd { NvimBinaryOperator }, -- NvimAnd        xxx links to NvimBinaryOperator
        NvimMultiplication { NvimBinaryOperator }, -- NvimMultiplication xxx links to NvimBinaryOperator
        NvimDivision { NvimBinaryOperator }, -- NvimDivision   xxx links to NvimBinaryOperator
        NvimMod { NvimBinaryOperator }, -- NvimMod        xxx links to NvimBinaryOperator
        NvimTernary { NvimOperator }, -- NvimTernary    xxx links to NvimOperator
        NvimTernaryColon { NvimTernary }, -- NvimTernaryColon xxx links to NvimTernary
        NvimLambda { NvimParenthesis }, -- NvimLambda     xxx links to NvimParenthesis
        NvimNestingParenthesis { NvimParenthesis }, -- NvimNestingParenthesis xxx links to NvimParenthesis
        NvimCallingParenthesis { NvimParenthesis }, -- NvimCallingParenthesis xxx links to NvimParenthesis
        NvimSubscript { NvimParenthesis }, -- NvimSubscript  xxx links to NvimParenthesis
        NvimSubscriptBracket { NvimSubscript }, -- NvimSubscriptBracket xxx links to NvimSubscript
        NvimSubscriptColon { NvimSubscript }, -- NvimSubscriptColon xxx links to NvimSubscript
        NvimCurly { NvimString }, -- NvimCurly      xxx links to NvimSubscript
        NvimContainer { NvimParenthesis }, -- NvimContainer  xxx links to NvimParenthesis
        NvimDict { NvimContainer }, -- NvimDict       xxx links to NvimContainer
        NvimList { NvimContainer }, -- NvimList       xxx links to NvimContainer
        NvimIdentifier { Identifier }, -- NvimIdentifier xxx links to Identifier
        NvimIdentifierScope { NvimIdentifier }, -- NvimIdentifierScope xxx links to NvimIdentifier
        NvimIdentifierScopeDelimiter { NvimIdentifier }, -- NvimIdentifierScopeDelimiter xxx links to NvimIdentifier
        NvimIdentifierName { NvimIdentifier }, -- NvimIdentifierName xxx links to NvimIdentifier
        NvimIdentifierKey { NvimIdentifier }, -- NvimIdentifierKey xxx links to NvimIdentifier
        NvimRegister { SpecialChar }, -- NvimRegister   xxx links to SpecialChar
        NvimNumber { Number }, -- NvimNumber     xxx links to Number
        NvimFloat { NvimNumber }, -- NvimFloat      xxx links to NvimNumber
        NvimOptionName { NvimIdentifier }, -- NvimOptionName xxx links to NvimIdentifier
        NvimOptionScope { NvimIdentifierScope }, -- NvimOptionScope xxx links to NvimIdentifierScope
        NvimOptionScopeDelimiter { NvimIdentifierScopeDelimiter }, -- NvimOptionScopeDelimiter xxx links to NvimIdentifierScopeDelimiter
        NvimEnvironmentSigil { NvimOptionSigil }, -- NvimEnvironmentSigil xxx links to NvimOptionSigil
        NvimEnvironmentName { NvimIdentifier }, -- NvimEnvironmentName xxx links to NvimIdentifier
        NvimFigureBrace { NvimInternalError }, -- NvimFigureBrace xxx links to NvimInternalError
        NvimSingleQuotedUnknownEscape { NvimInternalError }, -- NvimSingleQuotedUnknownEscape xxx links to NvimInternalError
        NvimInvalidSingleQuotedUnknownEscape { NvimInternalError }, -- NvimInvalidSingleQuotedUnknownEscape xxx links to NvimInternalError
        NvimInvalid { Error }, -- NvimInvalid    xxx links to Error
        NvimInvalidAssignment { NvimInvalid }, -- NvimInvalidAssignment xxx links to NvimInvalid
        NvimInvalidPlainAssignment { NvimInvalidAssignment }, -- NvimInvalidPlainAssignment xxx links to NvimInvalidAssignment
        NvimInvalidAugmentedAssignment { NvimInvalidAssignment }, -- NvimInvalidAugmentedAssignment xxx links to NvimInvalidAssignment
        NvimInvalidAssignmentWithAddition { NvimInvalidAugmentedAssignment }, -- NvimInvalidAssignmentWithAddition xxx links to NvimInvalidAugmentedAssignment
        NvimInvalidAssignmentWithSubtraction { NvimInvalidAugmentedAssignment }, -- NvimInvalidAssignmentWithSubtraction xxx links to NvimInvalidAugmentedAssignment
        NvimInvalidAssignmentWithConcatenation { NvimInvalidAugmentedAssignment }, -- NvimInvalidAssignmentWithConcatenation xxx links to NvimInvalidAugmentedAssignment
        NvimInvalidOperator { NvimInvalid }, -- NvimInvalidOperator xxx links to NvimInvalid
        NvimInvalidUnaryOperator { NvimInvalidOperator }, -- NvimInvalidUnaryOperator xxx links to NvimInvalidOperator
        NvimInvalidUnaryPlus { NvimInvalidUnaryOperator }, -- NvimInvalidUnaryPlus xxx links to NvimInvalidUnaryOperator
        NvimInvalidUnaryMinus { NvimInvalidUnaryOperator }, -- NvimInvalidUnaryMinus xxx links to NvimInvalidUnaryOperator
        NvimInvalidNot { NvimInvalidUnaryOperator }, -- NvimInvalidNot xxx links to NvimInvalidUnaryOperator
        NvimInvalidBinaryOperator { NvimInvalidOperator }, -- NvimInvalidBinaryOperator xxx links to NvimInvalidOperator
        NvimInvalidComparison { NvimInvalidBinaryOperator }, -- NvimInvalidComparison xxx links to NvimInvalidBinaryOperator
        NvimInvalidComparisonModifier { NvimInvalidComparison }, -- NvimInvalidComparisonModifier xxx links to NvimInvalidComparison
        NvimInvalidBinaryPlus { NvimInvalidBinaryOperator }, -- NvimInvalidBinaryPlus xxx links to NvimInvalidBinaryOperator
        NvimInvalidBinaryMinus { NvimInvalidBinaryOperator }, -- NvimInvalidBinaryMinus xxx links to NvimInvalidBinaryOperator
        NvimInvalidConcat { NvimInvalidBinaryOperator }, -- NvimInvalidConcat xxx links to NvimInvalidBinaryOperator
        NvimInvalidConcatOrSubscript { NvimInvalidConcat }, -- NvimInvalidConcatOrSubscript xxx links to NvimInvalidConcat
        NvimInvalidOr { NvimInvalidBinaryOperator }, -- NvimInvalidOr  xxx links to NvimInvalidBinaryOperator
        NvimInvalidAnd { NvimInvalidBinaryOperator }, -- NvimInvalidAnd xxx links to NvimInvalidBinaryOperator
        NvimInvalidMultiplication { NvimInvalidBinaryOperator }, -- NvimInvalidMultiplication xxx links to NvimInvalidBinaryOperator
        NvimInvalidDivision { NvimInvalidBinaryOperator }, -- NvimInvalidDivision xxx links to NvimInvalidBinaryOperator
        NvimInvalidMod { NvimInvalidBinaryOperator }, -- NvimInvalidMod xxx links to NvimInvalidBinaryOperator
        NvimInvalidTernary { NvimInvalidOperator }, -- NvimInvalidTernary xxx links to NvimInvalidOperator
        NvimInvalidTernaryColon { NvimInvalidTernary }, -- NvimInvalidTernaryColon xxx links to NvimInvalidTernary
        NvimInvalidDelimiter { NvimInvalid }, -- NvimInvalidDelimiter xxx links to NvimInvalid
        NvimInvalidParenthesis { NvimInvalidDelimiter }, -- NvimInvalidParenthesis xxx links to NvimInvalidDelimiter
        NvimInvalidLambda { NvimInvalidParenthesis }, -- NvimInvalidLambda xxx links to NvimInvalidParenthesis
        NvimInvalidNestingParenthesis { NvimInvalidParenthesis }, -- NvimInvalidNestingParenthesis xxx links to NvimInvalidParenthesis
        NvimInvalidCallingParenthesis { NvimInvalidParenthesis }, -- NvimInvalidCallingParenthesis xxx links to NvimInvalidParenthesis
        NvimInvalidSubscript { NvimInvalidParenthesis }, -- NvimInvalidSubscript xxx links to NvimInvalidParenthesis
        NvimInvalidSubscriptBracket { NvimInvalidSubscript }, -- NvimInvalidSubscriptBracket xxx links to NvimInvalidSubscript
        NvimInvalidSubscriptColon { NvimInvalidSubscript }, -- NvimInvalidSubscriptColon xxx links to NvimInvalidSubscript
        NvimInvalidCurly { NvimInvalidSubscript }, -- NvimInvalidCurly xxx links to NvimInvalidSubscript
        NvimInvalidContainer { NvimInvalidParenthesis }, -- NvimInvalidContainer xxx links to NvimInvalidParenthesis
        NvimInvalidDict { NvimInvalidContainer }, -- NvimInvalidDict xxx links to NvimInvalidContainer
        NvimInvalidList { NvimInvalidContainer }, -- NvimInvalidList xxx links to NvimInvalidContainer
        NvimInvalidValue { NvimInvalid }, -- NvimInvalidValue xxx links to NvimInvalid
        NvimInvalidIdentifier { NvimInvalidValue }, -- NvimInvalidIdentifier xxx links to NvimInvalidValue
        NvimInvalidIdentifierScope { NvimInvalidIdentifier }, -- NvimInvalidIdentifierScope xxx links to NvimInvalidIdentifier
        NvimInvalidIdentifierScopeDelimiter { NvimInvalidIdentifier }, -- NvimInvalidIdentifierScopeDelimiter xxx links to NvimInvalidIdentifier
        NvimInvalidIdentifierName { NvimInvalidIdentifier }, -- NvimInvalidIdentifierName xxx links to NvimInvalidIdentifier
        NvimInvalidIdentifierKey { NvimInvalidIdentifier }, -- NvimInvalidIdentifierKey xxx links to NvimInvalidIdentifier
        NvimInvalidColon { NvimInvalidDelimiter }, -- NvimInvalidColon xxx links to NvimInvalidDelimiter
        NvimInvalidComma { NvimInvalidDelimiter }, -- NvimInvalidComma xxx links to NvimInvalidDelimiter
        NvimInvalidArrow { NvimInvalidDelimiter }, -- NvimInvalidArrow xxx links to NvimInvalidDelimiter
        NvimInvalidRegister { NvimInvalidValue }, -- NvimInvalidRegister xxx links to NvimInvalidValue
        NvimInvalidNumber { NvimInvalidValue }, -- NvimInvalidNumber xxx links to NvimInvalidValue
        NvimInvalidFloat { NvimInvalidNumber }, -- NvimInvalidFloat xxx links to NvimInvalidNumber
        NvimInvalidNumberPrefix { NvimInvalidNumber }, -- NvimInvalidNumberPrefix xxx links to NvimInvalidNumber
        NvimInvalidOptionSigil { NvimInvalidIdentifier }, -- NvimInvalidOptionSigil xxx links to NvimInvalidIdentifier
        NvimInvalidOptionName { NvimInvalidIdentifier }, -- NvimInvalidOptionName xxx links to NvimInvalidIdentifier
        NvimInvalidOptionScope { NvimInvalidIdentifierScope }, -- NvimInvalidOptionScope xxx links to NvimInvalidIdentifierScope
        NvimInvalidOptionScopeDelimiter { NvimInvalidIdentifierScopeDelimiter }, -- NvimInvalidOptionScopeDelimiter xxx links to NvimInvalidIdentifierScopeDelimiter
        NvimInvalidEnvironmentSigil { NvimInvalidOptionSigil }, -- NvimInvalidEnvironmentSigil xxx links to NvimInvalidOptionSigil
        NvimInvalidEnvironmentName { NvimInvalidIdentifier }, -- NvimInvalidEnvironmentName xxx links to NvimInvalidIdentifier
        NvimInvalidString { NvimInvalidValue }, -- NvimInvalidString xxx links to NvimInvalidValue
        NvimInvalidStringBody { NvimStringBody }, -- NvimInvalidStringBody xxx links to NvimStringBody
        NvimInvalidStringQuote { NvimInvalidString }, -- NvimInvalidStringQuote xxx links to NvimInvalidString
        NvimInvalidStringSpecial { NvimStringSpecial }, -- NvimInvalidStringSpecial xxx links to NvimStringSpecial
        NvimInvalidSingleQuote { NvimInvalidStringQuote }, -- NvimInvalidSingleQuote xxx links to NvimInvalidStringQuote
        NvimInvalidSingleQuotedBody { NvimInvalidStringBody }, -- NvimInvalidSingleQuotedBody xxx links to NvimInvalidStringBody
        NvimInvalidSingleQuotedQuote { NvimInvalidStringSpecial }, -- NvimInvalidSingleQuotedQuote xxx links to NvimInvalidStringSpecial
        NvimInvalidDoubleQuote { NvimInvalidStringQuote }, -- NvimInvalidDoubleQuote xxx links to NvimInvalidStringQuote
        NvimInvalidDoubleQuotedBody { NvimInvalidStringBody }, -- NvimInvalidDoubleQuotedBody xxx links to NvimInvalidStringBody
        NvimInvalidDoubleQuotedEscape { NvimInvalidStringSpecial }, -- NvimInvalidDoubleQuotedEscape xxx links to NvimInvalidStringSpecial
        NvimInvalidDoubleQuotedUnknownEscape { NvimInvalidValue }, -- NvimInvalidDoubleQuotedUnknownEscape xxx links to NvimInvalidValue
        NvimInvalidFigureBrace { NvimInvalidDelimiter }, -- NvimInvalidFigureBrace xxx links to NvimInvalidDelimiter
        NvimInvalidSpacing { ErrorMsg }, -- NvimInvalidSpacing xxx links to ErrorMsg
        NvimDoubleQuotedUnknownEscape { NvimInvalidValue }, -- NvimDoubleQuotedUnknownEscape xxx links to NvimInvalidValue

        -- Diagnostics
        DiagnosticError { fg = xres.color1 }, -- DiagnosticError xxx ctermfg=1 guifg=Red
        DiagnosticWarn { fg = xres.color3 }, -- DiagnosticWarn xxx ctermfg=3 guifg=Orange
        DiagnosticInfo { fg = xres.color4 }, -- DiagnosticInfo xxx ctermfg=4 guifg=LightBlue
        DiagnosticHint { fg = xres.color7 }, -- DiagnosticHint xxx ctermfg=7 guifg=LightGrey
        DiagnosticUnderlineError { gui = 'underline' }, -- DiagnosticUnderlineError xxx cterm=underline gui=underline guisp=Red
        DiagnosticUnderlineWarn { gui = 'underline' }, -- DiagnosticUnderlineWarn xxx cterm=underline gui=underline guisp=Orange
        DiagnosticUnderlineInfo { gui = 'underline' }, -- DiagnosticUnderlineInfo xxx cterm=underline gui=underline guisp=LightBlue
        DiagnosticUnderlineHint { gui = 'underline' }, -- DiagnosticUnderlineHint xxx cterm=underline gui=underline guisp=LightGrey
        DiagnosticVirtualTextError { DiagnosticError }, -- DiagnosticVirtualTextError xxx links to DiagnosticError
        DiagnosticVirtualTextWarn { DiagnosticWarn }, -- DiagnosticVirtualTextWarn xxx links to DiagnosticWarn
        DiagnosticVirtualTextInfo { DiagnosticInfo }, -- DiagnosticVirtualTextInfo xxx links to DiagnosticInfo
        DiagnosticVirtualTextHint { DiagnosticHint }, -- DiagnosticVirtualTextHint xxx links to DiagnosticHint
        DiagnosticFloatingError { DiagnosticError }, -- DiagnosticFloatingError xxx links to DiagnosticError
        DiagnosticFloatingWarn { DiagnosticWarn }, -- DiagnosticFloatingWarn xxx links to DiagnosticWarn
        DiagnosticFloatingInfo { DiagnosticInfo }, -- DiagnosticFloatingInfo xxx links to DiagnosticInfo
        DiagnosticFloatingHint { DiagnosticHint }, -- DiagnosticFloatingHint xxx links to DiagnosticHint
        DiagnosticSignError { DiagnosticError }, -- DiagnosticSignError xxx links to DiagnosticError
        DiagnosticSignWarn { DiagnosticWarn }, -- DiagnosticSignWarn xxx links to DiagnosticWarn
        DiagnosticSignInfo { DiagnosticInfo }, -- DiagnosticSignInfo xxx links to DiagnosticInfo
        DiagnosticSignHint { DiagnosticHint }, -- DiagnosticSignHint xxx links to DiagnosticHint

        ElCommand { Constant }, -- ElCommand      xxx links to Constant
        ElCommandCV { StatusLine }, -- ElCommandCV    xxx links to StatusLine
        ElCommandEx { StatusLine }, -- ElCommandEx    xxx links to StatusLine
        ElConfirm { StatusLine }, -- ElConfirm      xxx links to StatusLine
        ElInsertCompletion { StatusLine }, -- ElInsertCompletion xxx links to StatusLine
        ElInsert { MsgSeparator }, -- ElInsert       xxx links to MsgSeparator
        ElMore { StatusLine }, -- ElMore         xxx links to StatusLine
        ElNormal { Function }, -- ElNormal       xxx links to Function
        ElNormalOperatorPending { StatusLine }, -- ElNormalOperatorPending xxx links to StatusLine
        ElPrompt { StatusLine }, -- ElPrompt       xxx links to StatusLine
        ElReplace { StatusLine }, -- ElReplace      xxx links to StatusLine
        ElSBlock { StatusLine }, -- ElSBlock       xxx links to StatusLine
        ElSelect { StatusLine }, -- ElSelect       xxx links to StatusLine
        ElShell { StatusLine }, -- ElShell        xxx links to StatusLine
        ElSLine { StatusLine }, -- ElSLine        xxx links to StatusLine
        ElTerm { StatusLine }, -- ElTerm         xxx links to StatusLine
        ElVirtualReplace { StatusLine }, -- ElVirtualReplace xxx links to StatusLine
        ElVisualBlock { StatusLine }, -- ElVisualBlock  xxx links to StatusLine
        ElVisualLine { StatusLine }, -- ElVisualLine   xxx links to StatusLine
        ElVisual { StatusLine }, -- ElVisual       xxx links to StatusLine
        ElCommandInactive { ElCommand }, -- ElCommandInactive xxx links to ElCommand
        ElCommandCVInactive { ElCommandCV }, -- ElCommandCVInactive xxx links to ElCommandCV
        ElCommandExInactive { ElCommandEx }, -- ElCommandExInactive xxx links to ElCommandEx
        ElConfirmInactive { ElConfirm }, -- ElConfirmInactive xxx links to ElConfirm
        ElInsertCompletionInactive { ElInsertCompletion }, -- ElInsertCompletionInactive xxx links to ElInsertCompletion
        ElInsertInactive { ElInsert }, -- ElInsertInactive xxx links to ElInsert
        ElMoreInactive { ElMore }, -- ElMoreInactive xxx links to ElMore
        ElNormalInactive { ElNormal }, -- ElNormalInactive xxx links to ElNormal
        ElNormalOperatorPendingInactive { ElNormalOperatorPending }, -- ElNormalOperatorPendingInactive xxx links to ElNormalOperatorPending
        ElPromptInactive { ElPrompt }, -- ElPromptInactive xxx links to ElPrompt
        ElReplaceInactive { ElReplace }, -- ElReplaceInactive xxx links to ElReplace
        ElSBlockInactive { ElSBlock }, -- ElSBlockInactive xxx links to ElSBlock
        ElSelectInactive { ElSelect }, -- ElSelectInactive xxx links to ElSelect
        ElShellInactive { ElShell }, -- ElShellInactive xxx links to ElShell
        ElSLineInactive { ElSLine }, -- ElSLineInactive xxx links to ElSLine
        ElTermInactive { ElTerm }, -- ElTermInactive xxx links to ElTerm
        ElVirtualReplaceInactive { ElVirtualReplace }, -- ElVirtualReplaceInactive xxx links to ElVirtualReplace
        ElVisualBlockInactive { ElVisualBlock }, -- ElVisualBlockInactive xxx links to ElVisualBlock
        ElVisualLineInactive { ElVisualLine }, -- ElVisualLineInactive xxx links to ElVisualLine
        ElVisualInactive { ElVisual }, -- ElVisualInactive xxx links to ElVisual

        -- Dap UI
        -- DapUIScope     xxx guifg=#00F1F5
        -- DapUIType      xxx guifg=#D484FF
        -- DapUIModifiedValue xxx gui=bold guifg=#00F1F5
        -- DapUIDecoration xxx guifg=#00F1F5
        -- DapUIThread    xxx guifg=#A9FF68
        -- DapUIStoppedThread xxx guifg=#00f1f5
        -- DapUISource    xxx guifg=#D484FF
        -- DapUILineNumber xxx guifg=#00f1f5
        -- DapUIFloatBorder xxx guifg=#00F1F5
        -- DapUIWatchesEmpty xxx guifg=#F70067
        -- DapUIWatchesValue xxx guifg=#A9FF68
        -- DapUIWatchesError xxx guifg=#F70067
        -- DapUIBreakpointsPath xxx guifg=#00F1F5
        -- DapUIBreakpointsInfo xxx guifg=#A9FF68
        -- DapUIBreakpointsCurrentLine xxx gui=bold guifg=#A9FF68
        -- DapUIBreakpointsLine xxx links to DapUILineNumber

        -- Devicons
        -- DevIconDiff    xxx guifg=#41535b
        -- DevIconElm     xxx guifg=#519aba
        -- DevIconJl      xxx guifg=#a270ba
        -- DevIconSass    xxx guifg=#f55385
        -- DevIconXcPlayground xxx guifg=#e37933
        -- DevIconSln     xxx guifg=#854CC7
        -- DevIconR       xxx guifg=#358a5b
        -- DevIconZshrc   xxx guifg=#89e051
        -- DevIconTex     xxx guifg=#3D6117
        -- DevIconTor     xxx guifg=#519aba
        -- DevIconJsx     xxx guifg=#519aba
        -- DevIconJson    xxx guifg=#cbcb41
        -- DevIconPl      xxx guifg=#519aba
        -- DevIconMl      xxx guifg=#e37933
        -- DevIconMarkdown xxx guifg=#519aba
        -- DevIconCp      xxx guifg=#519aba
        -- DevIconRmd     xxx guifg=#519aba
        -- DevIconZsh     xxx guifg=#89e051
        -- DevIconCrystal xxx guifg=#000000
        -- DevIconIni     xxx guifg=#6d8086
        -- DevIconPyc     xxx guifg=#519aba
        -- DevIconCpp     xxx guifg=#519aba
        -- DevIconGitConfig xxx guifg=#41535b
        -- DevIconProcfile xxx guifg=#a074c4
        -- DevIconDesktopEntry xxx guifg=#563d7c
        -- DevIconFsscript xxx guifg=#519aba
        -- DevIconClojure xxx guifg=#8dc149
        -- DevIconBashrc  xxx guifg=#89e051
        -- DevIconErb     xxx guifg=#701516
        -- DevIconEx      xxx guifg=#a074c4
        -- DevIconMli     xxx guifg=#e37933
        -- DevIconSvelte  xxx guifg=#ff3e00
        -- DevIconC       xxx guifg=#599eff
        -- DevIconEjs     xxx guifg=#cbcb41
        -- DevIconJava    xxx guifg=#cc3e44
        -- DevIconEdn     xxx guifg=#519aba
        -- DevIconGruntfile xxx guifg=#e37933
        -- DevIconSvg     xxx guifg=#FFB13B
        -- DevIconXul     xxx guifg=#e37933
        -- DevIconDart    xxx guifg=#03589C
        -- DevIconCMake   xxx guifg=#6d8086
        -- DevIconMustache xxx guifg=#e37933
        -- DevIconHxx     xxx guifg=#a074c4
        -- DevIconYaml    xxx guifg=#6d8086
        -- DevIconCobol   xxx guifg=#005ca5
        -- DevIconCPlusPlus xxx guifg=#f34b7d
        -- DevIconGitLogo xxx guifg=#F14C28
        -- DevIconJpeg    xxx guifg=#a074c4
        -- DevIconWebpack xxx guifg=#519aba
        -- DevIconVimrc   xxx guifg=#019833
        -- DevIconHtml    xxx guifg=#e34c26
        -- DevIconDoc     xxx guifg=#185abd
        -- DevIconSwift   xxx guifg=#e37933
        -- DevIconLess    xxx guifg=#563d7c
        -- DevIconGemspec xxx guifg=#701516
        -- DevIconStyl    xxx guifg=#8dc149
        -- DevIconBmp     xxx guifg=#a074c4
        -- DevIconLhs     xxx guifg=#a074c4
        -- DevIconSlim    xxx guifg=#e34c26
        -- DevIconScala   xxx guifg=#cc3e44
        -- DevIconTerminal xxx guifg=#31B53E
        -- DevIconGemfile xxx guifg=#701516
        -- DevIconGulpfile xxx guifg=#cc3e44
        -- DevIconCoffee  xxx guifg=#cbcb41
        -- DevIconAi      xxx guifg=#cbcb41
        -- DevIconDefault xxx guifg=#6d8086
        -- DevIconLua     xxx guifg=#51a0cf
        -- DevIconGif     xxx guifg=#a074c4
        -- DevIconVagrantfile xxx guifg=#1563FF
        -- DevIconJpg     xxx guifg=#a074c4
        -- DevIconMdx     xxx guifg=#519aba
        -- DevIconIco     xxx guifg=#cbcb41
        -- DevIconFsharp  xxx guifg=#519aba
        -- DevIconHpp     xxx guifg=#a074c4
        -- DevIconHaml    xxx guifg=#eaeae1
        -- DevIconNPMIgnore xxx guifg=#E8274B
        -- DevIconKsh     xxx guifg=#4d5a5e
        -- DevIconZshprofile xxx guifg=#89e051
        -- DevIconGitModules xxx guifg=#41535b
        -- DevIconLicense xxx guifg=#cbcb41
        -- DevIconXls     xxx guifg=#207245
        -- DevIconAwk     xxx guifg=#4d5a5e
        -- DevIconGo      xxx guifg=#519aba
        -- DevIconXml     xxx guifg=#e37933
        -- DevIconNix     xxx guifg=#7ebae4
        -- DevIconGvimrc  xxx guifg=#019833
        -- DevIconTextScene xxx guifg=#a074c4
        -- DevIconRs      xxx guifg=#dea584
        -- DevIconPhp     xxx guifg=#a074c4
        -- DevIconHtm     xxx guifg=#e34c26
        -- DevIconPm      xxx guifg=#519aba
        -- DevIconClojureC xxx guifg=#8dc149
        -- DevIconHeex    xxx guifg=#a074c4
        -- DevIconDockerfile xxx guifg=#384d54
        -- DevIconMjs     xxx guifg=#f1e05a
        -- DevIconCson    xxx guifg=#cbcb41
        -- DevIconDsStore xxx guifg=#41535b
        -- DevIconImportConfiguration xxx guifg=#ECECEC
        -- DevIconGitIgnore xxx guifg=#41535b
        -- DevIconMixLock xxx guifg=#a074c4
        -- DevIconDropbox xxx guifg=#0061FE
        -- DevIconMd      xxx guifg=#519aba
        -- DevIconClojureJS xxx guifg=#519aba
        -- DevIconPpt     xxx guifg=#cb4a32
        -- DevIconRss     xxx guifg=#FB9D3B
        -- DevIconCs      xxx guifg=#596706
        -- DevIconExs     xxx guifg=#a074c4
        -- DevIconEex     xxx guifg=#a074c4
        -- DevIconBat     xxx guifg=#C1F12E
        -- DevIconProlog  xxx guifg=#e4b854
        -- DevIconJs      xxx guifg=#cbcb41
        -- DevIconVue     xxx guifg=#8dc149
        -- DevIconHs      xxx guifg=#a074c4
        -- DevIconBashProfile xxx guifg=#89e051
        -- DevIconZig     xxx guifg=#f69a1b
        -- DevIconBinaryGLTF xxx guifg=#FFB13B
        -- DevIconDump    xxx guifg=#dad8d8
        -- DevIconCss     xxx guifg=#563d7c
        -- DevIconNodeModules xxx guifg=#E8274B
        -- DevIconPsb     xxx guifg=#519aba
        -- DevIconTextResource xxx guifg=#cbcb41
        -- DevIconZshenv  xxx guifg=#89e051
        -- DevIconConfigRu xxx guifg=#701516
        -- DevIconOpenTypeFont xxx guifg=#ECECEC
        -- DevIconFs      xxx guifg=#519aba
        -- DevIconRake    xxx guifg=#701516
        -- DevIconWebmanifest xxx guifg=#f1e05a
        -- DevIconFsx     xxx guifg=#519aba
        -- DevIconRproj   xxx guifg=#358a5b
        -- DevIconRlib    xxx guifg=#dea584
        -- DevIconGodotProject xxx guifg=#6d8086
        -- DevIconMaterial xxx guifg=#B83998
        -- DevIconPyd     xxx guifg=#519aba
        -- DevIconPy      xxx guifg=#3572A5
        -- DevIconD       xxx guifg=#427819
        -- DevIconPsd     xxx guifg=#519aba
        -- DevIconLeex    xxx guifg=#a074c4
        -- DevIconH       xxx guifg=#a074c4
        -- DevIconFavicon xxx guifg=#cbcb41
        -- DevIconPromptPs1 xxx guifg=#4d5a5e
        -- DevIconPp      xxx guifg=#302B6D
        -- DevIconBash    xxx guifg=#89e051
        -- DevIconPng     xxx guifg=#a074c4
        -- DevIconWebp    xxx guifg=#a074c4
        -- DevIconConf    xxx guifg=#6d8086
        -- DevIconDb      xxx guifg=#dad8d8
        -- DevIconGDScript xxx guifg=#6d8086
        -- DevIconVim     xxx guifg=#019833
        -- DevIconErl     xxx guifg=#B83998
        -- DevIconBabelrc xxx guifg=#cbcb41
        -- DevIconHrl     xxx guifg=#B83998
        -- DevIconPdf     xxx guifg=#b30b00
        -- DevIconRakefile xxx guifg=#701516
        -- DevIconRb      xxx guifg=#701516
        -- DevIconGitlabCI xxx guifg=#e24329
        -- DevIconScss    xxx guifg=#f55385
        -- DevIconSh      xxx guifg=#4d5a5e
        -- DevIconSml     xxx guifg=#e37933
        -- DevIconSql     xxx guifg=#dad8d8
        -- DevIconConfiguration xxx guifg=#ECECEC
        -- DevIconSuo     xxx guifg=#854CC7
        -- DevIconMakefile xxx guifg=#6d8086
        -- DevIconHh      xxx guifg=#a074c4
        -- DevIconYml     xxx guifg=#6d8086
        -- DevIconPyo     xxx guifg=#519aba
        -- DevIconGitAttributes xxx guifg=#41535b
        -- DevIconSettingsJson xxx guifg=#854CC7
        -- DevIconCsh     xxx guifg=#4d5a5e
        -- DevIconFish    xxx guifg=#4d5a5e
        -- DevIconToml    xxx guifg=#6d8086
        -- DevIconCMakeLists xxx guifg=#6d8086
        -- DevIconFsi     xxx guifg=#519aba
        -- DevIconCxx     xxx guifg=#519aba
        -- DevIconKotlin  xxx guifg=#F88A02
        -- DevIconGitCommit xxx guifg=#41535b
        -- DevIconPackedResource xxx guifg=#6d8086
        -- DevIconSig     xxx guifg=#e37933
        -- DevIconOPUS    xxx guifg=#F88A02
        -- DevIconHbs     xxx guifg=#f0772b
        -- DevIconTwig    xxx guifg=#8dc149
        -- DevIconTs      xxx guifg=#519aba
        -- DevIconTsx     xxx guifg=#519aba

        -- Nvim Tree
        NvimTreeSpecialFile { fg = xres.color10, gui = 'bold,underline' }, -- NvimTreeSpecialFile xxx gui=bold,underline guifg=10
        -- NvimTreeExecFile xxx gui=bold guifg=Green
        -- NvimTreeImageFile xxx gui=bold guifg=Purple
        -- NvimTreeIndentMarker xxx guifg=#8094b4
        -- NvimTreeFolderIcon xxx guifg=#8094b4
        NvimTreeGitDeleted { fg = xres.color13 }, -- NvimTreeGitDeleted xxx guifg=13
        NvimTreeGitNew { fg = xres.color10 }, -- NvimTreeGitNew xxx guifg=10
        NvimTreeGitMerge { fg = xres.color12 }, -- NvimTreeGitMerge xxx guifg=12
        -- NvimTreeGitRenamed xxx guifg=Purple
        NvimTreeSymlink { fg = xres.color11, gui = 'bold' }, -- NvimTreeSymlink xxx gui=bold guifg=11
        -- NvimTreeRootFolder xxx guifg=Purple
        -- NvimTreeOpenedFile xxx gui=bold guifg=Green
        NvimTreeGitDirty { fg = xres.color13 }, -- NvimTreeGitDirty xxx guifg=13
        -- NvimTreeGitStaged xxx guifg=Green
        -- NvimTreeWindowPicker xxx gui=bold guifg=#ededed guibg=#4493c8
        NvimTreeSignColumn { NvimTreeNormal }, -- NvimTreeSignColumn xxx links to NvimTreeNormal
        -- NvimTreeFileRenamed { NvimTreeGitRenamed }, -- NvimTreeFileRenamed xxx links to NvimTreeGitRenamed
        NvimTreeFileNew { NvimTreeGitNew }, -- NvimTreeFileNew xxx links to NvimTreeGitNew
        NvimTreeFileDeleted { NvimTreeGitDeleted }, -- NvimTreeFileDeleted xxx links to NvimTreeGitDeleted
        -- NvimTreeFileStaged { NvimTreeGitStaged }, -- NvimTreeFileStaged xxx links to NvimTreeGitStaged
        NvimTreeVertSplit { VertSplit }, -- NvimTreeVertSplit xxx links to VertSplit
        NvimTreeFileMerge { NvimTreeGitMerge }, -- NvimTreeFileMerge xxx links to NvimTreeGitMerge
        NvimTreeFolderName { Directory }, -- NvimTreeFolderName xxx links to Directory
        NvimTreeStatusLineNC { StatusLineNC }, -- NvimTreeStatusLineNC xxx links to StatusLineNC
        NvimTreeStatusLine { StatusLine }, -- NvimTreeStatusLine xxx links to StatusLine
        NvimTreeCursorLine { CursorLine }, -- NvimTreeCursorLine xxx links to CursorLine
        NvimTreeGitIgnored { Comment }, -- NvimTreeGitIgnored xxx links to Comment
        NvimTreeEndOfBuffer { EndOfBuffer }, -- NvimTreeEndOfBuffer xxx links to EndOfBuffer
        NvimTreeFileDirty { NvimTreeGitDirty }, -- NvimTreeFileDirty xxx links to NvimTreeGitDirty
        NvimTreeNormalNC { NvimTreeNormal }, -- NvimTreeNormalNC xxx links to NvimTreeNormal
        NvimTreeOpenedFolderName { Directory }, -- NvimTreeOpenedFolderName xxx links to Directory
        NvimTreeEmptyFolderName { Directory }, -- NvimTreeEmptyFolderName xxx links to Directory
        NvimTreeCursorColumn { CursorColumn }, -- NvimTreeCursorColumn xxx links to CursorColumn
        NvimTreeLspDiagnosticsError { DiagnosticError }, -- NvimTreeLspDiagnosticsError xxx links to DiagnosticError
        NvimTreeLspDiagnosticsWarning { DiagnosticWarning }, -- NvimTreeLspDiagnosticsWarning xxx links to DiagnosticWarning
        NvimTreeLspDiagnosticsInformation { DiagnosticInfo }, -- NvimTreeLspDiagnosticsInformation xxx links to DiagnosticInfo
        NvimTreeLspDiagnosticsHint { DiagnosticHint }, -- NvimTreeLspDiagnosticsHint xxx links to DiagnosticHint

        -- Telescope
        TelescopeSelection { fg = xres.color7, bg = xres.color8 }, -- TelescopeSelection xxx links to Visual
        TelescopeSelectionCaret { TelescopeSelection }, -- TelescopeSelectionCaret xxx links to TelescopeSelection
        TelescopeMultiSelection { Type }, -- TelescopeMultiSelection xxx links to Type
        TelescopeNormal { Normal }, -- TelescopeNormal xxx links to Normal
        TelescopePreviewNormal { Normal }, -- TelescopePreviewNormal xxx links to Normal
        TelescopeBorder { TelescopeNormal }, -- TelescopeBorder xxx links to TelescopeNormal
        TelescopePromptBorder { TelescopeBorder }, -- TelescopePromptBorder xxx links to TelescopeBorder
        TelescopeResultsBorder { TelescopeBorder }, -- TelescopeResultsBorder xxx links to TelescopeBorder
        TelescopePreviewBorder { TelescopeBorder }, -- TelescopePreviewBorder xxx links to TelescopeBorder
        TelescopeMatching { Special }, -- TelescopeMatching xxx links to Special
        TelescopePromptPrefix { Identifier }, -- TelescopePromptPrefix xxx links to Identifier
        TelescopePreviewLine { Visual }, -- TelescopePreviewLine xxx links to Visual
        TelescopePreviewMatch { Search }, -- TelescopePreviewMatch xxx links to Search
        TelescopePreviewPipe { Constant }, -- TelescopePreviewPipe xxx links to Constant
        TelescopePreviewCharDev { Constant }, -- TelescopePreviewCharDev xxx links to Constant
        TelescopePreviewDirectory { Directory }, -- TelescopePreviewDirectory xxx links to Directory
        TelescopePreviewBlock { Constant }, -- TelescopePreviewBlock xxx links to Constant
        TelescopePreviewLink { Special }, -- TelescopePreviewLink xxx links to Special
        TelescopePreviewSocket { Statement }, -- TelescopePreviewSocket xxx links to Statement
        TelescopePreviewRead { Constant }, -- TelescopePreviewRead xxx links to Constant
        TelescopePreviewWrite { Statement }, -- TelescopePreviewWrite xxx links to Statement
        TelescopePreviewExecute { String }, -- TelescopePreviewExecute xxx links to String
        TelescopePreviewHyphen { NonText }, -- TelescopePreviewHyphen xxx links to NonText
        TelescopePreviewSticky { Keyword }, -- TelescopePreviewSticky xxx links to Keyword
        TelescopePreviewSize { String }, -- TelescopePreviewSize xxx links to String
        TelescopePreviewUser { Constant }, -- TelescopePreviewUser xxx links to Constant
        TelescopePreviewGroup { Constant }, -- TelescopePreviewGroup xxx links to Constant
        TelescopePreviewDate { Directory }, -- TelescopePreviewDate xxx links to Directory
        TelescopePreviewMessage { TelescopePreviewNormal }, -- TelescopePreviewMessage xxx links to TelescopePreviewNormal
        TelescopePreviewMessageFillchar { TelescopePreviewMessage }, -- TelescopePreviewMessageFillchar xxx links to TelescopePreviewMessage
        TelescopeResultsClass { Function }, -- TelescopeResultsClass xxx links to Function
        TelescopeResultsConstant { Constant }, -- TelescopeResultsConstant xxx links to Constant
        TelescopeResultsField { Function }, -- TelescopeResultsField xxx links to Function
        TelescopeResultsFunction { Function }, -- TelescopeResultsFunction xxx links to Function
        TelescopeResultsMethod { Method }, -- TelescopeResultsMethod xxx links to Method
    }
end)

lush(walush)

-- return to use theme colors or hi groups for other plugins
return walush
