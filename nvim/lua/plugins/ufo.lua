-- ~/.config/nvim/lua/custom/plugins/ufo.lua

-- Configuración para nvim-ufo (Ultra Fold)

return {
  "kevinhwang91/nvim-ufo",
  dependencies = {
    "kevinhwang91/promise-async",
  },
  event = "BufReadPost",
  config = function()
    local ufo = require("ufo")

    -- ¡Añade esta comprobación!
    if not ufo then
      vim.api.nvim_echo({{"Error: nvim-ufo no pudo cargarse.", "Error"}}, true, {})
      return -- Salir de la función config si ufo no está disponible
    end

    ufo.setup({
      fold_virt_text_handler = function(virt_text, lnum, endLnum, width, truncate)
        local new_virt_text = {}
        local suffix = " ... " .. tostring(endLnum - lnum) .. " lines "
        local suf_len = vim.fn.strdisplaywidth(suffix)
        local cur_width = 0

        for _, chunk in ipairs(virt_text) do
          local chunk_text = chunk[1]
          local chunk_len = vim.fn.strdisplaywidth(chunk_text)
          if truncate and cur_width + chunk_len + suf_len > width then
            chunk_text = truncate(chunk_text, width - cur_width - suf_len)
            table.insert(new_virt_text, { chunk_text, chunk[2] })
            break
          else
            table.insert(new_virt_text, chunk)
          end
          cur_width = cur_width + chunk_len
        end
        table.insert(new_virt_text, { suffix, "Comment" })
        return new_virt_text
      end,
      -- ... otras opciones de configuración para UFO
    })

    -- Mapeos de teclado para UFO
    -- Estos son los que causaron el error si 'ufo' era nil
    -- vim.keymap.set("n", "zR", ufo.openAllFolds)
    -- vim.keymap.set("n", "zM", ufo.closeAllFolds)
    -- vim.keymap.set("n", "zr", ufo.openFold)
    -- vim.keymap.set("n", "zm", ufo.closeFold)
    -- vim.keymap.set("n", "za", ufo.toggleFold)
  end,
}
