---@class Scholar
---@field config ScholarConfig
---@field palette ScholarPalette
local Scholar = {}

---@alias Contrast "hard" | "soft" | ""

---@class ItalicConfig
---@field strings boolean
---@field comments boolean
---@field operators boolean
---@field folds boolean
---@field emphasis boolean

---@class HighlightDefinition
---@field fg string?
---@field bg string?
---@field sp string?
---@field blend integer?
---@field bold boolean?
---@field standout boolean?
---@field underline boolean?
---@field undercurl boolean?
---@field underdouble boolean?
---@field underdotted boolean?
---@field strikethrough boolean?
---@field italic boolean?
---@field reverse boolean?
---@field nocombine boolean?

---@class ScholarConfig
---@field bold boolean?
---@field contrast Contrast?
---@field dim_inactive boolean?
---@field inverse boolean?
---@field invert_selection boolean?
---@field invert_signs boolean?
---@field invert_tabline boolean?
---@field italic ItalicConfig?
---@field overrides table<string, HighlightDefinition>?
---@field palette_overrides table<string, string>?
---@field strikethrough boolean?
---@field terminal_colors boolean?
---@field transparent_mode boolean?
---@field undercurl boolean?
---@field underline boolean?
Scholar.config = {
  terminal_colors = true,
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = true,
    emphasis = true,
    comments = true,
    operators = false,
    folds = true,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  inverse = true,
  contrast = "",
  palette_overrides = {},
  overrides = {},
  dim_inactive = false,
  transparent_mode = false,
}

-- main scholar color palette
---@class ScholarPalette
Scholar.palette = {
  -- Background tones (lightest to medium sepia backgrounds)
  light0_hard = "#F2E0C8", -- Hardest light background - parchment white
  light0 = "#F0DEC6", -- Default light background - warm paper
  light0_soft = "#EEDCC4", -- Softest light background - aged paper
  light1 = "#ECD8C0", -- Light tone variation - cream
  light2 = "#E6D0B6", -- Medium light tone - light sepia
  light3 = "#E0C8AC", -- Medium tone - sepia cream
  light4 = "#D8BEA2", -- Medium dark tone - sepia beige

  -- Text tones (perfected hierarchy and readability)
  dark0_hard = "#3A2520", -- Deepest text for maximum contrast situations
  dark0 = "#452A25", -- Primary text - optimal readability
  dark0_soft = "#4A3530", -- Soft variant maintained
  dark1 = "#452A25", -- Primary text consistency
  dark2 = "#5A4034", -- Secondary text - slightly lighter for hierarchy
  dark3 = "#6B4E31", -- Tertiary text - maintained
  dark4 = "#7A5C3A", -- Quaternary text - maintained

  -- Dark theme background tones (darkest to medium sepia backgrounds)
  dark_bg0_hard = "#1B1512", -- Hardest dark background - deep charcoal sepia
  dark_bg0 = "#1F1815", -- Default dark background - warm dark paper
  dark_bg0_soft = "#221B18", -- Softest dark background - gentle dark
  dark_bg1 = "#241D1A", -- Dark tone variation - dark cream
  dark_bg2 = "#2A211E", -- Medium dark tone - dark sepia
  dark_bg3 = "#302722", -- Medium tone - dark sepia cream
  dark_bg4 = "#362D28", -- Medium light tone - dark sepia beige

  -- Dark theme text tones (lightest to medium sepia text)
  light_fg0_hard = "#F5E8D5", -- Brightest text for maximum contrast situations
  light_fg0 = "#F0E0CC", -- Primary text - optimal readability in dark
  light_fg0_soft = "#EBD8C4", -- Soft variant for dark backgrounds
  light_fg1 = "#E6D0BC", -- Primary text consistency in dark
  light_fg2 = "#E0C8B4", -- Secondary text - slightly darker for hierarchy
  light_fg3 = "#DAC0AC", -- Tertiary text - well balanced
  light_fg4 = "#D4B8A4", -- Quaternary text - subtle but readable

  -- Syntax colors (perfected for maximum distinction)
  neutral_red = "#A0623A", -- errors/warnings - maintained warmth
  neutral_green = "#7A653E", -- strings - slightly more yellow undertone
  neutral_yellow = "#B8834C", -- keywords - maintained prominence
  neutral_blue = "#6E5640", -- functions - added depth
  neutral_purple = "#945A2E", -- types - more distinctive orange
  neutral_aqua = "#7D654A", -- constants - balanced earthiness
  neutral_orange = "#A0623A", -- numbers/special - consistent with red

  -- Dark theme syntax colors (enhanced for dark backgrounds)
  dark_neutral_red = "#D4845A", -- errors/warnings - warmer and brighter
  dark_neutral_green = "#B8945E", -- strings - enhanced yellow undertone
  dark_neutral_yellow = "#E8A76C", -- keywords - more prominent for dark
  dark_neutral_blue = "#9E7660", -- functions - enhanced depth
  dark_neutral_purple = "#B4724E", -- types - warmer orange for dark
  dark_neutral_aqua = "#AD856A", -- constants - enhanced earthiness
  dark_neutral_orange = "#D4845A", -- numbers/special - consistent with red

  -- Bright colors (mathematically harmonized)
  bright_red = "#C08050", -- maintained - perfect warmth
  bright_green = "#957A4F", -- refined for better harmony
  bright_yellow = "#D4975A", -- maintained - ideal prominence
  bright_blue = "#8A6E4C", -- maintained - good depth
  bright_purple = "#A8724A", -- slightly warmer for cohesion
  bright_aqua = "#9A7D5F", -- refined earth tone
  bright_orange = "#C08050", -- consistent with red

  -- Dark theme bright colors (enhanced for dark backgrounds)
  dark_bright_red = "#E8A080", -- enhanced warmth for dark
  dark_bright_green = "#C5AA7F", -- improved harmony for dark
  dark_bright_yellow = "#F4B78A", -- enhanced prominence for dark
  dark_bright_blue = "#BAAA8C", -- improved depth for dark
  dark_bright_purple = "#D8A27A", -- enhanced cohesion for dark
  dark_bright_aqua = "#CAAD8F", -- enhanced earth tone for dark
  dark_bright_orange = "#E8A080", -- consistent with red for dark

  -- Faded colors (darker variants for subtle elements)
  faded_red = "#6B4230", -- Faded red - muted error tones
  faded_green = "#644E37", -- Faded green - subtle success indicators
  faded_yellow = "#82643C", -- Faded yellow - dimmed highlights
  faded_blue = "#5A462E", -- Faded blue - subdued function calls
  faded_purple = "#73462A", -- Faded purple - muted type annotations
  faded_aqua = "#624E38", -- Faded aqua - subtle constants
  faded_orange = "#6B4230", -- Faded orange - dimmed special elements

  -- Dark theme faded colors (brighter variants for subtle elements)
  dark_faded_red = "#A87060", -- Enhanced red for dark backgrounds
  dark_faded_green = "#947E67", -- Enhanced green for dark backgrounds
  dark_faded_yellow = "#B2946C", -- Enhanced yellow for dark backgrounds
  dark_faded_blue = "#8A765E", -- Enhanced blue for dark backgrounds
  dark_faded_purple = "#A3765A", -- Enhanced purple for dark backgrounds
  dark_faded_aqua = "#927E68", -- Enhanced aqua for dark backgrounds
  dark_faded_orange = "#A87060", -- Enhanced orange for dark backgrounds

  -- Red color variants (warm sepia reds for errors and emphasis)
  dark_red_hard = "#5A3229", -- Hard dark red - intense error states
  dark_red = "#634035", -- Standard dark red - error indicators
  dark_red_soft = "#6B453A", -- Soft dark red - gentle error hints
  light_red_hard = "#C89B85", -- Hard light red - bright error highlights
  light_red = "#C4956F", -- Standard light red - error backgrounds
  light_red_soft = "#BF8F69", -- Soft light red - subtle error regions

  -- Dark theme red variants (enhanced for dark backgrounds)
  dark_theme_red_hard = "#E8B8A5", -- Hard red for dark theme
  dark_theme_red = "#E4B59F", -- Standard red for dark theme
  dark_theme_red_soft = "#DFAF99", -- Soft red for dark theme

  -- Green color variants (earthy greens for success and strings)
  dark_green_hard = "#4F4A35", -- Hard dark green - intense success states
  dark_green = "#565138", -- Standard dark green - success indicators
  dark_green_soft = "#5C573B", -- Soft dark green - gentle success hints
  light_green_hard = "#B8B089", -- Hard light green - bright success highlights
  light_green = "#B4AC7F", -- Standard light green - success backgrounds
  light_green_soft = "#AFA675", -- Soft light green - subtle success regions

  -- Dark theme green variants (enhanced for dark backgrounds)
  dark_theme_green_hard = "#D8D0A9", -- Hard green for dark theme
  dark_theme_green = "#D4CC9F", -- Standard green for dark theme
  dark_theme_green_soft = "#CFC695", -- Soft green for dark theme

  -- Aqua color variants (balanced earth tones for constants and info)
  dark_aqua_hard = "#4A4435", -- Hard dark aqua - intense info states
  dark_aqua = "#514B38", -- Standard dark aqua - info indicators
  dark_aqua_soft = "#57523B", -- Soft dark aqua - gentle info hints
  light_aqua_hard = "#D2C9A8", -- Hard light aqua - bright info highlights
  light_aqua = "#CEC49E", -- Standard light aqua - info backgrounds
  light_aqua_soft = "#C8BE94", -- Soft light aqua - subtle info regions

  -- Dark theme aqua variants (enhanced for dark backgrounds)
  dark_theme_aqua_hard = "#F2E9C8", -- Hard aqua for dark theme
  dark_theme_aqua = "#EEE4BE", -- Standard aqua for dark theme
  dark_theme_aqua_soft = "#E8DEB4", -- Soft aqua for dark theme

  -- Comments and UI elements (refined neutral tones)
  gray = "#A68663", -- Comments and secondary UI - perfect readability balance

  -- Dark theme gray (enhanced for dark backgrounds)
  dark_gray = "#C6A683", -- Enhanced comments and UI for dark backgrounds
}

