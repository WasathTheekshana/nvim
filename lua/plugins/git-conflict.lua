return {
  'akinsho/git-conflict.nvim',
  version = '*',
  config = function()
    require('git-conflict').setup {
      default_mappings = false, -- Disable default buffer local mappings
      default_commands = true, -- Enable commands created by this plugin
      disable_diagnostics = false, -- Enable diagnostics in a buffer whilst it is conflicted
      list_opener = 'copen', -- Command or function to open the conflicts list
      highlights = { -- They must have background color, otherwise the default color will be used
        incoming = 'DiffAdd',
        current = 'DiffText',
      },
      mappings = { -- Custom mappings
        ours = 'o', -- choose ours
        theirs = 't', -- choose theirs
        none = '0', -- choose none
        both = 'b', -- choose both
        next = 'n', -- move to next conflict
        prev = 'p', -- move to previous conflict
      },
    }
  end,
}
