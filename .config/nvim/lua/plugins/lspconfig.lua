return {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
        { "hrsh7th/cmp-nvim-lsp", },
        { "antosha417/nvim-lsp-file-operations", opts = { }, },
        "folke/lazydev.nvim",
    },
    config = function()
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                local base_opts = { buffer = ev.buf, silent = true }
                local map = function(mode, lhs, rhs, desc)
                    local opts = vim.tbl_extend("force", base_opts, { desc = desc })
                    vim.keymap.set(mode, lhs, rhs, opts)
                end
                map("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", "Buffer diagnostics")
                map("n", "<leader>d", vim.diagnostic.open_float, "Line diagnostics")

                map("n", "<leader>gR", "<cmd>Telescope lsp_references<CR>", "Show references")
                map("n", "<leader>gD", vim.lsp.buf.declaration, "Go to declaration")
                map("n", "<leader>gd", "<cmd>Telescope lsp_definitions<CR>", "Show definitions")
                map("n", "<leader>gi", "<cmd>Telescope lsp_implementations<CR>", "Show implementations")
                map("n", "<leader>gt", "<cmd>Telescope lsp_type_definitions<CR>", "Show type definitions")
                map({ "n", "v" }, "<leader>ga", vim.lsp.buf.code_action, "Code actions")
                map("n", "<leader>gr", vim.lsp.buf.rename, "Smart rename")
                map("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end, "Prev diagnostic")
                map("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end, "Next diagnostic")
                map("n", "K", vim.lsp.buf.hover, "Hover documentation")
                map("n", "<leader>rs", ":LspRestart<CR>", "Restart LSP")
            end,
        })

        vim.diagnostic.config({
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = " ",
                    [vim.diagnostic.severity.WARN] = " ",
                    [vim.diagnostic.severity.HINT] = "󰠠 ",
                    [vim.diagnostic.severity.INFO] = " ",
                },
                numhl = {
                    [vim.diagnostic.severity.ERROR] = "",
                    [vim.diagnostic.severity.WARN] = "",
                    [vim.diagnostic.severity.HINT] = "",
                    [vim.diagnostic.severity.INFO] = "",
                },
            },
        })

        local lspconfig = require("lspconfig")
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        lspconfig.clangd.setup({
            capabilities = capabilities,
            cmd = {
                "clangd",
                "--background-index",
                "--clang-tidy",
                "-j=5",
                "--header-insertion=never",
                "--compile-commands-dir=build"
            },
        })

        lspconfig.lua_ls.setup({
            capabilities = capabilities,
            settings = {
                Lua = {
                    completion = {
                        callSnippet = "Replace",
                    },
                },
            },
        })

        lspconfig.jdtls.setup({ capabilities = capabilities, })

        lspconfig.glsl_analyzer.setup({})

        lspconfig.cmake.setup({})

        vim.lsp.enable('kotlin_lsp')
    end,
}
