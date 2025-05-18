return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "antosha417/nvim-lsp-file-operations", config = true },
        { "folke/neodev.nvim", opts = {} },
    },
    config = function()
        local lspconfig = require("lspconfig")

        local mason_lspconfig = require("mason-lspconfig")

        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        local keymap = vim.keymap

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                local opts = { buffer = ev.buf, silent = true }

                opts.desc = "Show references"
                keymap.set("n", "<leader>gR", "<cmd>Telescope lsp_references<CR>", opts)

                opts.desc = "Go to declaration"
                keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, opts)

                opts.desc = "Show definitions"
                keymap.set("n", "<leader>gd", "<cmd>Telescope lsp_definitions<CR>", opts)

                opts.desc = "Show LSP implementations"
                keymap.set("n", "<leader>gi", "<cmd>Telescope lsp_implementations<CR>", opts)

                opts.desc = "Show type definitions"
                keymap.set("n", "<leader>gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

                opts.desc = "See available code actions"
                keymap.set({ "n", "v" }, "<leader>ga", vim.lsp.buf.code_action, opts)

                opts.desc = "Smart rename"
                keymap.set("n", "<leader>gr", vim.lsp.buf.rename, opts)

                opts.desc = "Show buffer diagnostics"
                keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

                opts.desc = "Show line diagnostics"
                keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

                opts.desc = "Go to previous diagnostic"
                keymap.set("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end, opts)

                opts.desc = "Go to next diagnostic"
                keymap.set("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end, opts)

                opts.desc = "Show documentation for what is under cursor"
                keymap.set("n", "K", vim.lsp.buf.hover, opts)

                opts.desc = "Restart LSP"
                keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
            end,
        })

        local capabilities = cmp_nvim_lsp.default_capabilities()

        local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.diagnostic.config({ signs = { text = icon, texthl = hl, numhl = "" } })
        end

        mason_lspconfig.setup_handlers({
            function(server_name)
                lspconfig[server_name].setup({
                    capabilities = capabilities,
                })
            end,
            ["lua_ls"] = function()
                lspconfig["lua_ls"].setup({
                    capabilities = capabilities,
                    settings = {
                        Lua = {
                            diagnostics = {
                                globals = { "vim" },
                            },
                            completion = {
                                callSnippet = "Replace",
                            },
                        },
                    },
                })
            end,
            ["clangd"] = function()
                lspconfig["clangd"].setup({
                    capabilities = capabilities,
                    cmd = {
                        "clangd",
                        "--background-index",
                        "--clang-tidy",
                        "-j=12",
                        "--header-insertion=never",
                        "--compile-commands-dir=./build"
                    },
                })
            end,
        })
    end,
}
