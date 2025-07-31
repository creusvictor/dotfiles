-- ~/.config/nvim/lua/custom/plugins/statuscol.lua

return {
  "luukvbaal/statuscol.nvim",
  event = "BufReadPost",
  opts = function()
    local builtin = require("statuscol.builtin")
    return {
      -- ¡CAMBIO AQUÍ!
      setopt = true, -- Asegura que statuscol.nvim configure las opciones de la columna
      -- Si ya tienes vim.opt.foldcolumn = '1' en init.lua, esto lo reforzaría.

      segments = {
        { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
        { text = { "%s" }, click = "v:lua.ScSa" },
        { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
      },
    }
  end,
}
