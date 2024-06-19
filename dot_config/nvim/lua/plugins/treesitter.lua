return {
  -- add more treesitter parsers
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "bash",
      "csv",
      "dockerfile",
      "go",
      "html",
      "javascript",
      "json",
      "lua",
      "markdown",
      "markdown_inline",
      "python",
      "query",
      "regex",
      "rust",
      "toml",
      "tsv",
      "tsx",
      "typescript",
      "vim",
      "yaml",
    },
  },
}
