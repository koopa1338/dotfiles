vim.cmd [[packadd packer.nvim]]
vim._update_package_paths()
return require('packer').startup(function()
    -- Packer
    use {'wbthomason/packer.nvim', opt = true}

    -- libs
    use 'tpope/vim-repeat'

    -- editing
    use 'tpope/vim-surround'
    use 'tpope/vim-commentary'
    use 'svermeulen/vim-subversive'

    -- movement and search
    use 'junegunn/vim-slash'
    use 'markonm/traces.vim'

    -- searching and file browsing
    use 'junegunn/fzf.vim'
    use {'stsewd/fzf-checkout.vim',
        opt = true,
        requires = {'junegunn/fzf.vim'}}

    -- text objects and motions
    use 'wellle/targets.vim'
    use 'jiangmiao/auto-pairs'
    use 'alvan/vim-closetag'
    use 'matze/vim-move'
    use 'godlygeek/tabular'

    -- snippets
    use 'SirVer/ultisnips'

    -- syntax and languages
    use {'lervag/vimtex', ft = {'tex'}}
    use 'neovim/nvim-lspconfig'
    use 'nvim-lua/completion-nvim'
    use 'nvim-lua/diagnostic-nvim'

    -- theme
    use 'bling/vim-airline'
    use 'deviantfero/wpgtk.vim'
    use 'vim-airline/vim-airline-themes'
    use {'lambdalisue/fern-renderer-nerdfont.vim',
        opt = true,
        requires = {'lambdalisue/fern.vim'}}
    use 'lambdalisue/nerdfont.vim'

    -- version control
    use 'junegunn/gv.vim'
    use 'tpope/vim-fugitive'
    use 'rhysd/git-messenger.vim'
    use 'airblade/vim-gitgutter'

    -- project management
    use 'tpope/vim-projectionist'
end)
