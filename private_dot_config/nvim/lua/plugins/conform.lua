return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      sh = { "shfmt" },
      go = { "gofmt" },
    },
    formatters = {
      gofmt = {},
    },
  },
}
