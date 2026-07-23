return {
    "neovim/nvim-lspconfig",
    dependencies = {
        { "antosha417/nvim-lsp-file-operations", lazy = true, opts = { }, },
    },
    opts = {
        servers = {
            lua_ls = {
                settings = {
                    Lua = {
                        diagnostics = {
                            disable = { "missing-fields" }
                        }
                    }
                }
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
            kotlin_lsp = { }
        }
    },
    config = function(_, opts)
        for server, config in pairs(opts.servers) do
            config.capabilities = require'blink.cmp'.get_lsp_capabilities(config.capabilities)
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
                    [vim.diagnostic.severity.INFO] = ""
                }
            }
        })
    end,
    keys = {
        { "K", vim.lsp.buf.hover, desc = "Hover infor (vim)" },
        { "<leader>d", vim.diagnostic.open_float, desc = "Line diagnostics (vim)" },
        { "<leader>gD", vim.lsp.buf.declaration, desc = "Go to declaration (vim)" },
        { "<leader>gr", vim.lsp.buf.rename, desc = "Smart rename (vim)" },
        { "<leader>ga", vim.lsp.buf.code_action, desc = "Code actions (vim)", mode = { "n", "v" } },
        { "<leader>rs", "<cmd>LspRestart<cr>", desc = "Restart LSP (vim)" }
    }
}
