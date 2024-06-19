return {
  {
    "EdenEast/nightfox.nvim",
    opts = {
      options = {
        transparent = true,
      },
    },
  },
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      vim.g.gruvbox_material_enable_italic = true
      vim.g.gruvbox_material_background = "hard"
    end,
  },
  {
    "svermeulen/text-to-colorscheme.nvim",
    opts = {
      ai = {
        openai_api_key = os.getenv("OPENAI_API_KEY"),
        gpt_model = "gpt-4o",
      },
    },
  },
}
