-- :memo: Open a directory then Type g? to see help
require("oil").setup({
  default_file_explorer = true,
  delete_to_trash = true,
  skip_confirm_for_simple_edits = true,
  view_options = {
    show_hidden = true,
    natural_order = true,
  },
  float = {
    previw_split = 'botright',
  },
  keymaps = {
    -- Use C-v to preview instead of C-p
    ["<C-v>"] = "actions.preview",
    ["<C-p>"] = false,
    -- toggle file details
    ["gd"] = {
      desc = "Toggle file detail view",
      callback = function()
        detail = not detail
        if detail then
          require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
        else
          require("oil").set_columns({ "icon" })
        end
      end,
    },
  },
})
require('mini.icons').setup()
