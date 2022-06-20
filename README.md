# telescope-emoji.nvim

An extension for [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
that allows you to search emojis😃

<!-- markdownlint-disable-next-line -->
<img width="800" alt="screenshot" src="https://user-images.githubusercontent.com/47070852/124722843-07b16f00-df3d-11eb-891c-9a316e8d577c.gif">

## Get Started

Install telescope and this plugin then

```lua
require("telescope").load_extension("emoji")
```

## Usage

```
:Telescope emoji
```

## Configuraion

**It's optional.**

by default

```lua
require("telescope-emoji").setup({
  action = function(emoji)
    -- argument emoji is a table.
    -- {name="", value="", cagegory="", description=""}
    vim.fn.setreg("*", emoji.value)
    print([[Press p or "*p to paste this emoji]] .. emoji.value)
    
    -- insert emoji when picked
    -- vim.api.nvim_put({ emoji.value }, 'c', false, true)
  end,
})
```
