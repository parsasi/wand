-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

--Plaugins
lvim.plugins = {
  {
    "github/copilot.vim",
    tag = "v1.33.0"
  },
  -- {
  --   "tiagovla/tokyodark.nvim",
  --   opts = {
  --     -- custom options here
  --   },
  --   config = function(_, opts)
  --     require("tokyodark").setup(opts) -- calling setup is optional
  --   end,
  -- },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
}

require("catppuccin").setup()
vim.schedule(function()
  vim.cmd.colorscheme "catppuccin"
end)

-- Prettier configuration
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    exe = "prettier",
    filetypes = {
      "javascriptreact",
      "javascript",
      "typescriptreact",
      "typescript",
      "json",
      "markdown",
    },
  },
}

-- ESLint
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  {
    exe = "eslint",
    filetypes = {
      "javascriptreact",
      "javascript",
      "typescriptreact",
      "typescript",
      "vue",
    },
  },
}

formatters.setup {
  { name = "black" },
  {
    name = "prettier",
    ---@usage arguments to pass to the formatter
    -- these cannot contain whitespace
    -- options such as `--line-width 80` become either `{"--line-width", "80"}` or `{"--line-width=80"}`
    args = { "--print-width", "100" },
    ---@usage only start in these filetypes, by default it will attach to all filetypes it supports
    filetypes = {
      "css",
      "graphql",
      "html",
      "javascript",
      "javascriptreact",
      "json",
      "less",
      "markdown",
      "scss",
      "typescript",
      "typescriptreact",
      "yaml", },
  },
}

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { name = "flake8" },
  {
    name = "shellcheck",
    args = { "--severity", "warning" },
  },
}

local code_actions = require "lvim.lsp.null-ls.code_actions"
code_actions.setup {
  {
    name = "proselint",
  },
}

---- Customization
vim.keymap.set({ 'n', 'v' }, '<S-J>', '5j<CR>', { noremap = true, silent = true })
vim.keymap.set({ 'n', 'v' }, '<S-F>', '5k<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', 'kj', '<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space>sg', ':Telescope live_grep<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space>aa', 'ggVG', { noremap = true, silent = true })
lvim.keys.normal_mode["gt"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["GT"] = ":BufferLineCyclePrev<CR>"
vim.keymap.set('n', 'fo', function() vim.lsp.buf.format() end, { noremap = true })

-- Change Vimtree width
lvim.builtin.nvimtree.setup.view.width = 55


-- Avoid automatically changing cwd when navigating between buffers
lvim.builtin.project.active = false

-- Add a cpp command to copy the current path
vim.api.nvim_create_user_command("Cpp", function()
  local path = vim.fn.expand("%:p")
  local relative_path = path:gsub(vim.fn.getcwd(), ".");
  local line_number = vim.fn.line(".")
  local path_with_line = relative_path .. ":" .. line_number
  vim.fn.setreg("+", path_with_line)
  vim.notify('Copied "' .. path_with_line .. '" to the clipboard!')
end, {})

--Add a cpg command to copy the current path's girhub
vim.api.nvim_create_user_command("Cpg", function(opts)
  local path = vim.fn.expand("%:p")
  local relative_path = path:gsub(vim.fn.getcwd() .. "/", "")
  local line_number = vim.fn.line(".")
  local path_with_line = relative_path .. "#L" .. line_number

  -- Use the provided branch or default to the current branch
  local branch = opts.args ~= "" and opts.args or vim.fn.system("git branch --show-current"):gsub("\n", "")

  -- Get the repository URL
  local repository = vim.fn.system("git remote get-url origin")
  local repository_url = repository:gsub(".*:", ""):gsub(".git", "")

  -- Construct the GitHub URL
  local gh_url_with_branch = "https://github.com/" .. repository_url .. "/tree/" .. branch .. "/" .. path_with_line

  -- Copy to clipboard
  vim.fn.setreg("+", gh_url_with_branch)
  vim.notify('Copied "' .. gh_url_with_branch .. '" to the clipboard!')
end, {
  nargs = "?", -- Optional argument
})


lvim.format_on_save.enabled = true


vim.opt.foldmethod = "expr"                     -- default is "normal"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()" -- default is ""
vim.opt.foldenable = false                      -- if this option is true and fold method option is other than normal, every time a document
