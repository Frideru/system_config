local opt = vim.opt

-----------------------------------------------------------
-- ОБЩИЕ ОПЦИИ
-----------------------------------------------------------
opt.mouse = 'a'              --Включит мышь
opt.encoding = 'utf-8'       --Кодировка
opt.showcmd = true           --Отображение команд
vim.cmd([[
filetype indent plugin on
syntax enable
]])
opt.swapfile = false         --Не создаем свап файлы

-----------------------------------------------------------
-- ВИЗУАЛЬНЫЕ ОПЦИИ
-----------------------------------------------------------
opt.relativenumber = true    --Отображение от строки
opt.number = true            --Номер строк сбоку
opt.wrap = true              --Длинные линии будет видно
opt.expandtab = true         --???
opt.tabstop = 4              --1 tab = 4 пробела
opt.smartindent = true
opt.shiftwidth = 4           --Смещаем на 4 пробела

-- 2 spaces for selected filetypes
vim.cmd [[
autocmd FileType xml,html,xhtml,css,scss,javascript,lua,yaml,htmljinja setlocal shiftwidth=2 tabstop=2
]]

opt.so = 5                   --Отступ курсора от края экрана
opt.foldcolumn = '2'         --Ширина колонки для фолдов
opt.colorcolumn =  '119'     --Расположение цветной колонки

-- remove line lenght marker for selected filetypes
vim.cmd [[autocmd FileType text,markdown,html,xhtml,javascript setlocal cc=0]]

opt.cursorline = true        -- Подсветка строки с курсором
opt.termguicolors = true

-- Компактный вид у тагбара и Отк. сортировка по имени у тагбара
vim.g.tagbar_compact = 1
vim.g.tagbar_sort = 0

-----------------------------------------------------------
-- НАСТРОЙКИ ПОИСКА
-----------------------------------------------------------
-- Будет игнорировать размер букв при поиске
opt.ignorecase = true        --Игнорировать размер букв
opt.smartcase = true         --Игнор прописных букв

-----------------------------------------------------------
-- ПОЛЕЗНЫЕ ФИШКИ
-----------------------------------------------------------
-- Подсвечивает на доли секунды скопированную часть текста
vim.api.nvim_exec([[
augroup YankHighlight
autocmd!
autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=300}
augroup end
]], false)

-----------------------------------------------------------
-- НАСТРОЙКИ ПЛАГИНОВ
-----------------------------------------------------------
-- LSP settings

require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

--[[local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)
    local opts = {}
    if server.name == "sumneko_lua" then
        -- only apply these settings for the "sumneko_lua" server
        opts.settings = {
            Lua = {
                diagnostics = {
                    -- Get the language server to recognize the 'vim', 'use' global
                    globals = {'vim', 'use'},
                },
                workspace = {
                    -- Make the server aware of Neovim runtime files
                    library = vim.api.nvim_get_runtime_file("", true),
                },
                -- Do not send telemetry data containing a randomized but unique identifier
                telemetry = {
                    enable = false,
                },
            },
        }
    end
    server:setup(opts)
end)--]]


-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
vim.o.completeopt = 'menuone,noselect'
-- luasnip setup
local luasnip = require 'luasnip'
-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'path' },
        { name = 'buffer', option = {
            get_bufnrs = function()
                return vim.api.nvim_list_bufs()
            end
        },
    },
},
}
