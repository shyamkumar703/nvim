return {
    "p00f/clangd_extensions.nvim",
    ft = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
    config = function()
        require("clangd_extensions").setup({
            server = {
                cmd = {
                    "clangd",
                    "--background-index",
                    "--header-insertion=never",
                    "--function-arg-placeholders=false",
                    "--fallback-style={BasedOnStyle: LLVM, UseTab: Always, TabWidth: 4, IndentWidth: 4, AlignAfterOpenBracket: DontAlign, BinPackArguments: true, BinPackParameters: true}",
                },
                init_options = {
                    usePlaceholders = false,
                    completeUnimported = true,
                    clangdFileStatus = true,
                },
                capabilities = require("cmp_nvim_lsp").default_capabilities(),
                on_attach = function(client, bufnr)
                    -- Disable all built-in indentation for C/C++
                    vim.opt_local.cindent = false
                    vim.opt_local.smartindent = false
                    vim.opt_local.autoindent = false
                    vim.opt_local.indentexpr = ""
                    
                    -- Override all formatting commands to use LSP
                    vim.keymap.set("n", "=", function()
                        vim.lsp.buf.format({ async = false })
                    end, { buffer = true })
                    
                    vim.keymap.set("v", "=", function()
                        vim.lsp.buf.format({ async = false })
                        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", false)
                    end, { buffer = true })
                    
                    vim.keymap.set("n", "o", function()
                        vim.api.nvim_feedkeys("o", "n", false)
                        vim.schedule(function()
                            vim.lsp.buf.format({ async = false })
                        end)
                    end, { buffer = true })
                    
                    vim.keymap.set("n", "O", function()
                        vim.api.nvim_feedkeys("O", "n", false)
                        vim.schedule(function()
                            vim.lsp.buf.format({ async = false })
                        end)
                    end, { buffer = true })
                    
                    -- Format on save
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format({ async = false })
                        end,
                    })
                end,
            },
            extensions = {
                autoSetHints = false,
                inlay_hints = {
                    enable = false,
                },
            },
        })
    end,
}