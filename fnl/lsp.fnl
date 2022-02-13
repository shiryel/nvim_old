(fn on_attach [client bufnr]
  (fn buf_set_keymap [...] (vim.api.nvim_buf_set_keymap bufnr ...))
  (fn buf_set_option [...] (vim.api.nvim_buf_set_option bufnr ...))

  (buf_set_option "omnifunc" "v:lua.vim.lsp.omnifunc")

  (if (= client.resolved_capabilities.document_highlight true)
    (buf_set_keymap "n" "<space>f" "<cmd>lua vim.lsp.buf.formatting()<CR>"  {:noremap true :silent true})
    ; else
    (buf_set_keymap "n" "<space>f" "<cmd>lua vim.lsp.buf.formatting()<CR>"  {:noremap true :silent true})
  )

  (if  (= client.resolved_capabilities.document_highlight true)
    (vim.api.nvim_exec "
                       augroup lsp_document_highlight
                       autocmd! * <buffer>
                       autocmd CursorHold <buffer> silent! lua vim.lsp.buf.document_highlight()
                       autocmd CursorMoved <buffer> silent! lua vim.lsp.buf.clear_references()
                       augroup END
                       ")
  ))

(fn capabilities []
  (let [capabilities (vim.lsp.protocol.make_client_capabilities)]
    (set capabilities.textDocument.completion.completionItem.snippetSupport true)
    (values capabilities)))

(let [lspconfig (require :lspconfig)]
  (lspconfig.elixirls.setup {
    :on_attach on_attach
    :capabilities (capabilities)
    :cmd {1 "elixir-ls"}
  })
  (lspconfig.nimls.setup {
    :on_attach on_attach
    :capabilities (capabilities)
    :cmd {1 "nimlsp"}
  })
  (lspconfig.hls.setup {
    :on_attach on_attach
    :capabilities (capabilities)
    :cmd {1 "haskell-language-server"}
  }))
