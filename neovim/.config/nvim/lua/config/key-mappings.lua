-- Key mappings
function map(mode, lhs, rhs, opts)
    opts = opts or {}
    opts["noremap"] = opts["noremap"] or true
    opts["silent"] = opts["silent"] or true
    vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

-- Move up and down by screen lines.
map("n", "k", "gk")
map("n", "j", "gj")

-- Easier window navigation/manipulation.
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Disable highlight after search.
map("", "<leader><space>", ":set hlsearch! <CR>")

-- Toggle spell check.
map("n", "<leader>sc", ":set spell!<CR>")

-- Show highlighting groups for current word.
map("n", "<C-N>", ":echo map(synstack(line('.'), col('.')), \"synIDattr(v:val, 'name')\") <CR>")
