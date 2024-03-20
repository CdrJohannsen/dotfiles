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
            local servers = { "html", "cssls", "tsserver", "clangd", "pyright" }

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
            git = { enable = true },
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
            "nvim-neotest/nvim-nio"
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
        "smoka7/multicursors.nvim",
        event = "VeryLazy",
        dependencies = {
            "smoka7/hydra.nvim",
        },
        opts = {},
        cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
        keys = {
            {
                mode = { "v", "n" },
                "<Leader>m",
                "<cmd>MCstart<cr>",
                desc = "Create a selection for selected text or word under the cursor",
            },
        },
    },
}
