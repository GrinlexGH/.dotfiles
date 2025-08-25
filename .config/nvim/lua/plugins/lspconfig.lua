return {
    "neovim/nvim-lspconfig",
    dependencies = {
        { "antosha417/nvim-lsp-file-operations", lazy = true, opts = { }, },
        "saghen/blink.cmp",
    },
    ---@module "lspconfig"
    ---@type lspconfig.Config
    opts = {
        servers = {
            lua_ls = {
                settings = {
                    Lua = {
                        completion = {
                            callSnippet = "Replace",
                        },
                        diagnostics = {
                            disable = { "missing-fields", },
                        },
                    },
                },
            },
            clangd = {
                cmd = {
                    "clangd",
                    "--background-index",
                    "--clang-tidy",
                    "-j=12",
                    "--header-insertion=never",
                    "--compile-commands-dir=build",
                    "--enable-config",
                },
            },
            jdtls = { },
            cmake = { },
            kotlin_lsp = { },
        },
    },
    config = function(_, opts)
        for server, config in pairs(opts.servers) do
            config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
            vim.lsp.config(server, config)
            vim.lsp.enable(server)
        end

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
            update_in_insert = true,
        })
    end,
    keys = {
        { "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", desc = "Buffer diagnostics" },
        { "<leader>d", vim.diagnostic.open_float, desc = "Line diagnostics" },

        { "<leader>gR", "<cmd>Telescope lsp_references<CR>", desc = "Show references" },
        { "<leader>gD", vim.lsp.buf.declaration, desc = "Go to declaration" },

        { "<leader>gd", "<cmd>Telescope lsp_definitions<CR>", desc = "Show definitions", },
        { "<leader>gi", "<cmd>Telescope lsp_implementations<CR>", desc = "Show implementations", },
        { "<leader>gt", "<cmd>Telescope lsp_type_definitions<CR>", desc = "Show type definitions", },

        { "<leader>ga", vim.lsp.buf.code_action, desc = "Code actions", mode = { "n", "v" }, },
        { "<leader>gr", vim.lsp.buf.rename, desc = "Smart rename" },

        { "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end, desc = "Prev diagnostic" },
        { "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end, desc = "Next diagnostic" },

        { "K", vim.lsp.buf.hover, desc = "Hover documentation" },

        { "<leader>rs", ":LspRestart<CR>", desc = "Restart LSP" },
    },
}