-- get a hex list of scholar colors based on current bg and constrast config
local function get_colors()
  local p = Scholar.palette
  local config = Scholar.config

  for color, hex in pairs(config.palette_overrides) do
    p[color] = hex
  end

  local bg = vim.o.background
  local contrast = config.contrast

  local color_groups = {
    dark = {
      bg0 = p.dark_bg0,
      bg1 = p.dark_bg1,
      bg2 = p.dark_bg2,
      bg3 = p.dark_bg3,
      bg4 = p.dark_bg4,
      fg0 = p.light_fg0,
      fg1 = p.light_fg1,
      fg2 = p.light_fg2,
      fg3 = p.light_fg3,
      fg4 = p.light_fg4,
      red = p.dark_bright_red,
      green = p.dark_bright_green,
      yellow = p.dark_bright_yellow,
      blue = p.dark_bright_blue,
      purple = p.dark_bright_purple,
      aqua = p.dark_bright_aqua,
      orange = p.dark_bright_orange,
      neutral_red = p.dark_neutral_red,
      neutral_green = p.dark_neutral_green,
      neutral_yellow = p.dark_neutral_yellow,
      neutral_blue = p.dark_neutral_blue,
      neutral_purple = p.dark_neutral_purple,
      neutral_aqua = p.dark_neutral_aqua,
      dark_red = p.dark_theme_red,
      dark_green = p.dark_theme_green,
      dark_aqua = p.dark_theme_aqua,
      gray = p.dark_gray,
    },
    light = {
      bg0 = p.light0,
      bg1 = p.light1,
      bg2 = p.light2,
      bg3 = p.light3,
      bg4 = p.light4,
      fg0 = p.dark0,
      fg1 = p.dark1,
      fg2 = p.dark2,
      fg3 = p.dark3,
      fg4 = p.dark4,
      red = p.faded_red,
      green = p.faded_green,
      yellow = p.faded_yellow,
      blue = p.faded_blue,
      purple = p.faded_purple,
      aqua = p.faded_aqua,
      orange = p.faded_orange,
      neutral_red = p.neutral_red,
      neutral_green = p.neutral_green,
      neutral_yellow = p.neutral_yellow,
      neutral_blue = p.neutral_blue,
      neutral_purple = p.neutral_purple,
      neutral_aqua = p.neutral_aqua,
      dark_red = p.light_red,
      dark_green = p.light_green,
      dark_aqua = p.light_aqua,
      gray = p.gray,
    },
  }

  if contrast ~= nil and contrast ~= "" then
    if bg == "dark" then
      color_groups[bg].bg0 = p["dark_bg0_" .. contrast]
      color_groups[bg].dark_red = p["dark_theme_red_" .. contrast]
      color_groups[bg].dark_green = p["dark_theme_green_" .. contrast]
      color_groups[bg].dark_aqua = p["dark_theme_aqua_" .. contrast]
    else
      color_groups[bg].bg0 = p[bg .. "0_" .. contrast]
      color_groups[bg].dark_red = p[bg .. "_red_" .. contrast]
      color_groups[bg].dark_green = p[bg .. "_green_" .. contrast]
      color_groups[bg].dark_aqua = p[bg .. "_aqua_" .. contrast]
    end
  end

  return color_groups[bg]
end

