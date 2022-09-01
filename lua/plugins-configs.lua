---------- NERDTREE ----------
-- Quick key for toggle Nerdtree
vim.api.nvim_set_keymap("", "<c-b>", ":NERDTreeToggle<CR>", {})
-- Show hidden
vim.g.NERDTreeShowHidden = 1
-- Show line number
vim.g.NERDTreeShowLineNumbers = 1

---------- DRACULA.VIM ----------
-- Set colorscheme is Dracula
vim.cmd [[colorscheme dracula]]
-- Enable 24-bit RGB color in terminal
vim.opt.termguicolors = true
-- Set background (dark/light)
vim.opt.background = "dark"

---------- NVIM-LSPCONFIG ----------
local lsp_flags = {}

local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
    local bufopts = {noremap = true, silent = true, buffer = bufnr}

    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
end

-- Rename variables
vim.api.nvim_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", {noremap = true})

require("lspconfig").pyright.setup {}
require("lspconfig")["tsserver"].setup {
    on_attach = on_attach,
    flags = lsp_flags
}
require("lspconfig").clangd.setup {}
require("lspconfig").sumneko_lua.setup {
    settings = {
        Lua = {
            diagnostics = {
                globals = {"vim"}
            }
        }
    }
}
require("lspconfig").powershell_es.setup {
  bundle_path = 'C:/Users/khai.tran/AppData/Local/nvim-data/mason/packages/powershell-editor-services'
}

---------- CMD-VIM-LSP ----------

local cmp = require "cmp"

local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

vim.opt.completeopt = "menu,menuone,noselect,noinsert"
cmp.setup(
    {
        snippet = {
            -- REQUIRED - you must specify a snippet engine
            expand = function(args)
                vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
                -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
            end
        },
        window = {},
        mapping = cmp.mapping.preset.insert(
            {
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({select = true}), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                ["<Tab>"] = cmp.mapping(
                    function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif vim.fn["vsnip#available"](1) == 1 then
                            feedkey("<Plug>(vsnip-expand-or-jump)", "")
                        elseif has_words_before() then
                            cmp.complete()
                        else
                            fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
                        end
                    end,
                    {"i", "s"}
                ),
                ["<S-Tab>"] = cmp.mapping(
                    function()
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif vim.fn["vsnip#jumpable"](-1) == 1 then
                            feedkey("<Plug>(vsnip-jump-prev)", "")
                        end
                    end,
                    {"i", "s"}
                )
            }
        ),
        sources = cmp.config.sources(
            {
                {name = "nvim_lsp"},
                {name = "vsnip"} -- For vsnip users.
                --{ name = 'luasnip' }, -- For luasnip users.
                -- { name = 'ultisnips' }, -- For ultisnips users.
                -- { name = 'snippy' }, -- For snippy users.
            },
            {
                {name = "buffer"}
            }
        )
    }
)

-- Set configuration for specific filetype.
cmp.setup.filetype(
    "gitcommit",
    {
        sources = cmp.config.sources(
            {
                {name = "cmp_git"} -- You can specify the `cmp_git` source if you were installed it.
            },
            {
                {name = "buffer"}
            }
        )
    }
)

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(
    "/",
    {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
            {name = "buffer"}
        }
    }
)

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(
    ":",
    {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources(
            {
                {name = "path"}
            },
            {
                {name = "cmdline"}
            }
        )
    }
)

-- Setup lspconfig.
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- TELESCOPE
vim.api.nvim_set_keymap("n", "<c-f>", "<cmd>Telescope find_files<cr>", {noremap = true})
vim.api.nvim_set_keymap("n", "<c-g>", "<cmd>Telescope live_grep<cr>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>b", "<cmd>Telescope buffers<cr>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>h", "<cmd>Telescope help_tags<cr>", {noremap = true})

function vim.getVisualSelection()
    vim.cmd('noau normal! "vy"')
    local text = vim.fn.getreg("v")
    vim.fn.setreg("v", {})

    text = string.gsub(text, "\n", "")
    if #text > 0 then
        return text
    else
        return ""
    end
end

local keymap = vim.keymap.set
local tb = require("telescope.builtin")
local opts = {noremap = true, silent = true}

keymap("n", "<space>g", ":Telescope current_buffer_fuzzy_find<cr>", opts)
keymap(
    "v",
    "<space>g",
    function()
        local text = vim.getVisualSelection()
        tb.current_buffer_fuzzy_find({default_text = text})
    end,
    opts
)

keymap("n", "<space>G", ":Telescope live_grep<cr>", opts)
keymap(
    "v",
    "<space>G",
    function()
        local text = vim.getVisualSelection()
        tb.live_grep({default_text = text})
    end,
    opts
)

-- GIT
vim.api.nvim_set_keymap("n", "<leader>gs", ":G<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>gd", ":Gdiffsplit<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>gc", ":Git commit<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>gb", ":Gblame<cr>", {})

--LUALINE
require("lualine").setup {
    options = {
        icons_enabled = true,
        theme = "auto",
        component_separators = {left = "", right = ""},
        section_separators = {left = "", right = ""},
        disabled_filetypes = {
            statusline = {},
            winbar = {}
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000
        }
    },
    sections = {
        lualine_a = {"mode"},
        lualine_b = {"branch", "diff", "diagnostics"},
        lualine_c = {"filename"},
        lualine_x = {"encoding", "fileformat", "filetype"},
        lualine_y = {"progress"},
        lualine_z = {"location"}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {"filename"},
        lualine_x = {"location"},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
}

--NEOFORMAT
vim.api.nvim_set_keymap("n", "<leader>fm", ":Neoformat<cr>", {})

--BUFFERLINE
require("bufferline").setup {
    options = {
        mode = "buffers", -- set to "tabs" to only show tabpages instead
        numbers = "buffer_id",
        indicator_icon = "▎",
        buffer_close_icon = "",
        modified_icon = "●",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            return "(" .. count .. ")"
        end
    }
}

require("Comment").setup()

-- TREESITTER
require "nvim-treesitter.configs".setup {
    -- A list of parser names, or "all"
    ensure_installed = {"lua", "python", "typescript"},
    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,
    -- Automatically install missing parsers when entering buffer
    auto_install = true,
    -- List of parsers to ignore installing (for "all")
    -- ignore_install = { "javascript" },

    highlight = {
        -- `false` will disable the whole extension
        enable = true,
        -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
        -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
        -- the name of the parser)
        -- list of language that will be disabled
        -- disable = { "c", "rust" },

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false
    }
}

-- DASHBOARD
-- local db = require("dashboard")
-- db.custom_center = {
--     {
--         icon = "  ",
--         desc = "Recently latest session                  ",
--         shortcut = "SPC s l",
--         action = "SessionLoad"
--     },
--     {
--         icon = "  ",
--         desc = "Recently opened files                   ",
--         action = "DashboardFindHistory",
--         shortcut = "SPC f h"
--     },
--     {
--         icon = "  ",
--         desc = "Find  File                              ",
--         action = "Telescope find_files find_command=rg,--hidden,--files",
--         shortcut = "SPC f f"
--     },
--     {
--         icon = "  ",
--         desc = "File Browser                            ",
--         action = "NERDTreeToggle",
--         shortcut = "SPC f b"
--     },
--     {
--         icon = "  ",
--         desc = "Find  word                              ",
--         action = "Telescope live_grep",
--         shortcut = "SPC f w"
--     }
-- }

-- GIT BLAME
vim.g.gitblame_ignored_filetypes = {"nerdtree", "fugitive"}

-- Install LSP
require("mason").setup()
require("mason-lspconfig").setup()
