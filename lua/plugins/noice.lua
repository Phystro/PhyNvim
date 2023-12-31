local M = { "folke/noice.nvim" }

M.event = { 'BufReadPre', 'BufNewFile' } -- "VeryLazy"

M.opts = function()
    return require("configs.noice_options")
end

M.dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify",
}

return M
