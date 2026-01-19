return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          explorer = {
            actions = {
              go_in_if_dir = function(picker, item)
                vim.print("OK")
                if item.dir then
                  picker:action("confirm")
                end
              end,
            },
            win = {
              input = {
                keys = {
                  ["l"] = "go_in_if_dir",
                  ["L"] = { { "confirm", "close" } },
                  ["<CR>"] = { { "confirm", "close" } },
                },
              },
              list = {
                keys = {
                  ["l"] = "go_in_if_dir",
                  ["L"] = { { "confirm", "close" } },
                  ["<CR>"] = { { "confirm", "close" } },
                },
              },
            },
          },
        },
      },
    },
  },
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "harper-ls",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        harper_ls = {},
      },
    },
  },
}
