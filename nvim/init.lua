require("mahir.options")
require("mahir.keymaps")
require("mahir.plugins")

-- Loads after everything
require("mahir.lazy")

-- FILE STRUCTURe [nvim]
-- -> init.lua [loads -> mahir.plugins, mahir.options, mahir.keymaps]
-- -> Lua
--   -> Mahir
--     -> Plugins [contains -> all plugins]
--     -> keymaps.lua
--     -> lazy.lua
--     -> options.lua
--     -> plugins.lua [loads -> Plugins]
