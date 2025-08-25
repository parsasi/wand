-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

-- define home
local home = os.getenv("HOME")

--Plaugins
lvim.plugins = {
  {
    "github/copilot.vim",
    tag = "v1.33.0"
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  },
  { "folke/tokyonight.nvim", lazy = false, priority = 1000 },
  { "jwalton512/vim-blade" },
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
      require("chatgpt").setup({
        api_key_cmd = "cat " .. home .. "/wand/.chatgpt-api-key",
      })
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "folke/trouble.nvim", -- optional
      "nvim-telescope/telescope.nvim"
    }
  },
}


require('lspconfig').tsserver.setup({
  init_options = {
    preferences = {
      -- other preferences...
      importModuleSpecifierPreference = 'relative',
      importModuleSpecifierEnding = 'minimal',
    },
  }
})


require("tokyonight").setup({
  style = "night",
  styles = {
    comments = { italic = true },
    keywords = { italic = true }
  }
})
vim.schedule(function()
  vim.cmd.colorscheme "tokyonight"
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
  {
    name = "blade_formatter", -- note the underscore, this is the builtin name
    filetypes = { "blade" },
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
lvim.lsp.buffer_mappings.normal_mode["gr"] = { "<cmd>lua vim.lsp.buf.references()<CR>", "References" }
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

-- Add the keybindings for LSP references
lvim.builtin.which_key.mappings["l"]["R"] = { "<cmd>Telescope lsp_references()<cr>", "Telescope references" }
lvim.builtin.telescope = {
  active = true,
  defaults = {
    layout_strategy = "horizontal",
  },
  pickers = {
    git_files = {
      hidden = true,
    },
    live_grep = {
      hidden = true,
    },
  },
}
lvim.format_on_save.enabled = true


vim.opt.foldmethod = "expr"                     -- default is "normal"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()" -- default is ""
vim.opt.foldenable = false                      -- if this option is true and fold method option is other than normal, every time a document
lvim.builtin.which_key.setup.plugins.presets.z = true
