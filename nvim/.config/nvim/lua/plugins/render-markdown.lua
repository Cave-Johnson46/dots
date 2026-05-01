return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" }, -- if you use the mini.nvim suite
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {
    link = {
      enabled = true,
      render_modes = false,
      footnote = {
        enabled = true,
        icon = "󰯔 ",
        body = function(ctx)
          return ctx.text
        end,
        superscript = true,
        prefix = "",
        suffix = "",
      },
      image = "󰥶 ",
      image_custom = true,
      email = "󰀓 ",
      hyperlink = "󰌹 ",
      highlight = "RenderMarkdownLink",
      highlight_title = "RenderMarkdownLinkTitle",
      wiki = {
        enabled = true,
        icon = "󱗖 ",
        body = function()
          return nil
        end,
        highlight = "RenderMarkdownWikiLink",
        scope_highlight = nil,
      },
    },
    heading = { border = true },
    indent = { enabled = true },
  },
}
