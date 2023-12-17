local M = { "lukas-reineke/indent-blankline.nvim" }

M.main = "ibl"

M.opts  = {
    --indentLine_enabled = 1,
    -- filetype_exclude = {
    --     "help",
    --     "terminal",
    --     "lazy",
    --     "lspinfo",
    --     "TelescopePrompt",
    --     "TelescopeResults",
    --     "mason",
    --     "nvdash",
    --     "nvcheatsheet",
    --     "",
    -- },
    -- buftype_exclude = { "terminal" },
    -- show_trailing_blankline_indent = false,
    -- show_first_indent_level = false,
    -- show_current_context = true,
    -- show_current_context_start = true,
}

M.config = function(_, opts)
    -- require("core.utils").load_mappings "blankline"
    -- dofile(vim.g.base46_cache .. "blankline")
    require("ibl").setup(opts)
end

return M
