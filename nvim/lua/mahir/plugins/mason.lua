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

		mason.setup({
			ui = {
				check_outdated_packages_on_open = true,
				border = "rounded",
				-- Integer >1 for fixed width | Float >1 for percentage of screen width.
				width = 0.5,
				height = 0.7,
				icons = {
					package_installed = " ",
					package_pending = "󰦗 ",
					package_uninstalled = " ",
				},
			},
		})

		mason_lspconfig.setup({
			-- (2) LSP
			ensure_installed = {
				"html", --HTML
				"cssls", --CSS,SCSS,LESS
				-- "phpactor", --PHP (Intelephense)
				"tailwindcss", --Tailwind CSS
				"lua_ls", --Lua (formerly "sumneko_lua")
				-- "clangd", --C/C++
				-- "pyright", --Python LS
				"ts_ls", --TypeScript
				-- "taplo", --TOML
				"eslint", --JavaScript, TypeScript
				-- "bashls", --Bash
				-- "vimls", --VimScript
				-- "yamlls", --YAML
				-- "jedi_language_server", --Django (Python)
				"marksman", --Markdown LSP
				"biome", --JSON, JavaScript, TypeScript [!]
				"ast_grep", --C, C++, Rust, Go, Java, Python, C#, JavaScript, JSX, TypeScript, HTML, CSS, Kotlin, Dart, Lua [ Linter, Formatter, Runtime, LSP ]
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				-- (3) DAP
				-- "codelldb", --C, C++, Rust, Zig
				-- "cpptools", --C, C++, Rust
				"js-debug-adapter", --JavaScript, TypeScript
				"node-debug2-adapter", --JavaScript, TypeScript
				-- (4) Linter
				"htmlhint", --HTML
				"stylelint", --CSS, Sass, SCSS, LESS
				"jsonlint", --JSON
				"selene", --Lua, Luau
				-- "pylint", --Python
				"eslint_d", --JavaScript, TypeScript
				"markdownlint", --Markdown
				-- (5) Formatter
				-- "black", --Python
				-- "isort", --Python
				"stylua", --Lua
				-- "yamlfmt", --YAML
				"prettier", --Angular, CSS, Flow, GraphQL, HTML, JSON, JSX, JavaScript, LESS, Markdown, SCSS, TypeScript, Vue, YAML
			},
		})
	end,
}
