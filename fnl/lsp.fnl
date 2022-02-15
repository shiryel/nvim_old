(fn on_attach [client bufnr]
  (let [opts {:noremap true :silent true}]
  (fn buf_set_keymap [...] (vim.api.nvim_buf_set_keymap bufnr ...))
  (fn buf_set_option [...] (vim.api.nvim_buf_set_option bufnr ...))

  ;(inspect client.resolved_capabilities)

  ; completion
  (buf_set_option "omnifunc" "v:lua.vim.lsp.omnifunc")

  ; diagnostics
  (buf_set_keymap "n" "<leader>q" "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>" opts)
  (buf_set_keymap "n" "<C-g>" "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>" opts)
  (buf_set_keymap "n" "<C-G>" "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>" opts)

  ; formatting
  (if client.resolved_capabilities.document_formatting
    (do
      (buf_set_keymap "n" "<leader>f" "<cmd>lua vim.lsp.buf.formatting()<CR>" opts)
      (vim.api.nvim_exec "
                         augroup Format
                         autocmd! * <buffer>
                         autocmd BufWritePost <buffer> lua require'lsp.formatting'.format()
                         augroup END
                         " {}))
    ; else
    (when client.resolved_capabilities.document_range_formatting
      (buf_set_keymap "n" "<leader>f" "<cmd>lua vim.lsp.buf.range_formatting()<CR>" opts)))

  ; Go to...
  (when client.resolved_capabilities.goto_definition
    (buf_set_keymap "n" "gD" "#* <cmd>lua vim.lsp.buf.definition()<cr>" opts))
  (when client.resolved_capabilities.declaration
    (buf_set_keymap "n" "gd" "#* <cmd>lua vim.lsp.buf.declaration()<cr>" opts))
  (when client.resolved_capabilities.type_definition
    (buf_set_keymap "n" "<leader>gt" "<cmd>lua vim.lsp.buf.type_definition()<cr>" opts))
  (when client.resolved_capabilities.implementation
    (buf_set_keymap "n" "<leader>gi" "<cmd>lua vim.lsp.buf.implementation()<cr>" opts))
  (when client.resolved_capabilities.find_references
    (buf_set_keymap "n" "<leader>gr" "<cmd>lua vim.lsp.buf.references()<cr>" opts))

  ; Help
  (if client.resolved_capabilities.hover
    (do 
      (buf_set_keymap "n" "<leader>h" "<cmd>lua vim.lsp.buf.hover()<cr>" opts)
      (buf_set_keymap "n" "<leader>H" "<cmd>lua vim.lsp.buf.signature_help()<cr>" opts))
    ; else
    (when client.resolved_capabilities.signature_help
      (buf_set_keymap "n" "<leader>h" "<cmd>lua vim.lsp.buf.signature_help()<cr>" opts)
    ))

  ; Workspaces
  (when client.resolved_capabilities.workspace_folder_properties.supported
    (buf_set_keymap "n" "<leader>wr" "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>" opts)
    (buf_set_keymap "n" "<leader>wl" "<cmd>lua vim.lsp.buf.list_workspace_folders()<cr>" opts))

  ; Rename
  (when client.resolved_capabilities.rename
    (buf_set_keymap "n" "<leader>rn" "<cmd>lua vim.lsp.buf.rename()<cr>" opts))

  ; Highlight
  (when client.resolved_capabilities.document_highlight
    (vim.api.nvim_exec "
                       augroup lsp_document_highlight
                       autocmd! * <buffer>
                       autocmd CursorHold <buffer> silent! lua vim.lsp.buf.document_highlight()
                       autocmd CursorMoved <buffer> silent! lua vim.lsp.buf.clear_references()
                       augroup END
                       " {}))
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
  (lspconfig.gdscript.setup {
    :on_attach on_attach
    :capabilities (capabilities)
    :flags {
      :debounce_text_changes 50}
  })
  (lspconfig.efm.setup {
    :on_attach on_attach
    :capabilities (capabilities)
    :filetypes [ "gdscript" ]
    ;:root_dir (vim.loop.cwd)
    :flags {
      :debounce_text_changes 50}
    :init_options {
      :documentFormatting true}
    :settings {
      :rootMarkers ["project.godot" ".git/"]
      :lintDebounce 100
      :languages {
        :gdscript {
          :formatCommand "gdformat -l 100"
          :formatStdin true}}}
    :cmd {1 "efm-langserver"}
  })
  (lspconfig.zls.setup {
    :on_attach on_attach
    :capabilities (capabilities)
    :cmd {1 "zls"}
  })
  (lspconfig.hls.setup {
    :on_attach on_attach
    :capabilities (capabilities)
    :cmd {1 "haskell-language-server"}
  }))
