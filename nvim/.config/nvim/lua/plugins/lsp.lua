return {
  "neovim/nvim-lspconfig",
  name = "lspconfig",
  dependencies = {
    { "williamboman/mason.nvim", name = "mason" },
    { "nvim-treesitter/nvim-treesitter", name = "treesitter", branch = "master" },
  },
  config = function()
    require("mason").setup({
      ui = {
        border = "rounded"
      }
    })

    vim.lsp.enable("cssls")
    vim.lsp.enable("lua_ls")
    vim.lsp.enable("clangd")

    vim.lsp.config("clangd", {
      cmd = { "clangd", "--header-insertion=never", "--function-arg-placeholders=false" }
    })

    require("nvim-treesitter.configs").setup({
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      }
    })

    vim.diagnostic.config({
      virtual_text = {
        prefix = "",
        format = function(diagnostic)
          return "󰣑 " .. diagnostic.message
        end,
      },

      float = {
        header = "",
        prefix = "",
        border = "rounded",
        style = "minimal",
      },
      severity_sort = true,
      underline = true,
      update_in_insert = false,
    })

    local orig_util = vim.lsp.util.open_floating_preview
    vim.lsp.util.open_floating_preview = function(contents, syntax, opts, ...)
      opts = opts or {}
      opts.border = opts.border or "rounded"
      return orig_util(contents, syntax, opts, ...)
    end

    vim.keymap.set("n", "K", vim.lsp.buf.hover, { silent = true })
    vim.keymap.set("n", "<leader>k", vim.lsp.buf.format, { silent = true })
    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { silent = true })
    vim.keymap.set("n", "<leader>g", vim.lsp.buf.definition, { silent = true })
    vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, { silent = true })
    vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { silent = true })
  end
}
