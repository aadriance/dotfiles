return {
  {
    "esmuellert/codediff.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    cmd = "CodeDiff",
  },
  {
    "yannvanhalewyn/jujutsu.nvim",
    opts = {
      diff_preset = "codediff",
    },
  },
}
