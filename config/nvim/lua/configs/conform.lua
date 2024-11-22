local options = {
    lsp_fallback = true,

    formatters_by_ft = {
        lua = { "stylua" },
        c = { "clang_format" },
        cpp = { "clang_format" },
        asm = { "asmfmt" },
        python = { "isort", "black" },
        bash = { "beautysh" },
        sh = { "beautysh" },
        markdown = { "markdown-toc", "mdformat" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "jq" },
        yaml = { "yq" },
        cmake = { "cmake_format" },
        rust = { "rustfmt" },
    },
}

require("conform").setup(options)
require("conform").formatters.black = {
    prepend_args = { "-l", "120" },
}
require("conform").formatters.clang_format = {
    prepend_args = { "--style=file:/home/cdr-johannsen/.config/.clang-format" },
}
