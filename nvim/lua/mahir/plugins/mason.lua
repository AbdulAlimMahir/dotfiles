return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "neovim/nvim-lspconfig",
  },
  config = function()
    -- import mason
    local mason = require("mason")

    -- import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

    local mason_tool_installer = require("mason-tool-installer")

    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      -- list of servers for mason to install
      ensure_installed = {
        "clangd", -- C, C++
        "tsserver", --JavaScript
        "pyright", -- Python
        "lua_ls", -- Lua (formerly "sumneko_lua")
        "vimls", --VimScript
        "jedi_language_server", -- Django (Python)
        "jdtls", -- Java
        "gopls", -- Go
        "yamlls", -- YAML
        "taplo", -- TOML
        "html",
        "cssls",
        "tailwindcss",
        "svelte",
        "graphql",
        "emmet_ls",
        "prismals",
        "pyright",
      },
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "clangd", -- C, C++
        "tsserver", -- JavaScript
        "pyright", -- Python
        "lua-language-server", -- Lua
        "vim-language-server", -- VimScript
        "jedi-language-server", -- Django (Python)
        "jdtls", -- Java
        "gopls", -- Go
        "yaml-language-server", -- YAML
        "taplo", -- TOML
        "prettier", -- prettier formatter
        "stylua", -- lua formatter
        "isort", -- python formatter
        "black", -- python formatter
        "pylint",
        "eslint_d",
      },
    })
  end,
}
