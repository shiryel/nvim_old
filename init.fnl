(global inspect (fn [...] (print (vim.inspect ...))))

(global reload (fn [] 
                 (set package.loaded.init nil)
                 (set package.loaded.lsp nil)
                 (set package.loaded.configs nil)
                 (set package.loaded.plugins nil)
                 (vim.cmd "cd ~/.config/nvim")
                 (vim.cmd "make rebuild")
                 (vim.cmd "luafile $MYVIMRC")))

(require :plugins)
(require :lsp)
(require :configs)

(vim.cmd "colorscheme fennec")

;(vim.cmd "autocmd BufWritePost plugins.lua PackerCompile")
