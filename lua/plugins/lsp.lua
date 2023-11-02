return {
  -- LSP Configuration & Plugins
  'neovim/nvim-lspconfig',
  dependencies = {
    -- Automatically install LSPs to stdpath for neovim
    { 'williamboman/mason.nvim', config = true },
    'williamboman/mason-lspconfig.nvim',

    -- Useful status updates for LSP
    {
      'j-hui/fidget.nvim',
      tag = 'legacy',
      opts = {}
    },

    -- Additional lua configuration, makes nvim stuff amazing!
    'folke/neodev.nvim',
  },
  config = function()
    --  this function gets run when an lsp connects to a particular buffer.
    local on_attach = function(_, bufnr)
      -- note: remember that lua is a real programming language, and as such it is possible
      -- to define small helper and utility functions so you don't have to repeat yourself
      -- many times.
      --
      -- in this case, we create a function that lets us more easily define mappings specific
      -- for lsp related items. it sets the mode, buffer and description for us each time.
      local nmap = function(keys, func, desc)
        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
      end

      nmap('<leader>Ln', vim.lsp.buf.rename, 'Rename')
      nmap('<leader>La', vim.lsp.buf.code_action, 'Code action')

      nmap('<leader>Ld', vim.lsp.buf.definition, 'Go to [d]efinition')
      nmap('<leader>Lr', require('telescope.builtin').lsp_references, 'Go to references')
      nmap('<leader>Li', require('telescope.builtin').lsp_implementations, 'Go to [i]mplementation')
      nmap('<leader>LT', vim.lsp.buf.type_definition, '[T]ype definition')
      nmap('<leader>Ls', require('telescope.builtin').lsp_document_symbols, 'Document: [s]ymbols')
      nmap('<leader>LS', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Workspace: [S]ymbols')

      -- see `:help K` for why this keymap
      nmap('K', vim.lsp.buf.hover, 'Hover documentation')
      nmap('<c-k>', vim.lsp.buf.signature_help, 'Signature documentation')

      -- lesser used lsp functionality
      nmap('<leader>LD', vim.lsp.buf.declaration, 'Go to [D]eclaration')
      nmap('<leader>LA', vim.lsp.buf.add_workspace_folder, 'Workspace: [A]dd folder')
      nmap('<leader>LR', vim.lsp.buf.remove_workspace_folder, 'Workspace: [R]emove folder')
      nmap('<leader>LL', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, 'Workspace: [L]ist folders')

      local wk = require('which-key')
      wk.register({
        L = { name = 'LSP...' },
      }, { prefix = '<leader>', buffer = bufnr })

      -- create a command `:format` local to the lsp buffer
      vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
      end, { desc = 'Format current buffer with LSP' })
    end

    -- enable the following language servers
    --  feel free to add/remove any lsps that you want here. they will automatically be installed.
    --
    --  add any additional override configuration in the following tables. they will be passed to
    --  the `settings` field of the server config. you must look up that documentation yourself.
    --
    --  if you want to override the default filetypes that your language server will attach to you can
    --  define the property 'filetypes' to the map in question.
    local servers = {
      -- clangd = {},
      -- gopls = {},
      -- pyright = {},
      -- rust_analyzer = {},
      -- tsserver = {},
      -- html = { filetypes = { 'html', 'twig', 'hbs'} },

      lua_ls = {
        lua = {
          workspace = { checkthirdparty = false },
          telemetry = { enable = false },
        },
      },
    }

    -- setup neovim lua configuration
    require('neodev').setup()

    -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)


    -- ensure the servers above are installed
    local mason_lspconfig = require 'mason-lspconfig'

    mason_lspconfig.setup {
      ensure_installed = vim.tbl_keys(servers),
    }

    mason_lspconfig.setup_handlers {
      function(server_name)
        require('lspconfig')[server_name].setup {
          capabilities = capabilities,
          on_attach = on_attach,
          settings = servers[server_name],
          filetypes = (servers[server_name] or {}).filetypes,
        }
      end
    }

    -- autoformat.lua
    --
    -- Use your language server to automatically format your code on save.
    -- Adds additional commands as well to manage the behavior
    --
    -- Switch for controlling whether you want autoformatting.
    --  Use :KickstartFormatToggle to toggle autoformatting ON or OFF
    local format_is_enabled = true
    vim.api.nvim_create_user_command('AutoformatToggle', function()
      format_is_enabled = not format_is_enabled
      print('Setting autoformatting to: ' .. tostring(format_is_enabled))
    end, {})

    -- Create an augroup that is used for managing our formatting autocmds.
    --      We need one augroup per client to make sure that multiple clients
    --      can attach to the same buffer without interfering with each other.
    local _augroups = {}
    local get_augroup = function(client)
      if not _augroups[client.id] then
        local group_name = 'lsp-format-' .. client.name
        local id = vim.api.nvim_create_augroup(group_name, { clear = true })
        _augroups[client.id] = id
      end

      return _augroups[client.id]
    end

    -- Whenever an LSP attaches to a buffer, we will run this function.
    -- See `:help LspAttach` for more information about this autocmd event.
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('lsp-attach-format', { clear = true }),
      -- This is where we attach the autoformatting for reasonable clients
      callback = function(args)
        local client_id = args.data.client_id
        local client = vim.lsp.get_client_by_id(client_id)
        local bufnr = args.buf

        -- Only attach to clients that support document formatting
        if not client.server_capabilities.documentFormattingProvider then
          return
        end

        -- Tsserver usually works poorly. Sorry you work with bad languages
        -- You can remove this line if you know what you're doing :)
        if client.name == 'tsserver' then
          return
        end

        -- Create an autocmd that will run *before* we save the buffer.
        --  Run the formatting command for the LSP that has just attached.
        vim.api.nvim_create_autocmd('BufWritePre', {
          group = get_augroup(client),
          buffer = bufnr,
          callback = function()
            if not format_is_enabled then
              return
            end

            vim.lsp.buf.format {
              async = false,
              filter = function(c)
                return c.id == client.id
              end,
            }
          end,
        })
      end,
    })
  end
}
