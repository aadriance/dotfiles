-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--

-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")-- Delete empty [No Name] buffer when closing a tab
vim.api.nvim_create_autocmd("TabClosed", {
  group = vim.api.nvim_create_augroup("TabCleanUp", { clear = true }),
  callback = function()
    local buffers = vim.api.nvim_list_bufs()

    for _, bufnr in ipairs(buffers) do
      if
        vim.api.nvim_buf_is_loaded(bufnr)
        and vim.api.nvim_buf_get_name(bufnr) == ""
        -- Important: check for empty buffer type to avoid issues with
        -- plugins like snacks or telescope which use scratch buffers for
        -- preview, for example. They usually set buftype to something like
        -- 'nofile' or 'prompt'.
        and vim.api.nvim_get_option_value("buftype", { buf = bufnr }) == ""
      then
        local is_modified = vim.api.nvim_get_option_value("modified", { buf = bufnr })
        if not is_modified then
          local is_empty = vim.api.nvim_buf_line_count(bufnr) == 1
            and vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)[1] == ""

          -- Check that the empty buffer is not shown in any window and therefore can be deleted
          local windows = vim.fn.win_findbuf(bufnr)
          if is_empty and #windows == 0 then
            pcall(vim.api.nvim_buf_delete, bufnr, { force = true })
          end
        end
      end
    end
  end,
})

-- auto add lockfile
vim.api.nvim_create_autocmd("User", {
  pattern = "LazyUpdate",
  callback = function()
    local lock_file = vim.fn.stdpath("config") .. "/lazy-lock.json"
    os.execute("chezmoi re-add" .. " " .. lock_file)
  end,
})
