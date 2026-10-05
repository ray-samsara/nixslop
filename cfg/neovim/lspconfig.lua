return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()

      local lspconfig = require("lspconfig")

      lspconfig.clangd.setup({
        cmd = {
          "/etc/profiles/per-user/pc/bin/clangd",
          "--background-index",
          "--clang-tidy",
          "--completion-style=detailed",
        },
      })
    end,
  },
}
