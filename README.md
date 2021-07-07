# telescope-emoji.nvim

An extension for [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
that allows you to search emojis😃

## Get Started

Install telescope and this plugin then

```lua
require("telescope").load_extension("emoji")
```

## Usage

```
:Telescope emoji search
```

## Configuraion

**It's optional.**

by default

```lua
require("telescope-emoji").setup({
  action = function(emoji)
    -- argument emoji is a table.
    -- {name="", value="", cagegory="", description=""}
    vim.fn.setreg("", emoji.value)
    print([[Press p or ""p to paste this emoji]] .. emoji.value)
  end,
})
```
