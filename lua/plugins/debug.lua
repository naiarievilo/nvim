return {
  'mfussenegger/nvim-dap',
  dependencies = {
    -- Debugger UI
    'rcarriga/nvim-dap-ui',

    -- Install debug adapters
    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',

    -- Add your own debuggers here
    -- e.g., 'leoluz/nvim-dap-go',
  },
  config = function()
    require('mason-nvim-dap').setup {
      -- Setup bebuggers with reasonable configurations
      automatic_setup = true,

      automatic_installation = false,

      -- Provide additional configuration to the handlers,
      handlers = {},

      -- Check for required language debuggers
      ensure_installed = {
        'delve',
      },
    }

    local dap = require 'dap'
    local dapui = require 'dapui'

    -- Basic debugging keymaps
    vim.keymap.set('n', '<F5>', dap.continue, { desc = 'Debug: Start/Continue' })
    vim.keymap.set('n', '<F1>', dap.step_into, { desc = 'Debug: Step Into' })
    vim.keymap.set('n', '<F2>', dap.step_over, { desc = 'Debug: Step Over' })
    vim.keymap.set('n', '<F3>', dap.step_out, { desc = 'Debug: Step Out' })
    vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
    vim.keymap.set('n', '<leader>B', function()
      dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
    end, { desc = 'Debug: Set Breakpoint' })

    -- Dap UI setup
    --   see `:help nvim-dap-ui`
    dapui.setup {
      controls = {
        element = 'repl',
        enabled = true,
        icons = {
          disconnect = "",
          pause = "",
          play = "",
          run_last = "",
          step_back = "",
          step_into = "",
          step_out = "",
          step_over = "",
          terminate = ""
        },
      },
      element_mappings = {},
      expand_lines = true,
      floating = { border = 'rounded', mappings = { close = { 'q', '<Esc>' } } },
      force_buffers = true,
      icons = { expanded = '', collapsed = '', current_frame = '*' },
      layouts = { {
        elements = { {
          id = "scopes",
          size = 0.25
        }, {
          id = "breakpoints",
          size = 0.25
        }, {
          id = "stacks",
          size = 0.25
        }, {
          id = "watches",
          size = 0.25
        } },
        position = "left",
        size = 40
      }, {
        elements = { {
          id = "repl",
          size = 0.5
        }, {
          id = "console",
          size = 0.5
        } },
        position = "bottom",
        size = 10
      } },
      mappings = {
        edit = "e",
        expand = { "<CR>", "<2-LeftMouse>" },
        open = "o",
        remove = "d",
        repl = "r",
        toggle = "t"
      },
      render = {
        indent = 1,
        max_value_lines = 100
      }
    }

    -- Toggle to see last session result.
    -- Without this, you can't see session output in case of unhandled exception.
    vim.keymap.set('n', '<F7>', dapui.toggle, { desc = 'Debug: See last session result.' })

    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close

    -- Install languages specific configs here
    -- e.g., `require('dap-go').setup()`
  end
}
