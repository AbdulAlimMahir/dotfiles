require("mahir.options")
require("mahir.keymaps")
require("mahir.plugins")

-- Loads after everything
require("mahir.lazy")

require("mahir.theme_picker").load_last_theme()
-- FILE STRUCTURe [nvim]
-- -> init.lua [loads -> mahir.plugins, mahir.options, mahir.keymaps]
-- -> Lua
--   -> Mahir
--     -> Plugins [contains -> all plugins]
--     -> Themes [contains -> all themes]
--     -> keymaps.lua
--     -> theme_picker.lua
--     -> lazy.lua
--     -> options.lua
--     -> plugins.lua [loads -> single-line plugins]
