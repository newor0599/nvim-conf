local do_color = false

local BASE_COLOR = "#B1BAB1"
local CONST_COLOR = do_color and "#98B06F" or BASE_COLOR
local FN_COLOR = do_color and "#D33F49" or BASE_COLOR
local VAR_COLOR = do_color and "#E29853" or BASE_COLOR

local BASE = { fg = BASE_COLOR }
local CONST = { fg = CONST_COLOR, italic = true }
local VAR = { fg = VAR_COLOR, underdouble = true }
local FN = { fg = FN_COLOR, bold = true, underdouble = false }
local color = vim.api.nvim_set_hl

-- Defaults
color(0, "@string", CONST)
color(0, "Number", CONST)
color(0, "Constant", CONST)
color(0, "@variable", VAR)
color(0, "@punctuation.bracket", BASE)
color(0, "@punctuation.delimiter", BASE)
color(0, "@punctuation.special", BASE)
color(0, "Operator", BASE)
color(0, "Delimiter", BASE)
color(0, "Identifier", BASE)
color(0, "Function", FN)

-- Neovim
color(0, "Normal", BASE)
color(0, "StatusLine", BASE)
color(0, "LineNr", BASE)
color(0, "Pmenu", BASE)
color(0, "BlinkCmpMenuBorder", BASE)
color(0, "PmenuSel", vim.tbl_extend("force", BASE, { reverse = true }))
color(0, "PmenuThumb", { bg = BASE_COLOR })
color(0, "NormalFloat", { bold = true })

-- Python
color(0, "@variable.python", VAR)
color(0, "@string.python", { link = nil })
color(0, "@variable.member.python", { link = nil })
color(0, "@lsp.type.string.python", { link = nil })
color(0, "pythonInclude", BASE)
color(0, "Statement", BASE)
color(0, "Type", BASE)
color(0, "String", CONST)
color(0, "Special", VAR)
color(0, "@parameter", BASE)
color(0, "@keyword_argument", BASE)
color(0, "@constructor", BASE)
color(0, "@lsp.typemod.string.documentation.python", BASE)
color(0, "@type.builtin.python", BASE)
color(0, "@function.builtin.python", BASE)
color(0, "@string.python", CONST)
color(0, "@lsp.type.builtinConstant.python", CONST)
color(0, "@constant.builtin.python", CONST)
color(0, "@function.method.call.python", FN)
color(0, "@function.python", FN)
color(0, "@string.documentation.python", { underdouble = false, underline = false })

-- Lua
color(0, "@constant.builtin.lua", { link = nil })
color(0, "@variable.lua", { link = nil })
color(0, "@constructor.lua", BASE)
color(0, "@function.builtin.lua", FN)
color(0, "@constant.builtin.lua", CONST)

-- Oil
color(0, "OilDir", FN)

-- vim.hl.priorities.treesitter = 200
