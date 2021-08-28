;;; DEFAULT CONFIGS

;; Defaut configuration for a server
(fn new_config []
  ; Extra bindings to servers
  (fn on_attach [client bufnr]
    (fn buf_set_keymap [...] (vim.api.nvim_buf_set_keymap bufnr ...))
    (fn buf_set_option [...] (vim.api.nvim_buf_set_option bufnr ...))

    (if (= client.resolved_capabilities.document_highlight true)
      (buf_set_keymap "n" "<space>f" "<cmd>lua vim.lsp.buf.formatting()<CR>"  {:noremap true :silent true})
      ; else
      (buf_set_keymap "n" "<space>f" "<cmd>lua vim.lsp.buf.formatting()<CR>"  {:noremap true :silent true}))

    (if (= client.resolved_capabilities.document_highlight true)
      (vim.api:nvim_exec "
                         augroup lsp_document_highlight
                         autocmd! * <buffer>
                         autocmd CursorHold <buffer> silent! lua vim.lsp.buf.document_highlight()
                         autocmd CursorMoved <buffer> silent! lua vim.lsp.buf.clear_references()
                         augroup END
                         ")))

  ; Config
  (let [capabilities (vim.lsp.protocol.make_client_capabilities)]
    (set capabilities.textDocument.completion.completionItem.snippetSupport true)
    (values {:capabilities capabilities :on_attach on_attach})))

;;; START LSP

;; Configure all servers
(fn setup_servers []
  (let [lspinstall (require :lspinstall)
        lspconfig (require :lspconfig)]
    (lspinstall.setup)

    (each [_key value (ipairs (lspinstall.installed_servers))]
          (let [config (new_config)]
            (if (= value "lua")
              (set config.settings {}))

            (if (= config.filetypes nil)
              (set config.filetypes [ value ]))

            ((. lspconfig value :setup) config)))

    ;; Runs on install
    (set lspinstall.post_install_hook (fn []
                                        (setup_servers)
                                        (vim.cmd "bufdo e")))))

;; RUNS IT
;(inspect (pairs (lspinstall:installed_servers)))
(setup_servers)

(values nil)
