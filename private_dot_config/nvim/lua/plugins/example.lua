return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
  {
    "stevearc/conform.nvim",
    formatters_by_ft = {
      lua = { "stylua" },
      sh = { "shfmt" },
      go = { "gofmt" },
    },
  },
}
