local fn, api = vim.fn, vim.api
-- Install packer
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

api.nvim_exec(
    [[
    augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
    augroup end
    ]],
    false
)

return require('packer').startup({function(use)
    -- Packer
    use 'wbthomason/packer.nvim'
    use 'lewis6991/impatient.nvim'

    -- libs
    use 'tpope/vim-repeat'

    -- editing
    use 'tpope/vim-surround'
    use 'tpope/vim-commentary'

    -- movement and search
    use 'junegunn/vim-slash'
    use 'markonm/traces.vim'
    use {
        'tpope/vim-scriptease',
        cmd = {
            'Messages', --view messages in quickfix list
            'Verbose', -- view verbose output in preview window.
        },
    }

    -- searching and file browsing
    use 'nvim-lua/popup.nvim'
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use {
        'nvim-telescope/telescope-project.nvim',
        requires = {
            'nvim-lua/telescope.nvim',
        },
    }
    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make'
    }

    use 'mhinz/vim-startify'

    -- text objects and motions
    use 'wellle/targets.vim'
    use 'jiangmiao/auto-pairs'
    use 'alvan/vim-closetag'
    use 'matze/vim-move'
    use 'godlygeek/tabular'

    -- syntax and languages
    use {'lervag/vimtex',
        ft = { 'tex' }
    }
    use 'neovim/nvim-lspconfig'
    use 'wbthomason/lsp-status.nvim'
    use {
        "folke/trouble.nvim",
        cmd = "LspTrouble", -- lazy load on command LspTrouble
        config = function()
            require("trouble").setup({
                auto_preview = false,
                auto_fold = true,
                auto_close = true,
                use_lsp_diagnostic_signs = true,
            })
        end,
    }
    use {
        "hrsh7th/nvim-cmp",
        requires = {
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-nvim-lsp',
            'saadparwaiz1/cmp_luasnip',
            'onsails/lspkind-nvim',
        }
    }
    use 'L3MON4D3/LuaSnip'
    use 'rafamadriz/friendly-snippets'

    -- theme
    use 'deviantfero/wpgtk.vim'
    use 'rktjmp/lush.nvim'
    use {
        'tjdevries/express_line.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        }
    }
    use 'kyazdani42/nvim-web-devicons'
    use 'kyazdani42/nvim-tree.lua'

    -- version control
    use 'junegunn/gv.vim'
    use 'tpope/vim-fugitive'
    use 'rhysd/git-messenger.vim'
    use {
        'lewis6991/gitsigns.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        }
    }
    use 'rhysd/committia.vim'

    -- debugger
    use {
        "rcarriga/nvim-dap-ui",
        requires = {
            "mfussenegger/nvim-dap"
        }
    }

end,
    config = {
        display = {
            open_fn = function()
                return require('packer.util').float({ border = 'single' })
            end
        },
        -- Move to lua dir so impatient.nvim can cache it
        compile_path = vim.fn.stdpath('config')..'/lua/packer_compiled.lua'
    }
})
