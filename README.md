<div align="center">
      <h1>scholar.nvim</h1>
      <p><em>A scholarly sepia colorscheme for both light and dark mode coding</em></p>
      <p><strong>🌅 Light Theme Primary</strong> • <strong>🌙 Dark Theme Available</strong></p>
      <p>Optimized for comfortable development in any lighting condition</p>
</div>

<p align="center"> 
      <a href="#"><img alt="Made with Lua" src="https://img.shields.io/badge/Made%20with%20Lua-blueviolet.svg?style=for-the-badge&logo=lua" style="vertical-align:center" /></a>
</p>

## 📸 Preview

<div align="center">
  
  <table>
    <tr>
      <td align="center">
        <h3>🌅 Light Theme (Primary)</h3>
        <img src="light.png" alt="Scholar.nvim Light Theme" width="400"/>
      </td>
      <td align="center">
        <h3>🌙 Dark Theme (Companion)</h3>
        <img src="dark.png" alt="Scholar.nvim Dark Theme" width="400"/>
      </td>
    </tr>
  </table>
  
  <p><em>Scholar.nvim in action - warm sepia tones creating the perfect academic coding atmosphere in any lighting condition</em></p>
  
</div>

## 📚 About Scholar

**scholar.nvim** is a sophisticated Neovim colorscheme designed with an emphasis on **light mode development** while now offering a refined **dark mode companion**. Created for developers, researchers, and academics who value both functionality and aesthetic elegance, Scholar transforms the familiar earthtone palette into a refined sepia experience.

**🌅 Light Theme Primary:** Scholar's light theme remains the primary focus, exclusively designed for light backgrounds to achieve the intended academic reading atmosphere inspired by sepia-toned manuscripts.

**🌙 Dark Theme Available:** The new dark companion maintains the same sepia harmony and academic elegance, carefully adapted for low-light environments while preserving the scholarly aesthetic.

### 🎨 Design Philosophy

Scholar draws its inspiration from the **sepia theme** of the **Readera** Android reading app, which uses warm, paper-like tones that reduce eye strain during extended reading sessions. This same principle applies to coding - the sepia palette creates a comfortable, academic atmosphere perfect for long development sessions, research, and thoughtful programming.

**Why sepia tones for both light and dark?**
- **Reduced eye fatigue** during extended coding sessions in any lighting condition
- **Academic ambiance** reminiscent of vintage manuscripts and libraries  
- **Professional appearance** suitable for scholarly and research environments
- **Warm, inviting atmosphere** that encourages focused work
- **Adaptable** - Light theme for bright environments, dark theme for low-light settings
- **Consistent aesthetic** - Both themes maintain the same scholarly character

### ✨ Key Features

- **Dual theme support** - Primary light theme with companion dark theme
- **Based on gruvbox.nvim** - Inherits the robust architecture and reliability
- **Sepia color palette** - Warm, academic tones inspired by Readera
- **Full treesitter support** - Enhanced syntax highlighting
- **LSP semantic highlights** - Modern language server integration
- **Customizable** - Extensive configuration options
- **Academic focus** - Perfect for research, documentation, and scholarly coding
- **Light/Dark harmony** - Both themes share the same aesthetic principles

## 🔧 Requirements

- Neovim 0.8.0+

## 📦 Installation

### Using `lazy.nvim` (recommended)

```lua
{
  "abreujp/scholar.nvim",
  priority = 1000,
  config = function()
    require("scholar").setup({
      -- your configuration here
    })
    
    -- For light theme (primary)
    vim.o.background = "light"
    vim.cmd("colorscheme scholar")
    
    -- OR for dark theme
    -- vim.o.background = "dark"
    -- vim.cmd("colorscheme scholar")
  end,
}
```

### Using `packer`

```lua
use {
  "abreujp/scholar.nvim",
  config = function()
    require("scholar").setup()
    
    -- Choose your preferred theme
    vim.o.background = "light"  -- For light theme
    vim.cmd("colorscheme scholar")
    
    -- OR use: 
    -- vim.o.background = "dark"
    -- vim.cmd("colorscheme scholar") for dark theme
  end
}
```

### Using `vim-plug`

```vim
Plug 'abreujp/scholar.nvim'
```

Then in your init.vim:
```vim
" For light theme (primary)
set background=light
colorscheme scholar

" OR for dark theme
" set background=dark
" colorscheme scholar
```

## 🚀 Quick Start

### Lua Configuration

```lua
require("scholar").setup({
  contrast = "soft",  -- "hard", "soft" or "" (default)
  transparent_mode = false,
})

-- Choose your preferred theme
vim.o.background = "light"  -- For light theme
vim.cmd("colorscheme scholar")

-- OR for dark theme
-- vim.o.background = "dark"
-- vim.cmd("colorscheme scholar")
```

### Vim Configuration

```vim
" For light theme (primary)
set background=light
colorscheme scholar

" OR for dark theme
" set background=dark
" colorscheme scholar
```

## ⚙️ Configuration

Scholar provides extensive customization options while maintaining sensible defaults:

```lua
require("scholar").setup({
  terminal_colors = true,     -- Enable terminal colors
  undercurl = true,          -- Enable undercurls for diagnostics
  underline = true,          -- Enable underlines
  bold = true,               -- Enable bold text
  italic = {
    strings = true,          -- Italicize strings
    emphasis = true,         -- Italicize emphasized text
    comments = true,         -- Italicize comments
    operators = false,       -- Don't italicize operators
    folds = true,           -- Italicize fold text
  },
  strikethrough = true,      -- Enable strikethrough
  invert_selection = false,  -- Don't invert selections
  invert_signs = false,      -- Don't invert sign column
  invert_tabline = false,    -- Don't invert tabline
  inverse = true,            -- Invert background for search, diffs, etc.
  contrast = "",             -- Contrast level: "hard", "soft", or ""
  palette_overrides = {},    -- Override palette colors
  overrides = {},            -- Override highlight groups
  dim_inactive = false,      -- Don't dim inactive windows
  transparent_mode = false,  -- Disable transparent background
})
```

**⚠️ Important:** Always call `setup()` before setting the colorscheme!

### Palette Customization

Override specific colors while maintaining the sepia harmony:

```lua
require("scholar").setup({
  palette_overrides = {
    bright_red = "#CC6666",    -- Custom error color
    gray = "#999999",          -- Custom comment color
  }
})
```

### Highlight Group Overrides

Customize specific highlighting:

```lua
require("scholar").setup({
  overrides = {
    -- UI elements
    SignColumn = { bg = "#F5F5DC" },
    
    -- Treesitter groups
    ["@comment.lua"] = { fg = "#8B7355", italic = true },
    ["@string"] = { fg = "#8B6F47" },
    
    -- LSP semantic tokens
    ["@lsp.type.method"] = { fg = "#A0623A", bold = true },
  }
})
```

## 🎨 Acknowledgments

**scholar.nvim** is built upon the excellent foundation of [gruvbox.nvim](https://github.com/ellisonleao/gruvbox.nvim) by [@ellisonleao](https://github.com/ellisonleao). The robust architecture and thoughtful design of gruvbox made Scholar possible.

**Color inspiration** comes from the sepia reading theme in the [Readera](https://play.google.com/store/apps/details?id=org.readera) Android app, which demonstrates how warm, paper-like tones can reduce eye strain and create a comfortable reading environment.

## 📄 License

MIT License - see [LICENSE](LICENSE) for details.
