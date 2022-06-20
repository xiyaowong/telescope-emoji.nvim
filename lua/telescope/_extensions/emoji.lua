local actions = require("telescope.actions")
local finders = require("telescope.finders")
local pickers = require("telescope.pickers")
local conf = require("telescope.config").values
local entry_display = require("telescope.pickers.entry_display")
local action_state = require("telescope.actions.state")

local emojis = require("telescope-emoji").emojis

local function action(emoji)
  vim.fn.setreg("*", emoji.value)
  print([[Press p or "*p to paste this emoji]] .. emoji.value)
end

local function search(opts)
  local displayer = entry_display.create({
    separator = " ",
    items = {
      { width = 40 },
      { width = 18 },
      { remaining = true },
    },
  })
  local make_display = function(entry)
    return displayer({
      entry.value .. " " .. entry.name,
      entry.category,
      entry.description,
    })
  end

  pickers.new(opts, {
    prompt_title = "Emojis",
    sorter = conf.generic_sorter(opts),
    finder = finders.new_table({
      results = emojis,
      entry_maker = function(emoji)
        return {
          ordinal = emoji.name .. emoji.category .. emoji.description,
          display = make_display,

          name = emoji.name,
          value = emoji.value,
          category = emoji.category,
          description = emoji.description,
        }
      end,
    }),
    attach_mappings = function(prompt_bufnr)
      actions.select_default:replace(function()
        local emoji = action_state.get_selected_entry()
        actions.close(prompt_bufnr)
        action(emoji)
      end)
      return true
    end,
  }):find()
end

return require("telescope").register_extension({
  setup = function(config)
    action = config.action or action
  end,
  exports = { emoji = search },
})
