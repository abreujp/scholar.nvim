<div align="center">
      <h1>scholar.nvim</h1>
      <p><em>A scholarly sepia colorscheme for light mode coding</em></p>
      <p><strong>🌅 Light Theme Only</strong> - Optimized for comfortable daytime development</p>
</div>

<p align="center"> 
      <a href="#"><img alt="Made with Lua" src="https://img.shields.io/badge/Made%20with%20Lua-blueviolet.svg?style=for-the-badge&logo=lua" style="vertical-align:center" /></a>
</p>

## 📚 About Scholar

**scholar.nvim** is a sophisticated Neovim colorscheme designed specifically for **light mode development**. Created for developers, researchers, and academics who value both functionality and aesthetic elegance, Scholar transforms the familiar earthtone palette into a refined sepia experience.

**🌅 Light Theme Focus:** Scholar is exclusively designed for light backgrounds and has not been optimized for dark mode. The sepia palette works best with light backgrounds to achieve the intended academic reading atmosphere.

### 🎨 Design Philosophy

Scholar draws its inspiration from the **sepia theme** of the **Readera** Android reading app, which uses warm, paper-like tones that reduce eye strain during extended reading sessions. This same principle applies to coding - the sepia palette creates a comfortable, academic atmosphere perfect for long development sessions, research, and thoughtful programming.

**Why sepia tones on light backgrounds?**
- **Reduced eye fatigue** during extended coding sessions in bright environments
- **Academic ambiance** reminiscent of vintage manuscripts and libraries  
- **Professional appearance** suitable for scholarly and research environments
- **Warm, inviting atmosphere** that encourages focused work
- **Optimized for daylight** - perfect for office and well-lit workspace environments

### ✨ Key Features

- **Light mode exclusive** - Specifically designed and optimized for light backgrounds
- **Based on gruvbox.nvim** - Inherits the robust architecture and reliability
- **Sepia color palette** - Warm, academic tones inspired by Readera
- **Full treesitter support** - Enhanced syntax highlighting
- **LSP semantic highlights** - Modern language server integration
- **Customizable** - Extensive configuration options
- **Academic focus** - Perfect for research, documentation, and scholarly coding

### ⚠️ Important Note

**Scholar does not support dark mode.** This theme has been exclusively crafted for light backgrounds to achieve the intended sepia aesthetic reminiscent of academic paper and vintage manuscripts. Using `vim.o.background = "dark"` is not recommended and may result in poor contrast and readability.

## 🔧 Requirements

- Neovim 0.8.0+
- **Light background environment** - Scholar is designed for well-lit workspaces

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
    vim.o.background = "light"  -- REQUIRED: Scholar only works with light mode
    vim.cmd("colorscheme scholar")
  end,
}
```

### Using `packer`

```lua
use {
  "abreujp/scholar.nvim",
  config = function()
    require("scholar").setup()
    vim.o.background = "light"  -- REQUIRED: Always use light mode
    vim.cmd("colorscheme scholar")
  end
}
```

### Using `vim-plug`

```vim
Plug 'abreujp/scholar.nvim'
```

## 🚀 Quick Start

### Lua Configuration

```lua
require("scholar").setup({
  contrast = "soft",  -- "hard", "soft" or "" (default)
  transparent_mode = false,
})
vim.o.background = "light"  -- ALWAYS use light - dark mode not supported
vim.cmd("colorscheme scholar")
```

### Vim Configuration

```vim
set background=light  " REQUIRED - Scholar does not support dark mode
colorscheme scholar
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
