return {
  -- Tema Oxocarbon
  {
    "nyoom-engineering/oxocarbon.nvim",
    config = function()
      -- Establecer el fondo a oscuro
      vim.opt.background = "dark"
      -- Aplicar el tema Oxocarbon
      vim.cmd("colorscheme oxocarbon")
    end
  }
}
