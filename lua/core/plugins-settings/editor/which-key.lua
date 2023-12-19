local status, wk = pcall(require, "which-key")
if (not status) then return end

local opts = {
  mode = "n", -- NORMAL mode
  -- prefix: use "<leader>f" for example for mapping everything related to finding files
  -- the prefix is prepended to every mapping part of `mappings`
  prefix = "<Space>",
  buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true,  -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false, -- use `nowait` when creating keymaps
  expr = false,   -- use `expr` when creating keymaps
}

local mappings = {
  f = {
    name = "+file",
    f = { "<cmd>Telescope find_files<cr>", "Find File" },
    b = { "<cmd>Telescope file_browser<cr>", "Open file browser" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
  },
  b = {
    name = "+buffer",
    b = { "<cmd>Telescope buffers<cr>", "Open buffers" },
  },
  w = {
    name = "+window",
    w = { "<C-w>w", "Go to next window" },
    ["<left>"] = { "<C-w><", "Resize window to left" },
    ["<right>"] = { "<C-w>>", "Resize window to right" },
    ["<up>"] = { "<C-w>+", "Resize window to top" },
    ["<down>"] = { "<C-w>-", "Resize window to donw" },
    l = { "<C-w>l", "Go to left window" },
    e = { "<C-w>=", "Make windows equal" },
    h = { "<C-w>h", "Go to right window" },
    j = { "<C-w>j", "Go to bottom window" },
    k = { "<C-w>k", "Go to top window" },
    s = { ":split<Return><C-w>w", "Split window horisontaly" },
    v = { ":vsplit<Return><C-w>w", "Split window verticaly" },
    q = { ":close<cr>", "Close window" },
  },
  o = {
    name = "+open",
    e = { ":Neotree toggle<cr>", "Open project explorer" }
  },
  g = {
    name = "+git",
    g = { ":LazyGit<cr>", "Open Lazy git" }
  },
  c = {
    name = "+code",
    f = { vim.lsp.buf.format({ async = true }), "Format buffer" },
    s = { "<Cmd>Lspsaga outline<cr>", "Code structure" },
  },
  s = {
    name = "+search"
  }
}
wk.register(mappings, opts)
