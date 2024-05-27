return {
  'sindrets/diffview.nvim',
  config = function()
    require('diffview').setup {
      diff_binaries = false, -- Show diffs for binaries
      enhanced_diff_hl = true, -- See ':h diffview-config-enhanced_diff_hl'
      use_icons = true, -- Requires nvim-web-devicons
      icons = { -- Only applies when use_icons is true.
        folder_closed = '',
        folder_open = '',
      },
      signs = {
        fold_closed = '',
        fold_open = '',
      },
      view = {
        default = {
          layout = 'diff2_horizontal',
        },
      },
      file_panel = {
        win_config = {
          position = 'left',
          width = 35,
        },
      },
      keymaps = {
        view = {
          ['<tab>'] = require('diffview.config').diffview_callback 'toggle_files',
          ['q'] = require('diffview.config').diffview_callback 'close',
        },
        file_panel = {
          ['j'] = require('diffview.config').diffview_callback 'next_entry',
          ['k'] = require('diffview.config').diffview_callback 'prev_entry',
          ['<cr>'] = require('diffview.config').diffview_callback 'select_entry',
          ['o'] = require('diffview.config').diffview_callback 'select_entry',
          ['R'] = require('diffview.config').diffview_callback 'refresh_files',
          ['<tab>'] = require('diffview.config').diffview_callback 'toggle_files',
          ['q'] = require('diffview.config').diffview_callback 'close',
        },
        file_history_panel = {
          ['g!'] = require('diffview.config').diffview_callback 'options',
          ['<C-A-d>'] = require('diffview.config').diffview_callback 'open_in_diffview',
          ['y'] = require('diffview.config').diffview_callback 'copy_hash',
          ['zR'] = require('diffview.config').diffview_callback 'open_all_folds',
          ['zM'] = require('diffview.config').diffview_callback 'close_all_folds',
          ['j'] = require('diffview.config').diffview_callback 'next_entry',
          ['k'] = require('diffview.config').diffview_callback 'prev_entry',
          ['<cr>'] = require('diffview.config').diffview_callback 'select_entry',
          ['o'] = require('diffview.config').diffview_callback 'select_entry',
          ['<tab>'] = require('diffview.config').diffview_callback 'toggle_files',
          ['q'] = require('diffview.config').diffview_callback 'close',
        },
        option_panel = {
          ['<tab>'] = require('diffview.config').diffview_callback 'select',
          ['q'] = require('diffview.config').diffview_callback 'close',
        },
      },
    }
  end,
}
