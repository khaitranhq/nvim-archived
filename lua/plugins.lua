vim.cmd [[packadd packer.nvim]]
return require("packer").startup(
    function(use)
        -- Theme dracula
        use "dracula/vim"

        -- Package manager
        use "wbthomason/packer.nvim"

        -- File explorer
        use {
            "kyazdani42/nvim-tree.lua",
            requires = {
                "kyazdani42/nvim-web-devicons" -- optional, for file icons
            },
            tag = "nightly" -- optional, updated every week. (see issue #1193)
        }

        -- diagnostic
        use "neovim/nvim-lspconfig" -- Configurations for Nvim LSP

        -- Linting
        use "hrsh7th/cmp-nvim-lsp"
        use "hrsh7th/cmp-buffer"
        use "hrsh7th/cmp-path"
        use "hrsh7th/cmp-cmdline"
        use "hrsh7th/nvim-cmp"
        use "hrsh7th/cmp-vsnip"
        use "hrsh7th/vim-vsnip"

        -- Find, grep files
        use {
            "nvim-telescope/telescope.nvim",
            tag = "0.1.0",
            -- or                            , branch = '0.1.x',
            requires = {{"nvim-lua/plenary.nvim"}}
        }

        -- Icon for files
        use "ryanoasis/vim-devicons"

        -- Git manager
        use "tpope/vim-fugitive"

        -- Tabline
        use {
            "nvim-lualine/lualine.nvim",
            requires = {"kyazdani42/nvim-web-devicons", opt = true}
        }

        -- Format code
        use "sbdchd/neoformat"

        -- Some utilize short keys
        use "tpope/vim-surround"

        -- Buffer line
        use {"akinsho/bufferline.nvim", tag = "v2.*", requires = "kyazdani42/nvim-web-devicons"}

        -- Comment code
        use {
            "numToStr/Comment.nvim",
            config = function()
                require("Comment").setup()
            end
        }

        -- Preview markdown
        use(
            {
                "iamcco/markdown-preview.nvim",
                run = "cd app && npm install",
                setup = function()
                    vim.g.mkdp_filetypes = {"markdown"}
                end,
                ft = {"markdown"}
            }
        )

        -- Analyze syntax
        use {
            "nvim-treesitter/nvim-treesitter",
            run = function()
                require("nvim-treesitter.install").update({with_sync = true})
            end
        }

        -- Indent guide
        use "lukas-reineke/indent-blankline.nvim"

        -- Git blame
        use "f-person/git-blame.nvim"

        -- LSP installer
        use {
            "williamboman/mason.nvim"
        }
        use {
            "williamboman/mason-lspconfig.nvim"
        }
    end
)
