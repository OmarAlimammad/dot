return {
  "stevearc/oil.nvim",
  name = "oil",
  dependencies = { "nvim-tree/nvim-web-devicons", name = "icons" },
  config = function()
    require("oil").setup({
      view_options = {
        show_hidden = true,
      },
      float = {
        padding = 8,
        border = "rounded"
      },
      confirmation = {
        border = "rounded"
      },
    })

    vim.keymap.set("n", "<leader>z", require("oil").open_float)
  end
}
