-- Language Server Protocal configuration
local lspconfig = require("lspconfig")

-- C/C++
lspconfig.clangd.setup {}

-- Python
lspconfig.jedi_language_server.setup {
    init_options = {
        completion = {
            -- Return CompletionItem.detail in the initial completion request to get signatures in
            -- the completion menu because Neovim doesn"t support "completionItem/resolve" yet to
            -- obtain this information.
            resolveEagerly = true,
        },
    },
}

-- Rust
lspconfig.rust_analyzer.setup {}

-- Go
lspconfig.gopls.setup {}

-- Show function signatures when typing.
require("lsp_signature").setup()

-- Use a single letter to indicate "complete-items" "kind" field.
-- See :help complete-item-kind.
vim.lsp.util._get_completion_item_kind_name = function(completion_item_kind)
    return vim.lsp.protocol.CompletionItemKind[completion_item_kind]:sub(1,1):lower()
end

-- Global mappings

-- See `:help vim.diagnostic.*` for documentation on any of the below functions.
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys after the language
-- server attaches to the current buffer.
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>.
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    -- Buffer local mappings

    -- See `:help vim.lsp.*` for documentation on any of the below functions.
    local opts = { buffer = ev.buf }
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set("n", "<space>wl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<space>f", function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})
