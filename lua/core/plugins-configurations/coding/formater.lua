local status, formatter = pcall(require, "formatter")
if (not status) then return end

formatter.setup {
  logging = true,
  -- Set the log level
  log_level = vim.log.levels.WARN,
  filetype = {
    php = {
      function()
        return {
          exe = './vendor/bin/phpcbf',
          args = { '--stdin-path=' .. vim.api.nvim_buf_get_name(0), '-' },
          stdin = true,
          ignore_exitcode = true,
        }
      end
    }
  }
}