local function get_groups()
  local colors = get_colors()
  local config = Scholar.config

  if config.terminal_colors then
    local term_colors = {
      colors.bg0,
      colors.neutral_red,
      colors.neutral_green,
      colors.neutral_yellow,
      colors.neutral_blue,
      colors.neutral_purple,
      colors.neutral_aqua,
      colors.fg4,
      colors.gray,
      colors.red,
      colors.green,
      colors.yellow,
      colors.blue,
      colors.purple,
      colors.aqua,
      colors.fg1,
    }
    for index, value in ipairs(term_colors) do
      vim.g["terminal_color_" .. index - 1] = value
    end
  end

  local groups = {
    ScholarFg0 = { fg = colors.fg0 },
    ScholarFg1 = { fg = colors.fg1 },
    ScholarFg2 = { fg = colors.fg2 },
    ScholarFg3 = { fg = colors.fg3 },
    ScholarFg4 = { fg = colors.fg4 },
    ScholarGray = { fg = colors.gray },
    ScholarBg0 = { fg = colors.bg0 },
    ScholarBg1 = { fg = colors.bg1 },
    ScholarBg2 = { fg = colors.bg2 },
    ScholarBg3 = { fg = colors.bg3 },
    ScholarBg4 = { fg = colors.bg4 },
    ScholarRed = { fg = colors.red },
    ScholarRedBold = { fg = colors.red, bold = config.bold },
    ScholarGreen = { fg = colors.green },
    ScholarGreenBold = { fg = colors.green, bold = config.bold },
    ScholarYellow = { fg = colors.yellow },
    ScholarYellowBold = { fg = colors.yellow, bold = config.bold },
    ScholarBlue = { fg = colors.blue },
    ScholarBlueBold = { fg = colors.blue, bold = config.bold },
    ScholarPurple = { fg = colors.purple },
    ScholarPurpleBold = { fg = colors.purple, bold = config.bold },
    ScholarAqua = { fg = colors.aqua },
    ScholarAquaBold = { fg = colors.aqua, bold = config.bold },
    ScholarOrange = { fg = colors.orange },
    ScholarOrangeBold = { fg = colors.orange, bold = config.bold },
    ScholarRedSign = config.transparent_mode and { fg = colors.red, reverse = config.invert_signs }
      or { fg = colors.red, bg = colors.bg1, reverse = config.invert_signs },
    ScholarGreenSign = config.transparent_mode and { fg = colors.green, reverse = config.invert_signs }
      or { fg = colors.green, bg = colors.bg1, reverse = config.invert_signs },
    ScholarYellowSign = config.transparent_mode and { fg = colors.yellow, reverse = config.invert_signs }
      or { fg = colors.yellow, bg = colors.bg1, reverse = config.invert_signs },
    ScholarBlueSign = config.transparent_mode and { fg = colors.blue, reverse = config.invert_signs }
      or { fg = colors.blue, bg = colors.bg1, reverse = config.invert_signs },
    ScholarPurpleSign = config.transparent_mode and { fg = colors.purple, reverse = config.invert_signs }
      or { fg = colors.purple, bg = colors.bg1, reverse = config.invert_signs },
    ScholarAquaSign = config.transparent_mode and { fg = colors.aqua, reverse = config.invert_signs }
      or { fg = colors.aqua, bg = colors.bg1, reverse = config.invert_signs },
    ScholarOrangeSign = config.transparent_mode and { fg = colors.orange, reverse = config.invert_signs }
      or { fg = colors.orange, bg = colors.bg1, reverse = config.invert_signs },
    ScholarRedUnderline = { undercurl = config.undercurl, sp = colors.red },
    ScholarGreenUnderline = { undercurl = config.undercurl, sp = colors.green },
    ScholarYellowUnderline = { undercurl = config.undercurl, sp = colors.yellow },
    ScholarBlueUnderline = { undercurl = config.undercurl, sp = colors.blue },
    ScholarPurpleUnderline = { undercurl = config.undercurl, sp = colors.purple },
    ScholarAquaUnderline = { undercurl = config.undercurl, sp = colors.aqua },
    ScholarOrangeUnderline = { undercurl = config.undercurl, sp = colors.orange },
    Normal = config.transparent_mode and { fg = colors.fg1, bg = nil } or { fg = colors.fg1, bg = colors.bg0 },
    NormalFloat = config.transparent_mode and { fg = colors.fg1, bg = nil } or { fg = colors.fg1, bg = colors.bg1 },
    NormalNC = config.dim_inactive and { fg = colors.fg0, bg = colors.bg1 } or { link = "Normal" },
    CursorLine = { bg = colors.bg1 },
    CursorColumn = { link = "CursorLine" },
    TabLineFill = { fg = colors.bg4, bg = colors.bg1, reverse = config.invert_tabline },
    TabLineSel = { fg = colors.green, bg = colors.bg1, reverse = config.invert_tabline },
    TabLine = { link = "TabLineFill" },
    MatchParen = { bg = colors.bg3, bold = config.bold },
    ColorColumn = { bg = colors.bg1 },
    Conceal = { fg = colors.blue },
    CursorLineNr = { fg = colors.yellow, bg = colors.bg1 },
    NonText = { link = "ScholarBg2" },
    SpecialKey = { link = "ScholarFg4" },
    Visual = { bg = colors.bg3, reverse = config.invert_selection },
    VisualNOS = { link = "Visual" },
    Search = { fg = colors.yellow, bg = colors.bg0, reverse = config.inverse },
    IncSearch = { fg = colors.orange, bg = colors.bg0, reverse = config.inverse },
    CurSearch = { link = "IncSearch" },
    QuickFixLine = { link = "ScholarPurple" },
    Underlined = { fg = colors.blue, underline = config.underline },
    StatusLine = { fg = colors.fg1, bg = colors.bg2 },
    StatusLineNC = { fg = colors.fg4, bg = colors.bg1 },
    WinBar = { fg = colors.fg4, bg = colors.bg0 },
    WinBarNC = { fg = colors.fg3, bg = colors.bg1 },
    WinSeparator = config.transparent_mode and { fg = colors.bg3, bg = nil } or { fg = colors.bg3, bg = colors.bg0 },
    WildMenu = { fg = colors.blue, bg = colors.bg2, bold = config.bold },
    Directory = { link = "ScholarGreenBold" },
    Title = { link = "ScholarGreenBold" },
    ErrorMsg = { fg = colors.bg0, bg = colors.red, bold = config.bold },
    MoreMsg = { link = "ScholarYellowBold" },
    ModeMsg = { link = "ScholarYellowBold" },
    Question = { link = "ScholarOrangeBold" },
    WarningMsg = { link = "ScholarRedBold" },
    LineNr = { fg = colors.bg4 },
    SignColumn = config.transparent_mode and { bg = nil } or { bg = colors.bg1 },
    Folded = { fg = colors.gray, bg = colors.bg1, italic = config.italic.folds },
    FoldColumn = config.transparent_mode and { fg = colors.gray, bg = nil } or { fg = colors.gray, bg = colors.bg1 },
    Cursor = { reverse = config.inverse },
    vCursor = { link = "Cursor" },
    iCursor = { link = "Cursor" },
    lCursor = { link = "Cursor" },
    Special = { link = "ScholarOrange" },
    Comment = { fg = colors.gray, italic = config.italic.comments },
    Todo = { fg = colors.bg0, bg = colors.yellow, bold = config.bold, italic = config.italic.comments },
    Done = { fg = colors.orange, bold = config.bold, italic = config.italic.comments },
    Error = { fg = colors.red, bold = config.bold, reverse = config.inverse },
    Statement = { link = "ScholarRed" },
    Conditional = { link = "ScholarRed" },
    Repeat = { link = "ScholarRed" },
    Label = { link = "ScholarRed" },
    Exception = { link = "ScholarRed" },
    Operator = { fg = colors.orange, italic = config.italic.operators },
    Keyword = { link = "ScholarRed" },
    Identifier = { link = "ScholarBlue" },
    Function = { link = "ScholarGreenBold" },
    PreProc = { link = "ScholarAqua" },
    Include = { link = "ScholarAqua" },
    Define = { link = "ScholarAqua" },
    Macro = { link = "ScholarAqua" },
    PreCondit = { link = "ScholarAqua" },
    Constant = { link = "ScholarPurple" },
    Character = { link = "ScholarPurple" },
    String = { fg = colors.green, italic = config.italic.strings },
    Boolean = { link = "ScholarPurple" },
    Number = { link = "ScholarPurple" },
    Float = { link = "ScholarPurple" },
    Type = { link = "ScholarYellow" },
    StorageClass = { link = "ScholarOrange" },
    Structure = { link = "ScholarAqua" },
    Typedef = { link = "ScholarYellow" },
    Pmenu = { fg = colors.fg1, bg = colors.bg2 },
    PmenuSel = { fg = colors.bg2, bg = colors.blue, bold = config.bold },
    PmenuSbar = { bg = colors.bg2 },
    PmenuThumb = { bg = colors.bg4 },
    DiffDelete = { bg = colors.dark_red },
    DiffAdd = { bg = colors.dark_green },
    DiffChange = { bg = colors.dark_aqua },
    DiffText = { bg = colors.yellow, fg = colors.bg0 },
    SpellCap = { link = "ScholarBlueUnderline" },
    SpellBad = { link = "ScholarRedUnderline" },
    SpellLocal = { link = "ScholarAquaUnderline" },
    SpellRare = { link = "ScholarPurpleUnderline" },
    Whitespace = { fg = colors.bg2 },
    Delimiter = { link = "ScholarOrange" },
    EndOfBuffer = { link = "NonText" },
    DiagnosticError = { link = "ScholarRed" },
    DiagnosticWarn = { link = "ScholarYellow" },
    DiagnosticInfo = { link = "ScholarBlue" },
    DiagnosticHint = { link = "ScholarAqua" },
    DiagnosticOk = { link = "ScholarGreen" },
    DiagnosticSignError = { link = "ScholarRedSign" },
    DiagnosticSignWarn = { link = "ScholarYellowSign" },
    DiagnosticSignInfo = { link = "ScholarBlueSign" },
    DiagnosticSignHint = { link = "ScholarAquaSign" },
    DiagnosticSignOk = { link = "ScholarGreenSign" },
    DiagnosticUnderlineError = { link = "ScholarRedUnderline" },
    DiagnosticUnderlineWarn = { link = "ScholarYellowUnderline" },
    DiagnosticUnderlineInfo = { link = "ScholarBlueUnderline" },
    DiagnosticUnderlineHint = { link = "ScholarAquaUnderline" },
    DiagnosticUnderlineOk = { link = "ScholarGreenUnderline" },
    DiagnosticFloatingError = { link = "ScholarRed" },
    DiagnosticFloatingWarn = { link = "ScholarOrange" },
    DiagnosticFloatingInfo = { link = "ScholarBlue" },
    DiagnosticFloatingHint = { link = "ScholarAqua" },
    DiagnosticFloatingOk = { link = "ScholarGreen" },
    DiagnosticVirtualTextError = { link = "ScholarRed" },
    DiagnosticVirtualTextWarn = { link = "ScholarYellow" },
    DiagnosticVirtualTextInfo = { link = "ScholarBlue" },
    DiagnosticVirtualTextHint = { link = "ScholarAqua" },
    DiagnosticVirtualTextOk = { link = "ScholarGreen" },
    LspReferenceRead = { link = "ScholarYellowBold" },
    LspReferenceTarget = { link = "Visual" },
    LspReferenceText = { link = "ScholarYellowBold" },
    LspReferenceWrite = { link = "ScholarOrangeBold" },
    LspCodeLens = { link = "ScholarGray" },
    LspSignatureActiveParameter = { link = "Search" },
    gitcommitSelectedFile = { link = "ScholarGreen" },
    gitcommitDiscardedFile = { link = "ScholarRed" },
    GitSignsAdd = { link = "ScholarGreen" },
    GitSignsChange = { link = "ScholarOrange" },
    GitSignsDelete = { link = "ScholarRed" },
    NvimTreeSymlink = { fg = colors.neutral_aqua },
    NvimTreeRootFolder = { fg = colors.neutral_purple, bold = true },
    NvimTreeFolderIcon = { fg = colors.neutral_blue, bold = true },
    NvimTreeFileIcon = { fg = colors.light2 },
    NvimTreeExecFile = { fg = colors.neutral_green, bold = true },
    NvimTreeOpenedFile = { fg = colors.bright_red, bold = true },
    NvimTreeSpecialFile = { fg = colors.neutral_yellow, bold = true, underline = true },
    NvimTreeImageFile = { fg = colors.neutral_purple },
    NvimTreeIndentMarker = { fg = colors.dark3 },
    NvimTreeGitDirty = { fg = colors.neutral_yellow },
    NvimTreeGitStaged = { fg = colors.neutral_yellow },
    NvimTreeGitMerge = { fg = colors.neutral_purple },
    NvimTreeGitRenamed = { fg = colors.neutral_purple },
    NvimTreeGitNew = { fg = colors.neutral_yellow },
    NvimTreeGitDeleted = { fg = colors.neutral_red },
    NvimTreeWindowPicker = { bg = colors.aqua },
    debugPC = { link = "DiffAdd" },
    debugBreakpoint = { link = "ScholarRedSign" },
    StartifyBracket = { link = "ScholarFg3" },
    StartifyFile = { link = "ScholarFg1" },
    StartifyNumber = { link = "ScholarBlue" },
    StartifyPath = { link = "ScholarGray" },
    StartifySlash = { link = "ScholarGray" },
    StartifySection = { link = "ScholarYellow" },
    StartifySpecial = { link = "ScholarBg2" },
    StartifyHeader = { link = "ScholarOrange" },
    StartifyFooter = { link = "ScholarBg2" },
    StartifyVar = { link = "StartifyPath" },
    StartifySelect = { link = "Title" },
    DirvishPathTail = { link = "ScholarAqua" },
    DirvishArg = { link = "ScholarYellow" },
    netrwDir = { link = "ScholarAqua" },
    netrwClassify = { link = "ScholarAqua" },
    netrwLink = { link = "ScholarGray" },
    netrwSymLink = { link = "ScholarFg1" },
    netrwExe = { link = "ScholarYellow" },
    netrwComment = { link = "ScholarGray" },
    netrwList = { link = "ScholarBlue" },
    netrwHelpCmd = { link = "ScholarAqua" },
    netrwCmdSep = { link = "ScholarFg3" },
    netrwVersion = { link = "ScholarGreen" },
    NERDTreeDir = { link = "ScholarAqua" },
    NERDTreeDirSlash = { link = "ScholarAqua" },
    NERDTreeOpenable = { link = "ScholarOrange" },
    NERDTreeClosable = { link = "ScholarOrange" },
    NERDTreeFile = { link = "ScholarFg1" },
    NERDTreeExecFile = { link = "ScholarYellow" },
    NERDTreeUp = { link = "ScholarGray" },
    NERDTreeCWD = { link = "ScholarGreen" },
    NERDTreeHelp = { link = "ScholarFg1" },
    NERDTreeToggleOn = { link = "ScholarGreen" },
    NERDTreeToggleOff = { link = "ScholarRed" },
    CocErrorSign = { link = "ScholarRedSign" },
    CocWarningSign = { link = "ScholarOrangeSign" },
    CocInfoSign = { link = "ScholarBlueSign" },
    CocHintSign = { link = "ScholarAquaSign" },
    CocErrorFloat = { link = "ScholarRed" },
    CocWarningFloat = { link = "ScholarOrange" },
    CocInfoFloat = { link = "ScholarBlue" },
    CocHintFloat = { link = "ScholarAqua" },
    CocDiagnosticsError = { link = "ScholarRed" },
    CocDiagnosticsWarning = { link = "ScholarOrange" },
    CocDiagnosticsInfo = { link = "ScholarBlue" },
    CocDiagnosticsHint = { link = "ScholarAqua" },
    CocSearch = { link = "ScholarBlue" },
    CocSelectedText = { link = "ScholarRed" },
    CocMenuSel = { link = "PmenuSel" },
    CocCodeLens = { link = "ScholarGray" },
    CocErrorHighlight = { link = "ScholarRedUnderline" },
    CocWarningHighlight = { link = "ScholarOrangeUnderline" },
    CocInfoHighlight = { link = "ScholarBlueUnderline" },
    CocHintHighlight = { link = "ScholarAquaUnderline" },
    SnacksPicker = { link = "ScholarFg1" },
    SnacksPickerBorder = { link = "SnacksPicker" },
    SnacksPickerListCursorLine = { link = "CursorLine" },
    SnacksPickerMatch = { link = "ScholarOrange" },
    SnacksPickerPrompt = { link = "ScholarRed" },
    SnacksPickerTitle = { link = "SnacksPicker" },
    SnacksPickerDir = { link = "ScholarGray" },
    SnacksPickerPathHidden = { link = "ScholarGray" },
    SnacksPickerGitStatusUntracked = { link = "ScholarGray" },
    SnacksPickerPathIgnored = { link = "ScholarBg3" },
    TelescopeNormal = { link = "ScholarFg1" },
    TelescopeSelection = { link = "CursorLine" },
    TelescopeSelectionCaret = { link = "ScholarRed" },
    TelescopeMultiSelection = { link = "ScholarGray" },
    TelescopeBorder = { link = "TelescopeNormal" },
    TelescopePromptBorder = { link = "TelescopeNormal" },
    TelescopeResultsBorder = { link = "TelescopeNormal" },
    TelescopePreviewBorder = { link = "TelescopeNormal" },
    TelescopeMatching = { link = "ScholarOrange" },
    TelescopePromptPrefix = { link = "ScholarRed" },
    TelescopePrompt = { link = "TelescopeNormal" },
    CmpItemAbbr = { link = "ScholarFg0" },
    CmpItemAbbrDeprecated = { link = "ScholarFg1" },
    CmpItemAbbrMatch = { link = "ScholarBlueBold" },
    CmpItemAbbrMatchFuzzy = { link = "ScholarBlueUnderline" },
    CmpItemMenu = { link = "ScholarGray" },
    CmpItemKindText = { link = "ScholarOrange" },
    CmpItemKindVariable = { link = "ScholarOrange" },
    CmpItemKindMethod = { link = "ScholarBlue" },
    CmpItemKindFunction = { link = "ScholarBlue" },
    CmpItemKindConstructor = { link = "ScholarYellow" },
    CmpItemKindUnit = { link = "ScholarBlue" },
    CmpItemKindField = { link = "ScholarBlue" },
    CmpItemKindClass = { link = "ScholarYellow" },
    CmpItemKindInterface = { link = "ScholarYellow" },
    CmpItemKindModule = { link = "ScholarBlue" },
    CmpItemKindProperty = { link = "ScholarBlue" },
    CmpItemKindValue = { link = "ScholarOrange" },
    CmpItemKindEnum = { link = "ScholarYellow" },
    CmpItemKindOperator = { link = "ScholarYellow" },
    CmpItemKindKeyword = { link = "ScholarPurple" },
    CmpItemKindEvent = { link = "ScholarPurple" },
    CmpItemKindReference = { link = "ScholarPurple" },
    CmpItemKindColor = { link = "ScholarPurple" },
    CmpItemKindSnippet = { link = "ScholarGreen" },
    CmpItemKindFile = { link = "ScholarBlue" },
    CmpItemKindFolder = { link = "ScholarBlue" },
    CmpItemKindEnumMember = { link = "ScholarAqua" },
    CmpItemKindConstant = { link = "ScholarOrange" },
    CmpItemKindStruct = { link = "ScholarYellow" },
    CmpItemKindTypeParameter = { link = "ScholarYellow" },
    BlinkCmpLabel = { link = "ScholarFg0" },
    BlinkCmpLabelDeprecated = { link = "ScholarFg1" },
    BlinkCmpLabelMatch = { link = "ScholarBlueBold" },
    BlinkCmpLabelDetail = { link = "ScholarGray" },
    BlinkCmpLabelDescription = { link = "ScholarGray" },
    BlinkCmpKindText = { link = "ScholarOrange" },
    BlinkCmpKindVariable = { link = "ScholarOrange" },
    BlinkCmpKindMethod = { link = "ScholarBlue" },
    BlinkCmpKindFunction = { link = "ScholarBlue" },
    BlinkCmpKindConstructor = { link = "ScholarYellow" },
    BlinkCmpKindUnit = { link = "ScholarBlue" },
    BlinkCmpKindField = { link = "ScholarBlue" },
    BlinkCmpKindClass = { link = "ScholarYellow" },
    BlinkCmpKindInterface = { link = "ScholarYellow" },
    BlinkCmpKindModule = { link = "ScholarBlue" },
    BlinkCmpKindProperty = { link = "ScholarBlue" },
    BlinkCmpKindValue = { link = "ScholarOrange" },
    BlinkCmpKindEnum = { link = "ScholarYellow" },
    BlinkCmpKindOperator = { link = "ScholarYellow" },
    BlinkCmpKindKeyword = { link = "ScholarPurple" },
    BlinkCmpKindEvent = { link = "ScholarPurple" },
    BlinkCmpKindReference = { link = "ScholarPurple" },
    BlinkCmpKindColor = { link = "ScholarPurple" },
    BlinkCmpKindSnippet = { link = "ScholarGreen" },
    BlinkCmpKindFile = { link = "ScholarBlue" },
    BlinkCmpKindFolder = { link = "ScholarBlue" },
    BlinkCmpKindEnumMember = { link = "ScholarAqua" },
    BlinkCmpKindConstant = { link = "ScholarOrange" },
    BlinkCmpKindStruct = { link = "ScholarYellow" },
    BlinkCmpKindTypeParameter = { link = "ScholarYellow" },
    BlinkCmpSource = { link = "ScholarGray" },
    BlinkCmpGhostText = { link = "ScholarBg4" },
    diffAdded = { link = "DiffAdd" },
    diffRemoved = { link = "DiffDelete" },
    diffChanged = { link = "DiffChange" },
    diffFile = { link = "ScholarOrange" },
    diffNewFile = { link = "ScholarYellow" },
    diffOldFile = { link = "ScholarOrange" },
    diffLine = { link = "ScholarBlue" },
    diffIndexLine = { link = "diffChanged" },
    NavicIconsFile = { link = "ScholarBlue" },
    NavicIconsModule = { link = "ScholarOrange" },
    NavicIconsNamespace = { link = "ScholarBlue" },
    NavicIconsPackage = { link = "ScholarAqua" },
    NavicIconsClass = { link = "ScholarYellow" },
    NavicIconsMethod = { link = "ScholarBlue" },
    NavicIconsProperty = { link = "ScholarAqua" },
    NavicIconsField = { link = "ScholarPurple" },
    NavicIconsConstructor = { link = "ScholarBlue" },
    NavicIconsEnum = { link = "ScholarPurple" },
    NavicIconsInterface = { link = "ScholarGreen" },
    NavicIconsFunction = { link = "ScholarBlue" },
    NavicIconsVariable = { link = "ScholarPurple" },
    NavicIconsConstant = { link = "ScholarOrange" },
    NavicIconsString = { link = "ScholarGreen" },
    NavicIconsNumber = { link = "ScholarOrange" },
    NavicIconsBoolean = { link = "ScholarOrange" },
    NavicIconsArray = { link = "ScholarOrange" },
    NavicIconsObject = { link = "ScholarOrange" },
    NavicIconsKey = { link = "ScholarAqua" },
    NavicIconsNull = { link = "ScholarOrange" },
    NavicIconsEnumMember = { link = "ScholarYellow" },
    NavicIconsStruct = { link = "ScholarPurple" },
    NavicIconsEvent = { link = "ScholarYellow" },
    NavicIconsOperator = { link = "ScholarRed" },
    NavicIconsTypeParameter = { link = "ScholarRed" },
    NavicText = { link = "ScholarWhite" },
    NavicSeparator = { link = "ScholarWhite" },
    htmlTag = { link = "ScholarAquaBold" },
    htmlEndTag = { link = "ScholarAquaBold" },
    htmlTagName = { link = "ScholarBlue" },
    htmlArg = { link = "ScholarOrange" },
    htmlTagN = { link = "ScholarFg1" },
    htmlSpecialTagName = { link = "ScholarBlue" },
    htmlLink = { fg = colors.fg4, underline = config.underline },
    htmlSpecialChar = { link = "ScholarRed" },
    htmlBold = { fg = colors.fg0, bg = colors.bg0, bold = config.bold },
    htmlBoldUnderline = { fg = colors.fg0, bg = colors.bg0, bold = config.bold, underline = config.underline },
    htmlBoldItalic = { fg = colors.fg0, bg = colors.bg0, bold = config.bold, italic = true },
    htmlBoldUnderlineItalic = {
      fg = colors.fg0,
      bg = colors.bg0,
      bold = config.bold,
      italic = true,
      underline = config.underline,
    },
    htmlUnderline = { fg = colors.fg0, bg = colors.bg0, underline = config.underline },
    htmlUnderlineItalic = {
      fg = colors.fg0,
      bg = colors.bg0,
      italic = true,
      underline = config.underline,
    },
    htmlItalic = { fg = colors.fg0, bg = colors.bg0, italic = true },
    xmlTag = { link = "ScholarAquaBold" },
    xmlEndTag = { link = "ScholarAquaBold" },
    xmlTagName = { link = "ScholarBlue" },
    xmlEqual = { link = "ScholarBlue" },
    docbkKeyword = { link = "ScholarAquaBold" },
    xmlDocTypeDecl = { link = "ScholarGray" },
    xmlDocTypeKeyword = { link = "ScholarPurple" },
    xmlCdataStart = { link = "ScholarGray" },
    xmlCdataCdata = { link = "ScholarPurple" },
    dtdFunction = { link = "ScholarGray" },
    dtdTagName = { link = "ScholarPurple" },
    xmlAttrib = { link = "ScholarOrange" },
    xmlProcessingDelim = { link = "ScholarGray" },
    dtdParamEntityPunct = { link = "ScholarGray" },
    dtdParamEntityDPunct = { link = "ScholarGray" },
    xmlAttribPunct = { link = "ScholarGray" },
    xmlEntity = { link = "ScholarRed" },
    xmlEntityPunct = { link = "ScholarRed" },
    clojureKeyword = { link = "ScholarBlue" },
    clojureCond = { link = "ScholarOrange" },
    clojureSpecial = { link = "ScholarOrange" },
    clojureDefine = { link = "ScholarOrange" },
    clojureFunc = { link = "ScholarYellow" },
    clojureRepeat = { link = "ScholarYellow" },
    clojureCharacter = { link = "ScholarAqua" },
    clojureStringEscape = { link = "ScholarAqua" },
    clojureException = { link = "ScholarRed" },
    clojureRegexp = { link = "ScholarAqua" },
    clojureRegexpEscape = { link = "ScholarAqua" },
    clojureRegexpCharClass = { fg = colors.fg3, bold = config.bold },
    clojureRegexpMod = { link = "clojureRegexpCharClass" },
    clojureRegexpQuantifier = { link = "clojureRegexpCharClass" },
    clojureParen = { link = "ScholarFg3" },
    clojureAnonArg = { link = "ScholarYellow" },
    clojureVariable = { link = "ScholarBlue" },
    clojureMacro = { link = "ScholarOrange" },
    clojureMeta = { link = "ScholarYellow" },
    clojureDeref = { link = "ScholarYellow" },
    clojureQuote = { link = "ScholarYellow" },
    clojureUnquote = { link = "ScholarYellow" },
    cOperator = { link = "ScholarPurple" },
    cppOperator = { link = "ScholarPurple" },
    cStructure = { link = "ScholarOrange" },
    pythonBuiltin = { link = "ScholarOrange" },
    pythonBuiltinObj = { link = "ScholarOrange" },
    pythonBuiltinFunc = { link = "ScholarOrange" },
    pythonFunction = { link = "ScholarAqua" },
    pythonDecorator = { link = "ScholarRed" },
    pythonInclude = { link = "ScholarBlue" },
    pythonImport = { link = "ScholarBlue" },
    pythonRun = { link = "ScholarBlue" },
    pythonCoding = { link = "ScholarBlue" },
    pythonOperator = { link = "ScholarRed" },
    pythonException = { link = "ScholarRed" },
    pythonExceptions = { link = "ScholarPurple" },
    pythonBoolean = { link = "ScholarPurple" },
    pythonDot = { link = "ScholarFg3" },
    pythonConditional = { link = "ScholarRed" },
    pythonRepeat = { link = "ScholarRed" },
    pythonDottedName = { link = "ScholarGreenBold" },
    cssBraces = { link = "ScholarBlue" },
    cssFunctionName = { link = "ScholarYellow" },
    cssIdentifier = { link = "ScholarOrange" },
    cssClassName = { link = "ScholarGreen" },
    cssColor = { link = "ScholarBlue" },
    cssSelectorOp = { link = "ScholarBlue" },
    cssSelectorOp2 = { link = "ScholarBlue" },
    cssImportant = { link = "ScholarGreen" },
    cssVendor = { link = "ScholarFg1" },
    cssTextProp = { link = "ScholarAqua" },
    cssAnimationProp = { link = "ScholarAqua" },
    cssUIProp = { link = "ScholarYellow" },
    cssTransformProp = { link = "ScholarAqua" },
    cssTransitionProp = { link = "ScholarAqua" },
    cssPrintProp = { link = "ScholarAqua" },
    cssPositioningProp = { link = "ScholarYellow" },
    cssBoxProp = { link = "ScholarAqua" },
    cssFontDescriptorProp = { link = "ScholarAqua" },
    cssFlexibleBoxProp = { link = "ScholarAqua" },
    cssBorderOutlineProp = { link = "ScholarAqua" },
    cssBackgroundProp = { link = "ScholarAqua" },
    cssMarginProp = { link = "ScholarAqua" },
    cssListProp = { link = "ScholarAqua" },
    cssTableProp = { link = "ScholarAqua" },
    cssFontProp = { link = "ScholarAqua" },
    cssPaddingProp = { link = "ScholarAqua" },
    cssDimensionProp = { link = "ScholarAqua" },
    cssRenderProp = { link = "ScholarAqua" },
    cssColorProp = { link = "ScholarAqua" },
    cssGeneratedContentProp = { link = "ScholarAqua" },
    javaScriptBraces = { link = "ScholarFg1" },
    javaScriptFunction = { link = "ScholarAqua" },
    javaScriptIdentifier = { link = "ScholarRed" },
    javaScriptMember = { link = "ScholarBlue" },
    javaScriptNumber = { link = "ScholarPurple" },
    javaScriptNull = { link = "ScholarPurple" },
    javaScriptParens = { link = "ScholarFg3" },
    typescriptReserved = { link = "ScholarAqua" },
    typescriptLabel = { link = "ScholarAqua" },
    typescriptFuncKeyword = { link = "ScholarAqua" },
    typescriptIdentifier = { link = "ScholarOrange" },
    typescriptBraces = { link = "ScholarFg1" },
    typescriptEndColons = { link = "ScholarFg1" },
    typescriptDOMObjects = { link = "ScholarFg1" },
    typescriptAjaxMethods = { link = "ScholarFg1" },
    typescriptLogicSymbols = { link = "ScholarFg1" },
    typescriptDocSeeTag = { link = "Comment" },
    typescriptDocParam = { link = "Comment" },
    typescriptDocTags = { link = "vimCommentTitle" },
    typescriptGlobalObjects = { link = "ScholarFg1" },
    typescriptParens = { link = "ScholarFg3" },
    typescriptOpSymbols = { link = "ScholarFg3" },
    typescriptHtmlElemProperties = { link = "ScholarFg1" },
    typescriptNull = { link = "ScholarPurple" },
    typescriptInterpolationDelimiter = { link = "ScholarAqua" },
    purescriptModuleKeyword = { link = "ScholarAqua" },
    purescriptModuleName = { link = "ScholarFg1" },
    purescriptWhere = { link = "ScholarAqua" },
    purescriptDelimiter = { link = "ScholarFg4" },
    purescriptType = { link = "ScholarFg1" },
    purescriptImportKeyword = { link = "ScholarAqua" },
    purescriptHidingKeyword = { link = "ScholarAqua" },
    purescriptAsKeyword = { link = "ScholarAqua" },
    purescriptStructure = { link = "ScholarAqua" },
    purescriptOperator = { link = "ScholarBlue" },
    purescriptTypeVar = { link = "ScholarFg1" },
    purescriptConstructor = { link = "ScholarFg1" },
    purescriptFunction = { link = "ScholarFg1" },
    purescriptConditional = { link = "ScholarOrange" },
    purescriptBacktick = { link = "ScholarOrange" },
    coffeeExtendedOp = { link = "ScholarFg3" },
    coffeeSpecialOp = { link = "ScholarFg3" },
    coffeeCurly = { link = "ScholarOrange" },
    coffeeParen = { link = "ScholarFg3" },
    coffeeBracket = { link = "ScholarOrange" },
    rubyStringDelimiter = { link = "ScholarGreen" },
    rubyInterpolationDelimiter = { link = "ScholarAqua" },
    rubyDefinedOperator = { link = "rubyKeyword" },
    objcTypeModifier = { link = "ScholarRed" },
    objcDirective = { link = "ScholarBlue" },
    goDirective = { link = "ScholarAqua" },
    goConstants = { link = "ScholarPurple" },
    goDeclaration = { link = "ScholarRed" },
    goDeclType = { link = "ScholarBlue" },
    goBuiltins = { link = "ScholarOrange" },
    luaIn = { link = "ScholarRed" },
    luaFunction = { link = "ScholarAqua" },
    luaTable = { link = "ScholarOrange" },
    moonSpecialOp = { link = "ScholarFg3" },
    moonExtendedOp = { link = "ScholarFg3" },
    moonFunction = { link = "ScholarFg3" },
    moonObject = { link = "ScholarYellow" },
    javaAnnotation = { link = "ScholarBlue" },
    javaDocTags = { link = "ScholarAqua" },
    javaCommentTitle = { link = "vimCommentTitle" },
    javaParen = { link = "ScholarFg3" },
    javaParen1 = { link = "ScholarFg3" },
    javaParen2 = { link = "ScholarFg3" },
    javaParen3 = { link = "ScholarFg3" },
    javaParen4 = { link = "ScholarFg3" },
    javaParen5 = { link = "ScholarFg3" },
    javaOperator = { link = "ScholarOrange" },
    javaVarArg = { link = "ScholarGreen" },
    elixirDocString = { link = "Comment" },
    elixirStringDelimiter = { link = "ScholarGreen" },
    elixirInterpolationDelimiter = { link = "ScholarAqua" },
    elixirModuleDeclaration = { link = "ScholarYellow" },
    scalaNameDefinition = { link = "ScholarFg1" },
    scalaCaseFollowing = { link = "ScholarFg1" },
    scalaCapitalWord = { link = "ScholarFg1" },
    scalaTypeExtension = { link = "ScholarFg1" },
    scalaKeyword = { link = "ScholarRed" },
    scalaKeywordModifier = { link = "ScholarRed" },
    scalaSpecial = { link = "ScholarAqua" },
    scalaOperator = { link = "ScholarFg1" },
    scalaTypeDeclaration = { link = "ScholarYellow" },
    scalaTypeTypePostDeclaration = { link = "ScholarYellow" },
    scalaInstanceDeclaration = { link = "ScholarFg1" },
    scalaInterpolation = { link = "ScholarAqua" },
    markdownItalic = { fg = colors.fg3, italic = true },
    markdownBold = { fg = colors.fg3, bold = config.bold },
    markdownBoldItalic = { fg = colors.fg3, bold = config.bold, italic = true },
    markdownH1 = { link = "ScholarGreenBold" },
    markdownH2 = { link = "ScholarGreenBold" },
    markdownH3 = { link = "ScholarYellowBold" },
    markdownH4 = { link = "ScholarYellowBold" },
    markdownH5 = { link = "ScholarYellow" },
    markdownH6 = { link = "ScholarYellow" },
    markdownCode = { link = "ScholarAqua" },
    markdownCodeBlock = { link = "ScholarAqua" },
    markdownCodeDelimiter = { link = "ScholarAqua" },
    markdownBlockquote = { link = "ScholarGray" },
    markdownListMarker = { link = "ScholarGray" },
    markdownOrderedListMarker = { link = "ScholarGray" },
    markdownRule = { link = "ScholarGray" },
    markdownHeadingRule = { link = "ScholarGray" },
    markdownUrlDelimiter = { link = "ScholarFg3" },
    markdownLinkDelimiter = { link = "ScholarFg3" },
    markdownLinkTextDelimiter = { link = "ScholarFg3" },
    markdownHeadingDelimiter = { link = "ScholarOrange" },
    markdownUrl = { link = "ScholarPurple" },
    markdownUrlTitleDelimiter = { link = "ScholarGreen" },
    markdownLinkText = { fg = colors.gray, underline = config.underline },
    markdownIdDeclaration = { link = "markdownLinkText" },
    haskellType = { link = "ScholarBlue" },
    haskellIdentifier = { link = "ScholarAqua" },
    haskellSeparator = { link = "ScholarFg4" },
    haskellDelimiter = { link = "ScholarOrange" },
    haskellOperators = { link = "ScholarPurple" },
    haskellBacktick = { link = "ScholarOrange" },
    haskellStatement = { link = "ScholarPurple" },
    haskellConditional = { link = "ScholarPurple" },
    haskellLet = { link = "ScholarRed" },
    haskellDefault = { link = "ScholarRed" },
    haskellWhere = { link = "ScholarRed" },
    haskellBottom = { link = "ScholarRedBold" },
    haskellImportKeywords = { link = "ScholarPurpleBold" },
    haskellDeclKeyword = { link = "ScholarOrange" },
    haskellDecl = { link = "ScholarOrange" },
    haskellDeriving = { link = "ScholarPurple" },
    haskellAssocType = { link = "ScholarAqua" },
    haskellNumber = { link = "ScholarAqua" },
    haskellPragma = { link = "ScholarRedBold" },
    haskellTH = { link = "ScholarAquaBold" },
    haskellForeignKeywords = { link = "ScholarGreen" },
    haskellKeyword = { link = "ScholarRed" },
    haskellFloat = { link = "ScholarAqua" },
    haskellInfix = { link = "ScholarPurple" },
    haskellQuote = { link = "ScholarGreenBold" },
    haskellShebang = { link = "ScholarYellowBold" },
    haskellLiquid = { link = "ScholarPurpleBold" },
    haskellQuasiQuoted = { link = "ScholarBlueBold" },
    haskellRecursiveDo = { link = "ScholarPurple" },
    haskellQuotedType = { link = "ScholarRed" },
    haskellPreProc = { link = "ScholarFg4" },
    haskellTypeRoles = { link = "ScholarRedBold" },
    haskellTypeForall = { link = "ScholarRed" },
    haskellPatternKeyword = { link = "ScholarBlue" },
    jsonKeyword = { link = "ScholarGreen" },
    jsonQuote = { link = "ScholarGreen" },
    jsonBraces = { link = "ScholarFg1" },
    jsonString = { link = "ScholarFg1" },
    mailQuoted1 = { link = "ScholarAqua" },
    mailQuoted2 = { link = "ScholarPurple" },
    mailQuoted3 = { link = "ScholarYellow" },
    mailQuoted4 = { link = "ScholarGreen" },
    mailQuoted5 = { link = "ScholarRed" },
    mailQuoted6 = { link = "ScholarOrange" },
    mailSignature = { link = "Comment" },
    csBraces = { link = "ScholarFg1" },
    csEndColon = { link = "ScholarFg1" },
    csLogicSymbols = { link = "ScholarFg1" },
    csParens = { link = "ScholarFg3" },
    csOpSymbols = { link = "ScholarFg3" },
    csInterpolationDelimiter = { link = "ScholarFg3" },
    csInterpolationAlignDel = { link = "ScholarAquaBold" },
    csInterpolationFormat = { link = "ScholarAqua" },
    csInterpolationFormatDel = { link = "ScholarAquaBold" },
    rustSigil = { link = "ScholarOrange" },
    rustEscape = { link = "ScholarAqua" },
    rustStringContinuation = { link = "ScholarAqua" },
    rustEnum = { link = "ScholarAqua" },
    rustStructure = { link = "ScholarAqua" },
    rustModPathSep = { link = "ScholarFg2" },
    rustCommentLineDoc = { link = "Comment" },
    rustDefault = { link = "ScholarAqua" },
    ocamlOperator = { link = "ScholarFg1" },
    ocamlKeyChar = { link = "ScholarOrange" },
    ocamlArrow = { link = "ScholarOrange" },
    ocamlInfixOpKeyword = { link = "ScholarRed" },
    ocamlConstructor = { link = "ScholarOrange" },
    LspSagaCodeActionTitle = { link = "Title" },
    LspSagaCodeActionBorder = { link = "ScholarFg1" },
    LspSagaCodeActionContent = { fg = colors.green, bold = config.bold },
    LspSagaLspFinderBorder = { link = "ScholarFg1" },
    LspSagaAutoPreview = { link = "ScholarOrange" },
    TargetWord = { fg = colors.blue, bold = config.bold },
    FinderSeparator = { link = "ScholarAqua" },
    LspSagaDefPreviewBorder = { link = "ScholarBlue" },
    LspSagaHoverBorder = { link = "ScholarOrange" },
    LspSagaRenameBorder = { link = "ScholarBlue" },
    LspSagaDiagnosticSource = { link = "ScholarOrange" },
    LspSagaDiagnosticBorder = { link = "ScholarPurple" },
    LspSagaDiagnosticHeader = { link = "ScholarGreen" },
    LspSagaSignatureHelpBorder = { link = "ScholarGreen" },
    SagaShadow = { link = "ScholarBg0" },
    DashboardShortCut = { link = "ScholarOrange" },
    DashboardHeader = { link = "ScholarAqua" },
    DashboardCenter = { link = "ScholarYellow" },
    DashboardFooter = { fg = colors.purple, italic = true },
    MasonHighlight = { link = "ScholarAqua" },
    MasonHighlightBlock = { fg = colors.bg0, bg = colors.blue },
    MasonHighlightBlockBold = { fg = colors.bg0, bg = colors.blue, bold = true },
    MasonHighlightSecondary = { fg = colors.yellow },
    MasonHighlightBlockSecondary = { fg = colors.bg0, bg = colors.yellow },
    MasonHighlightBlockBoldSecondary = { fg = colors.bg0, bg = colors.yellow, bold = true },
    MasonHeader = { link = "MasonHighlightBlockBoldSecondary" },
    MasonHeaderSecondary = { link = "MasonHighlightBlockBold" },
    MasonMuted = { fg = colors.fg4 },
    MasonMutedBlock = { fg = colors.bg0, bg = colors.fg4 },
    MasonMutedBlockBold = { fg = colors.bg0, bg = colors.fg4, bold = true },
    LspInlayHint = { link = "comment" },
    CarbonFile = { link = "ScholarFg1" },
    CarbonExe = { link = "ScholarYellow" },
    CarbonSymlink = { link = "ScholarAqua" },
    CarbonBrokenSymlink = { link = "ScholarRed" },
    CarbonIndicator = { link = "ScholarGray" },
    CarbonDanger = { link = "ScholarRed" },
    CarbonPending = { link = "ScholarYellow" },
    NoiceCursor = { link = "TermCursor" },
    NoiceCmdlinePopupBorder = { fg = colors.blue, bg = nil },
    NoiceCmdlineIcon = { link = "NoiceCmdlinePopupBorder" },
    NoiceConfirmBorder = { link = "NoiceCmdlinePopupBorder" },
    NoiceCmdlinePopupBorderSearch = { fg = colors.yellow, bg = nil },
    NoiceCmdlineIconSearch = { link = "NoiceCmdlinePopupBorderSearch" },
    NotifyDEBUGBorder = { link = "ScholarBlue" },
    NotifyDEBUGIcon = { link = "ScholarBlue" },
    NotifyDEBUGTitle = { link = "ScholarBlue" },
    NotifyERRORBorder = { link = "ScholarRed" },
    NotifyERRORIcon = { link = "ScholarRed" },
    NotifyERRORTitle = { link = "ScholarRed" },
    NotifyINFOBorder = { link = "ScholarAqua" },
    NotifyINFOIcon = { link = "ScholarAqua" },
    NotifyINFOTitle = { link = "ScholarAqua" },
    NotifyTRACEBorder = { link = "ScholarGreen" },
    NotifyTRACEIcon = { link = "ScholarGreen" },
    NotifyTRACETitle = { link = "ScholarGreen" },
    NotifyWARNBorder = { link = "ScholarYellow" },
    NotifyWARNIcon = { link = "ScholarYellow" },
    NotifyWARNTitle = { link = "ScholarYellow" },
    IlluminatedWordText = { link = "LspReferenceText" },
    IlluminatedWordRead = { link = "LspReferenceRead" },
    IlluminatedWordWrite = { link = "LspReferenceWrite" },
    TSRainbowRed = { fg = colors.red },
    TSRainbowOrange = { fg = colors.orange },
    TSRainbowYellow = { fg = colors.yellow },
    TSRainbowGreen = { fg = colors.green },
    TSRainbowBlue = { fg = colors.blue },
    TSRainbowViolet = { fg = colors.purple },
    TSRainbowCyan = { fg = colors.aqua },
    RainbowDelimiterRed = { fg = colors.red },
    RainbowDelimiterOrange = { fg = colors.orange },
    RainbowDelimiterYellow = { fg = colors.yellow },
    RainbowDelimiterGreen = { fg = colors.green },
    RainbowDelimiterBlue = { fg = colors.blue },
    RainbowDelimiterViolet = { fg = colors.purple },
    RainbowDelimiterCyan = { fg = colors.aqua },
    DapBreakpointSymbol = { fg = colors.red, bg = colors.bg1 },
    DapStoppedSymbol = { fg = colors.green, bg = colors.bg1 },
    DapUIBreakpointsCurrentLine = { link = "ScholarYellow" },
    DapUIBreakpointsDisabledLine = { link = "ScholarGray" },
    DapUIBreakpointsInfo = { link = "ScholarAqua" },
    DapUIBreakpointsLine = { link = "ScholarYellow" },
    DapUIBreakpointsPath = { link = "ScholarBlue" },
    DapUICurrentFrameName = { link = "ScholarPurple" },
    DapUIDecoration = { link = "ScholarPurple" },
    DapUIEndofBuffer = { link = "EndOfBuffer" },
    DapUIFloatBorder = { link = "ScholarAqua" },
    DapUILineNumber = { link = "ScholarYellow" },
    DapUIModifiedValue = { link = "ScholarRed" },
    DapUIPlayPause = { fg = colors.green, bg = colors.bg1 },
    DapUIRestart = { fg = colors.green, bg = colors.bg1 },
    DapUIScope = { link = "ScholarBlue" },
    DapUISource = { link = "ScholarFg1" },
    DapUIStepBack = { fg = colors.blue, bg = colors.bg1 },
    DapUIStepInto = { fg = colors.blue, bg = colors.bg1 },
    DapUIStepOut = { fg = colors.blue, bg = colors.bg1 },
    DapUIStepOver = { fg = colors.blue, bg = colors.bg1 },
    DapUIStop = { fg = colors.red, bg = colors.bg1 },
    DapUIStoppedThread = { link = "ScholarBlue" },
    DapUIThread = { link = "ScholarBlue" },
    DapUIType = { link = "ScholarOrange" },
    DapUIUnavailable = { link = "ScholarGray" },
    DapUIWatchesEmpty = { link = "ScholarGray" },
    DapUIWatchesError = { link = "ScholarRed" },
    DapUIWatchesValue = { link = "ScholarYellow" },
    DapUIWinSelect = { link = "ScholarYellow" },
    NeogitDiffDelete = { link = "DiffDelete" },
    NeogitDiffAdd = { link = "DiffAdd" },
    NeogitHunkHeader = { link = "WinBar" },
    NeogitHunkHeaderHighlight = { link = "WinBarNC" },
    DiffviewStatusModified = { link = "ScholarGreenBold" },
    DiffviewFilePanelInsertions = { link = "ScholarGreenBold" },
    DiffviewFilePanelDeletions = { link = "ScholarRedBold" },
    MiniAnimateCursor = { reverse = true, nocombine = true },
    MiniAnimateNormalFloat = { fg = colors.fg1, bg = colors.bg1 },
    MiniClueBorder = { link = "FloatBorder" },
    MiniClueDescGroup = { link = "DiagnosticFloatingWarn" },
    MiniClueDescSingle = { link = "NormalFloat" },
    MiniClueNextKey = { link = "DiagnosticFloatingHint" },
    MiniClueNextKeyWithPostkeys = { link = "DiagnosticFloatingError" },
    MiniClueSeparator = { link = "DiagnosticFloatingInfo" },
    MiniClueTitle = { link = "FloatTitle" },
    MiniCompletionActiveParameter = { underline = true },
    MiniCursorword = { underline = true },
    MiniCursorwordCurrent = { underline = true },
    MiniDepsChangeAdded = { link = "ScholarGreen" },
    MiniDepsChangeRemoved = { link = "ScholarRed" },
    MiniDepsHint = { link = "DiagnosticHint" },
    MiniDepsInfo = { link = "DiagnosticInfo" },
    MiniDepsMsgBreaking = { link = "DiagnosticWarn" },
    MiniDepsPlaceholder = { link = "Comment" },
    MiniDepsTitle = { link = "Title" },
    MiniDepsTitleError = { link = "DiffDelete" },
    MiniDepsTitleSame = { link = "DiffChange" },
    MiniDepsTitleUpdate = { link = "DiffAdd" },
    MiniDiffOverAdd = { link = "DiffAdd" },
    MiniDiffOverChange = { link = "DiffText" },
    MiniDiffOverContext = { link = "DiffChange" },
    MiniDiffOverDelete = { link = "DiffDelete" },
    MiniDiffSignAdd = { link = "ScholarGreen" },
    MiniDiffSignChange = { link = "ScholarAqua" },
    MiniDiffSignDelete = { link = "ScholarRed" },
    MiniFilesBorder = { link = "FloatBorder" },
    MiniFilesBorderModified = { link = "DiagnosticFloatingWarn" },
    MiniFilesCursorLine = { bg = colors.bg2 },
    MiniFilesDirectory = { link = "Directory" },
    MiniFilesFile = { link = "ScholarFg1" },
    MiniFilesNormal = { link = "NormalFloat" },
    MiniFilesTitle = { link = "FloatTitle" },
    MiniFilesTitleFocused = { link = "ScholarOrangeBold" },
    MiniHipatternsFixme = { fg = colors.bg0, bg = colors.red, bold = config.bold },
    MiniHipatternsHack = { fg = colors.bg0, bg = colors.yellow, bold = config.bold },
    MiniHipatternsNote = { fg = colors.bg0, bg = colors.blue, bold = config.bold },
    MiniHipatternsTodo = { fg = colors.bg0, bg = colors.aqua, bold = config.bold },
    MiniIconsAzure = { link = "ScholarBlue" },
    MiniIconsBlue = { link = "ScholarBlue" },
    MiniIconsCyan = { link = "ScholarAqua" },
    MiniIconsGreen = { link = "ScholarGreen" },
    MiniIconsGrey = { link = "ScholarFg0" },
    MiniIconsOrange = { link = "ScholarOrange" },
    MiniIconsPurple = { link = "ScholarPurple" },
    MiniIconsRed = { link = "ScholarRed" },
    MiniIconsYellow = { link = "ScholarYellow" },
    MiniIndentscopeSymbol = { link = "ScholarGray" },
    MiniIndentscopeSymbolOff = { link = "ScholarYellow" },
    MiniJump = { link = "ScholarOrangeUnderline" },
    MiniJump2dDim = { link = "ScholarGray" },
    MiniJump2dSpot = { fg = colors.orange, bold = config.bold, nocombine = true },
    MiniJump2dSpotAhead = { fg = colors.aqua, bg = colors.bg0, nocombine = true },
    MiniJump2dSpotUnique = { fg = colors.yellow, bold = config.bold, nocombine = true },
    MiniMapNormal = { link = "NormalFloat" },
    MiniMapSymbolCount = { link = "Special" },
    MiniMapSymbolLine = { link = "Title" },
    MiniMapSymbolView = { link = "Delimiter" },
    MiniNotifyBorder = { link = "FloatBorder" },
    MiniNotifyNormal = { link = "NormalFloat" },
    MiniNotifyTitle = { link = "FloatTitle" },
    MiniOperatorsExchangeFrom = { link = "IncSearch" },
    MiniPickBorder = { link = "FloatBorder" },
    MiniPickBorderBusy = { link = "DiagnosticFloatingWarn" },
    MiniPickBorderText = { link = "FloatTitle" },
    MiniPickIconDirectory = { link = "Directory" },
    MiniPickIconFile = { link = "MiniPickNormal" },
    MiniPickHeader = { link = "DiagnosticFloatingHint" },
    MiniPickMatchCurrent = { bg = colors.bg2 },
    MiniPickMatchMarked = { link = "Visual" },
    MiniPickMatchRanges = { link = "DiagnosticFloatingHint" },
    MiniPickNormal = { link = "NormalFloat" },
    MiniPickPreviewLine = { link = "CursorLine" },
    MiniPickPreviewRegion = { link = "IncSearch" },
    MiniPickPrompt = { link = "DiagnosticFloatingInfo" },
    MiniStarterCurrent = { nocombine = true },
    MiniStarterFooter = { link = "ScholarGray" },
    MiniStarterHeader = { link = "Title" },
    MiniStarterInactive = { link = "Comment" },
    MiniStarterItem = { link = "Normal" },
    MiniStarterItemBullet = { link = "Delimiter" },
    MiniStarterItemPrefix = { link = "WarningMsg" },
    MiniStarterSection = { link = "Delimiter" },
    MiniStarterQuery = { link = "MoreMsg" },
    MiniStatuslineDevinfo = { link = "StatusLine" },
    MiniStatuslineFileinfo = { link = "StatusLine" },
    MiniStatuslineFilename = { link = "StatusLineNC" },
    MiniStatuslineInactive = { link = "StatusLineNC" },
    MiniStatuslineModeCommand = { fg = colors.bg0, bg = colors.yellow, bold = config.bold, nocombine = true },
    MiniStatuslineModeInsert = { fg = colors.bg0, bg = colors.blue, bold = config.bold, nocombine = true },
    MiniStatuslineModeNormal = { fg = colors.bg0, bg = colors.fg1, bold = config.bold, nocombine = true },
    MiniStatuslineModeOther = { fg = colors.bg0, bg = colors.aqua, bold = config.bold, nocombine = true },
    MiniStatuslineModeReplace = { fg = colors.bg0, bg = colors.red, bold = config.bold, nocombine = true },
    MiniStatuslineModeVisual = { fg = colors.bg0, bg = colors.green, bold = config.bold, nocombine = true },
    MiniSurround = { link = "IncSearch" },
    MiniTablineCurrent = { fg = colors.green, bg = colors.bg1, bold = config.bold, reverse = config.invert_tabline },
    MiniTablineFill = { link = "TabLineFill" },
    MiniTablineHidden = { fg = colors.bg4, bg = colors.bg1, reverse = config.invert_tabline },
    MiniTablineModifiedCurrent = {
      fg = colors.bg1,
      bg = colors.green,
      bold = config.bold,
      reverse = config.invert_tabline,
    },
    MiniTablineModifiedHidden = { fg = colors.bg1, bg = colors.bg4, reverse = config.invert_tabline },
    MiniTablineModifiedVisible = { fg = colors.bg1, bg = colors.fg1, reverse = config.invert_tabline },
    MiniTablineTabpagesection = { link = "Search" },
    MiniTablineVisible = { fg = colors.fg1, bg = colors.bg1, reverse = config.invert_tabline },
    MiniTestEmphasis = { bold = config.bold },
    MiniTestFail = { link = "ScholarRedBold" },
    MiniTestPass = { link = "ScholarGreenBold" },
    MiniTrailspace = { bg = colors.red },
    WhichKeyTitle = { link = "NormalFloat" },
    NeoTreeFloatBorder = { link = "ScholarGray" },
    NeoTreeTitleBar = { fg = colors.fg1, bg = colors.bg2 },
    NeoTreeDirectoryIcon = { link = "ScholarGreen" },
    NeoTreeDirectoryName = { link = "ScholarGreenBold" },
    ["@comment"] = { link = "Comment" },
    ["@none"] = { bg = "NONE", fg = "NONE" },
    ["@preproc"] = { link = "PreProc" },
    ["@define"] = { link = "Define" },
    ["@operator"] = { link = "Operator" },
    ["@punctuation.delimiter"] = { link = "Delimiter" },
    ["@punctuation.bracket"] = { link = "Delimiter" },
    ["@punctuation.special"] = { link = "Delimiter" },
    ["@string"] = { link = "String" },
    ["@string.regex"] = { link = "String" },
    ["@string.regexp"] = { link = "String" },
    ["@string.escape"] = { link = "SpecialChar" },
    ["@string.special"] = { link = "SpecialChar" },
    ["@string.special.path"] = { link = "Underlined" },
    ["@string.special.symbol"] = { link = "Identifier" },
    ["@string.special.url"] = { link = "Underlined" },
    ["@character"] = { link = "Character" },
    ["@character.special"] = { link = "SpecialChar" },
    ["@boolean"] = { link = "Boolean" },
    ["@number"] = { link = "Number" },
    ["@number.float"] = { link = "Float" },
    ["@float"] = { link = "Float" },
    ["@function"] = { link = "Function" },
    ["@function.builtin"] = { link = "Special" },
    ["@function.call"] = { link = "Function" },
    ["@function.macro"] = { link = "Macro" },
    ["@function.method"] = { link = "Function" },
    ["@method"] = { link = "Function" },
    ["@method.call"] = { link = "Function" },
    ["@constructor"] = { link = "Special" },
    ["@parameter"] = { link = "Identifier" },
    ["@keyword"] = { link = "Keyword" },
    ["@keyword.conditional"] = { link = "Conditional" },
    ["@keyword.debug"] = { link = "Debug" },
    ["@keyword.directive"] = { link = "PreProc" },
    ["@keyword.directive.define"] = { link = "Define" },
    ["@keyword.exception"] = { link = "Exception" },
    ["@keyword.function"] = { link = "Keyword" },
    ["@keyword.import"] = { link = "Include" },
    ["@keyword.operator"] = { link = "ScholarRed" },
    ["@keyword.repeat"] = { link = "Repeat" },
    ["@keyword.return"] = { link = "Keyword" },
    ["@keyword.storage"] = { link = "StorageClass" },
    ["@conditional"] = { link = "Conditional" },
    ["@repeat"] = { link = "Repeat" },
    ["@debug"] = { link = "Debug" },
    ["@label"] = { link = "Label" },
    ["@include"] = { link = "Include" },
    ["@exception"] = { link = "Exception" },
    ["@type"] = { link = "Type" },
    ["@type.builtin"] = { link = "Type" },
    ["@type.definition"] = { link = "Typedef" },
    ["@type.qualifier"] = { link = "Type" },
    ["@storageclass"] = { link = "StorageClass" },
    ["@attribute"] = { link = "PreProc" },
    ["@field"] = { link = "Identifier" },
    ["@property"] = { link = "Identifier" },
    ["@variable"] = { link = "ScholarFg1" },
    ["@variable.builtin"] = { link = "Special" },
    ["@variable.member"] = { link = "Identifier" },
    ["@variable.parameter"] = { link = "Identifier" },
    ["@constant"] = { link = "Constant" },
    ["@constant.builtin"] = { link = "Special" },
    ["@constant.macro"] = { link = "Define" },
    ["@markup"] = { link = "ScholarFg1" },
    ["@markup.strong"] = { bold = config.bold },
    ["@markup.italic"] = { link = "@text.emphasis" },
    ["@markup.underline"] = { underline = config.underline },
    ["@markup.strikethrough"] = { strikethrough = config.strikethrough },
    ["@markup.heading"] = { link = "Title" },
    ["@markup.raw"] = { link = "String" },
    ["@markup.math"] = { link = "Special" },
    ["@markup.environment"] = { link = "Macro" },
    ["@markup.environment.name"] = { link = "Type" },
    ["@markup.link"] = { link = "Underlined" },
    ["@markup.link.label"] = { link = "SpecialChar" },
    ["@markup.list"] = { link = "Delimiter" },
    ["@markup.list.checked"] = { link = "ScholarGreen" },
    ["@markup.list.unchecked"] = { link = "ScholarGray" },
    ["@comment.todo"] = { link = "Todo" },
    ["@comment.note"] = { link = "SpecialComment" },
    ["@comment.warning"] = { link = "WarningMsg" },
    ["@comment.error"] = { link = "ErrorMsg" },
    ["@diff.plus"] = { link = "diffAdded" },
    ["@diff.minus"] = { link = "diffRemoved" },
    ["@diff.delta"] = { link = "diffChanged" },
    ["@module"] = { link = "ScholarFg1" },
    ["@namespace"] = { link = "ScholarFg1" },
    ["@symbol"] = { link = "Identifier" },
    ["@text"] = { link = "ScholarFg1" },
    ["@text.strong"] = { bold = config.bold },
    ["@text.emphasis"] = { italic = config.italic.emphasis },
    ["@text.underline"] = { underline = config.underline },
    ["@text.strike"] = { strikethrough = config.strikethrough },
    ["@text.title"] = { link = "Title" },
    ["@text.literal"] = { link = "String" },
    ["@text.uri"] = { link = "Underlined" },
    ["@text.math"] = { link = "Special" },
    ["@text.environment"] = { link = "Macro" },
    ["@text.environment.name"] = { link = "Type" },
    ["@text.reference"] = { link = "Constant" },
    ["@text.todo"] = { link = "Todo" },
    ["@text.todo.checked"] = { link = "ScholarGreen" },
    ["@text.todo.unchecked"] = { link = "ScholarGray" },
    ["@text.note"] = { link = "SpecialComment" },
    ["@text.note.comment"] = { fg = colors.purple, bold = config.bold },
    ["@text.warning"] = { link = "WarningMsg" },
    ["@text.danger"] = { link = "ErrorMsg" },
    ["@text.danger.comment"] = { fg = colors.fg0, bg = colors.red, bold = config.bold },
    ["@text.diff.add"] = { link = "diffAdded" },
    ["@text.diff.delete"] = { link = "diffRemoved" },
    ["@tag"] = { link = "Tag" },
    ["@tag.attribute"] = { link = "Identifier" },
    ["@tag.delimiter"] = { link = "Delimiter" },
    ["@punctuation"] = { link = "Delimiter" },
    ["@macro"] = { link = "Macro" },
    ["@structure"] = { link = "Structure" },
    ["@lsp.type.class"] = { link = "@type" },
    ["@lsp.type.comment"] = { link = "@comment" },
    ["@lsp.type.decorator"] = { link = "@macro" },
    ["@lsp.type.enum"] = { link = "@type" },
    ["@lsp.type.enumMember"] = { link = "@constant" },
    ["@lsp.type.function"] = { link = "@function" },
    ["@lsp.type.interface"] = { link = "@constructor" },
    ["@lsp.type.macro"] = { link = "@macro" },
    ["@lsp.type.method"] = { link = "@method" },
    ["@lsp.type.modifier.java"] = { link = "@keyword.type.java" },
    ["@lsp.type.namespace"] = { link = "@namespace" },
    ["@lsp.type.parameter"] = { link = "@parameter" },
    ["@lsp.type.property"] = { link = "@property" },
    ["@lsp.type.struct"] = { link = "@type" },
    ["@lsp.type.type"] = { link = "@type" },
    ["@lsp.type.typeParameter"] = { link = "@type.definition" },
    ["@lsp.type.variable"] = { link = "@variable" },

    -- NeoTreeDirectoryName = { link = "Directory" },
    -- NeoTreeDotfile = { fg = colors.fg4 },
    -- NeoTreeFadeText1 = { fg = colors.fg3 },
    -- NeoTreeFadeText2 = { fg = colors.fg4 },
    -- NeoTreeFileIcon = { fg = colors.blue },
    -- NeoTreeFileName = { fg = colors.fg1 },
    -- NeoTreeFileNameOpened = { fg = colors.fg1, bold = true },
    -- NeoTreeFileStats = { fg = colors.fg3 },
    -- NeoTreeFileStatsHeader = { fg = colors.fg2, italic = true },
    -- NeoTreeFilterTerm = { link = "SpecialChar" },
    -- NeoTreeHiddenByName = { link = "NeoTreeDotfile" },
    -- NeoTreeIndentMarker = { fg = colors.fg4 },
    -- NeoTreeMessage = { fg = colors.fg3, italic = true },
    -- NeoTreeModified = { fg = colors.yellow },
    -- NeoTreeRootName = { fg = colors.fg1, bold = true, italic = true },
    -- NeoTreeSymbolicLinkTarget = { link = "NeoTreeFileName" },
    -- NeoTreeExpander = { fg = colors.fg4 },
    -- NeoTreeWindowsHidden = { link = "NeoTreeDotfile" },
    -- NeoTreePreview = { link = "Search" },
    -- NeoTreeGitAdded = { link = "GitGutterAdd" },
    -- NeoTreeGitConflict = { fg = colors.orange, bold = true, italic = true },
    -- NeoTreeGitDeleted = { link = "GitGutterDelete" },
    -- NeoTreeGitIgnored = { link = "NeoTreeDotfile" },
    -- NeoTreeGitModified = { link = "GitGutterChange" },
    -- NeoTreeGitRenamed = { link = "NeoTreeGitModified" },
    -- NeoTreeGitStaged = { link = "NeoTreeGitAdded" },
    -- NeoTreeGitUntracked = { fg = colors.orange, italic = true },
    -- NeoTreeGitUnstaged = { link = "NeoTreeGitConflict" },
    -- NeoTreeTabActive = { fg = colors.fg1, bold = true },
    -- NeoTreeTabInactive = { fg = colors.fg4, bg = colors.bg1 },
    -- NeoTreeTabSeparatorActive = { fg = colors.bg1 },
    -- NeoTreeTabSeparatorInactive = { fg = colors.bg2, bg = colors.bg1 },
  }

  for group, hl in pairs(config.overrides) do
    if groups[group] then
      -- "link" should not mix with other configs (:h hi-link)
      groups[group].link = nil
    end

    groups[group] = vim.tbl_extend("force", groups[group] or {}, hl)
  end

  return groups
end

---@param config ScholarConfig?
Scholar.setup = function(config)
  Scholar.config = vim.tbl_deep_extend("force", Scholar.config, config or {})
end

--- main load function
Scholar.load = function()
  if vim.version().minor < 8 then
    vim.notify_once("scholar.nvim: you must use neovim 0.8 or higher")
    return
  end

  -- reset colors
  if vim.g.colors_name then
    vim.cmd.hi("clear")
  end
  vim.g.colors_name = "scholar"
  vim.o.termguicolors = true

  local groups = get_groups()

  -- add highlights
  for group, settings in pairs(groups) do
    vim.api.nvim_set_hl(0, group, settings)
  end
end

return Scholar
