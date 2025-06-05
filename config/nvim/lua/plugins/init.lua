return {
    {
        "stevearc/conform.nvim",
        config = function()
            require("configs.conform")
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local conf = require("nvchad.configs.lspconfig")
            local servers = { "html", "cssls", "clangd", "pyright", "cmake", "rust_analyzer", "jdtls" }

            for _, lsp in ipairs(servers) do
                require("lspconfig")[lsp].setup({
                    on_attach = conf.on_attach,
                    capabilities = conf.capabilities,
                    on_init = conf.on_init,
                })
            end
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        opts = function()
            local conf = require("nvchad.configs.cmp")
            conf.mapping["<Up>"] = conf.mapping["<S-Tab>"]
            conf.mapping["<Down>"] = conf.mapping["<Tab>"]
            conf.mapping["<Tab>"] = conf.mapping["<CR>"]
            conf.mapping["<CR>"] = nil
            return conf
        end,
    },
    {
        "nvim-tree/nvim-tree.lua",
        opts = {
            git = { enable = false },
        },
    },
    {
        "mfussenegger/nvim-dap",
    },
    {
        "mfussenegger/nvim-dap-python",
        ft = "python",
        dependencies = {
            "mfussenegger/nvim-dap",
            "rcarriga/nvim-dap-ui",
            "nvim-neotest/nvim-nio",
        },
        config = function(_, opts)
            local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
            require("dap-python").setup(path)
        end,
    },
    {
        "rcarriga/nvim-dap-ui",
        event = "VeryLazy",
        dependencies = "mfussenegger/nvim-dap",
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")
            dapui.setup()
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end
        end,
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        event = "VeryLazy",
        dependencies = {
            "williamboman/mason.nvim",
            "mfussenegger/nvim-dap",
        },
        opts = {
            handlers = {},
            ensure_installed = {
                "codelldb",
            },
        },
    },
    {
        "paopaol/cmp-doxygen",
        requires = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-treesitter/nvim-treesitter-textobjects",
        },
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-treesitter/nvim-treesitter-textobjects",
        },
    },

    {
        "luckasRanarison/tree-sitter-hyprlang",
        event = "VeryLazy",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
    },

    {
        "sindrets/diffview.nvim",
        event = "VeryLazy",
    },
    -- lazy.nvim:
    {
        "OXY2DEV/markview.nvim",
        lazy = false, -- Recommended
        -- ft = "markdown" -- If you decide to lazy-load anyway

        dependencies = {
            -- You will not need this if you installed the
            -- parsers manually
            -- Or if the parsers are in your $RUNTIMEPATH
            "nvim-treesitter/nvim-treesitter",

            "nvim-tree/nvim-web-devicons",
        },
    },
    {
        "https://gitlab.com/schrieveslaach/sonarlint.nvim",
        ft = {
            -- Tested and working
            "cs",
            "python",
            "cpp",
            "c",
            "java",
        },
        lazy = true,
        autostart=true,
        config = function()
            require("sonarlint").setup({
                server = {
                    cmd = {
                        "sonarlint-language-server",
                        -- Ensure that sonarlint-language-server uses stdio channel
                        "-stdio",
                        "-analyzers",
                        -- paths to the analyzers you need, using those for python and java in this example
                        vim.fn.expand("~/.local/share/nvim/mason/share/sonarlint-analyzers/sonarpython.jar"),
                        vim.fn.expand("~/.local/share/nvim/mason/share/sonarlint-analyzers/sonarcfamily.jar"),
                        vim.fn.expand("~/.local/share/nvim/mason/share/sonarlint-analyzers/sonarjava.jar"),
                    },
                    settings = {
                        sonarlint = {
                            pathToCompileCommands = "build/compile_commands.json",
                        },
                    },
                },
                filetypes = {
                    -- Tested and working
                    "cs",
                    "python",
                    "cpp",
                    "c",
                    "java",
                },
            })
        end,
    },
}
