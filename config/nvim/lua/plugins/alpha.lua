local config = function()
  local alpha = require "alpha"
  local dashboard = require "alpha.themes.dashboard"

  -- Encabezado con colores personalizados
  dashboard.section.header.val = {
    '                     .:::!~!!!!!:.',
    '                  .xUHWH!! !!?M88WHX:.',
    '                .X*#M@$!!  !X!M$$$$$$WWx:.',
    '               :!!!!!!?H! :!$!$$$$$$$$$$8X:',
    '              !!~  ~:~!! :~!$!#$$$$$$$$$$8X:',
    '             :!~::!H!<   ~.U$X!?R$$$$$$$$MM!',
    '             ~!~!!!!~~ .:XW$$$U!!?$$$$$$RMM!',
    '               !:~~~ .:!M"T#$$$$WX??#MRRMMM!',
    '               ~?WuxiW*`   `"#$$$$8!!!!??!!!',
    '             :X- M$$$$       `"T#$T~!8$WUXU~',
    '            :%`  ~#$$$m:        ~!~ ?$$$$$$',
    '          :!`.-   ~T$$$$8xx.  .xWW- ~""##*"',
    '.....   -~~:<` !    ~?T#$$@@W@*?$$      /`',
    'W$@@M!!! .!~~ !!     .:XUW$W!~ `"~:    :',
    '#"~~`.:x%`!!  !H:   !WM$$$$Ti.: .!WUn+!`',
    ':::~:!!`:X~ .: ?H.!u "$$$B$$$!W:U!T$$M~',
    '.~~   :X@!.-~   ?@WTWo("*$$$W$TH$! `',
    'Wi.~!X$?!-~   :: ?$$$B$Wu("**$RM!',
    '$R@i.~~ !    ::   ~$$$$$B$$en:``',
    '?MXT@Wx.~   ::     ~"##*$$$$M'
  }
  dashboard.section.header.opts.hl = "AlphaHeader"

  -- Botones
  dashboard.section.buttons.val = {
    dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
    dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
    dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
    -- dashboard.button("t", "Find text", ":Telescope live_grep <CR>"),
    -- dashboard.button("c", "Configuration", ":e ~/.config/nvim/init.vim<CR>"),
    dashboard.button('u', '󰮭  Update', '<CMD>Lazy sync<CR>'),
    dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
  }

  -- Personaliza los colores de los botones
  for _, button in ipairs(dashboard.section.buttons.val) do
    button.opts.hl = "AlphaButtons" -- Color del texto del botón
    button.opts.hl_shortcut = "AlphaShortcut" -- Color del atajo del botón
  end

  -- Pie de página
  local function footer()
    return "No te detengas hasta que estés orgulloso..."
  end
  dashboard.section.footer.val = footer()
  dashboard.section.footer.opts.hl = "AlphaFooter"

  alpha.setup(dashboard.opts)

  -- Grupos de colores personalizados
  vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#ff79c6", bold = true })
  vim.api.nvim_set_hl(0, "AlphaButtons", { fg = "#8be9fd" })
  vim.api.nvim_set_hl(0, "AlphaShortcut", { fg = "#ffb86c",  bold = true })
  vim.api.nvim_set_hl(0, "AlphaFooter", { fg = "#50fa7b", italic = true })
end

return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  config = config,
  dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
