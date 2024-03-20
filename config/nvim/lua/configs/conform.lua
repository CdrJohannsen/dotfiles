local options = {
    lsp_fallback = true,

    formatters_by_ft = {
        lua = { "stylua" },
        c = { "clang_format" },
        asm = { "asmfmt" },
        python = { "isort", "black" },
        bash = { "beautysh" },
        sh = { "beautysh" },
        markdown = { "markdown-toc", "mdformat" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "jq" },
        yaml = { "yq" },
    },
}

require("conform").setup(options)
require("conform").formatters.black = {
    prepend_args = { "-l", "120" },
}
