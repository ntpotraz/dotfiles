local autocmd = vim.api.nvim_create_autocmd

-- Highlight yanked text
autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Roslyn semantic tokens layer on top of treesitter captures using the generic
-- @lsp.type.* groups, which washes out the colorscheme. Treesitter alone
-- highlights C# well, so keep Roslyn for LSP features only.
autocmd("LspAttach", {
  desc = "[R]oslyn: disable semantic tokens so treesitter provides highlighting",
  group = vim.api.nvim_create_augroup("roslyn-no-semantic-tokens", { clear = true }),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.name == "roslyn_ls" then
      client.server_capabilities.semanticTokensProvider = nil
      vim.lsp.semantic_tokens.enable(false, { bufnr = args.buf, client_id = client.id })
    end
  end,
})

-- Snacks.rename integration with oil
vim.api.nvim_create_autocmd("User", {
  pattern = "OilActionsPost",
  callback = function(event)
      if event.data.actions.type == "move" then
          Snacks.rename.on_rename_file(event.data.actions.src_url, event.data.actions.dest_url)
      end
  end,
})

