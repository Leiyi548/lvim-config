local M = {}
-- local packer = require("packer")
M.config = function()
	lvim.plugins = {
		{
			"ellisonleao/gruvbox.nvim",
			requires = { "rktjmp/lush.nvim" },
			after = "lush.nvim",
		},
		{
			"Mofiqul/vscode.nvim",
		},
		{
			"folke/tokyonight.nvim",
		},
		{
			"rose-pine/neovim",
			as = "rose-pine",
		},
		{
			"abzcoding/doom-one.nvim",
			branch = "feat/nvim-cmp-floating",
		},
		{
			"catppuccin/nvim",
		},
		{
			"projekt0n/github-nvim-theme",
		},
		{
			"shaunsingh/nord.nvim",
		},
		{
			"rebelot/kanagawa.nvim",
		},
		{
			"olimorris/onedarkpro.nvim",
		},
		{
			"EdenEast/nightfox.nvim",
		},
		{
			"dracula/vim",
		},
		{
			"sainnhe/edge",
		},
		{
			"lunarvim/darkplus.nvim",
		},
		{
			"rmehri01/onenord.nvim",
		},
		{
			"tpope/vim-surround",
			keys = { "c", "d", "y", "s", "S" },
		},

		--telescope
		{
			"benfowler/telescope-luasnip.nvim",
			--module = "telescope._extensions.luasnip", -- if you wish to lazy-load
		},

		--markdown
		{
			"iamcco/markdown-preview.nvim",
			run = "cd app && npm install",
			setup = function()
				vim.g.mkdp_filetypes = { "markdown", "tex", "wiki" }
			end,
			ft = "markdown",
			config = function()
				vim.g.mkdp_markdown_css = "~/.config/lvim/markdown.css"
				vim.g.mkdp_auto_close = 0
				vim.cmd([[
    source ~/.config/lvim/md-snippets.vim
    autocmd BufRead,BufNewFile *.md setlocal spell
    ]])
			end,
		},
		-- {
		-- 	"plasticboy/vim-markdown",
		-- 	ft = "markdown",
		-- 	opt = "true",
		-- 	requires = { "godlygeek/tabular" },
		-- 	config = function()
		-- 		require("user.vim-markdown").config()
		-- 	end,
		-- },
		-- {
		-- 	"jakewvincent/mkdnflow.nvim",
		-- 	ft = { "markdown" },
		-- 	config = function()
		-- 		require("user.mkdnflow").config()
		-- 	end,
		-- },
		-- {
		-- 	"Leiyi548/vimwiki",
		-- 	branch = "dev",
		-- 	ft = { "vimwiki", "markdown" },
		-- 	config = function()
		-- 		require("user.vimwiki").config()
		-- 	end,
		-- },
		{
			"npxbr/glow.nvim",
			ft = { "markdown" },
		},
		{
			"dhruvasagar/vim-table-mode",
			ft = "markdown",
		},

		--run
		{
			"skywind3000/asyncrun.vim",
			cmd = { "AsyncRun" },
			--ft = {"lua","python","cpp","c","java","go","markdown"},
		},
		{
			"skywind3000/asynctasks.vim",
			cmd = { "AsyncTask" },
			--ft = {"lua","python","cpp","c","java","go","markdown"},
			config = function()
				vim.g.asynctasks_term_pos = "bottom"
				vim.g.asynctasks_term_cols = 60
				vim.g.asynctasks_term_rows = 12
				vim.g.asyncrun_open = 6
				vim.g.asynctasks_system = "macos"
				vim.cmd([[
        let g:asynctasks_extra_config = [
    \ '~/.config/lvim/tasks.ini',
    \ ]
        ]])
			end,
		},
		{
			"voldikss/vim-floaterm",
			cmd = { "FloatermNew" },
			config = function()
				vim.cmd([[hi FloatermNC guibg=gray]])
				vim.g.floaterm_width = 0.9
				vim.g.floaterm_wintype = "float"
				vim.g.floaterm_height = 0.9
				vim.g.floaterm_title = ""
				vim.g.floaterm_borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }
			end,
		},

		-- search file
		{
			"phaazon/hop.nvim",
			as = "hop",
			event = "BufRead",
			config = function()
				-- you can configure Hop the way you like here; see :h hop-config
				require("hop").setup({
					keys = "etovxqpdygfblzhckisuran",
				})
			end,
		},

		-- orgmode.nvim
		{
			"nvim-orgmode/orgmode.nvim",
			keys = { "go", "gC" },
			ft = { "org" },
			config = function()
				require("user.orgmode").setup()
				vim.cmd("language en_US.UTF-8")
			end,
			disable = not lvim.builtin.orgmode.active,
		},
		{
			"akinsho/org-bullets.nvim",
			ft = { "org" },
			config = function()
				require("org-bullets").setup({
					---@diagnostic disable-next-line: duplicate-index
					symbols = { "◉", "○", "✸", "✿" },
					-- or a function that receives the defaults and returns a list
					-- symbols = function(default_list)
					--   table.insert(default_list, "♥")
					--   return default_list
					-- end
				})
			end,
			disable = not lvim.builtin.orgmode.active,
		},
		{
			"lukas-reineke/headlines.nvim",
			ft = { "org", "wiki" },
			config = function()
				vim.cmd([[highlight Headline1 guibg=#1e2718]])
				vim.cmd([[highlight Headline2 guibg=#21262d]])
				vim.cmd([[highlight CodeBlock guibg=#1c1c1c]])
				vim.cmd([[highlight Dash guibg=#D19A66 gui=bold]])
				vim.fn.sign_define("Headline1", { linehl = "Headline1" })
				vim.fn.sign_define("Headline2", { linehl = "Headline2" })
				require("headlines").setup({
					org = {
						headline_signs = { "Headline1", "Headline2" },
					},
				})
			end,
			disable = not lvim.builtin.orgmode.active,
		},
		--Vista.vim
		{
			"liuchengxu/vista.vim",
			cmd = "Vista",
			ft = { "markdown" },
			config = function()
				vim.g.vista_default_executive = "nvim_lsp"
				vim.g.vista_icon_indent = { "╰─▸ ", "├─▸ " }
				vim.cmd([[
    let g:vista#renderer#enable_icon = 1
    let g:vista#renderer#icons = {
    \   "function": "\uf794",
    \   "variable": "\uf71b",
    \  }
    ]])
			end,
		},
		{
			"lukas-reineke/indent-blankline.nvim",
			config = function()
				require("user.indent_blankline").config()
			end,
			event = "BufRead",
		},
		{
			"norcalli/nvim-colorizer.lua",
			config = function()
				require("user.colorizer").config()
			end,
		},
		{
			"folke/todo-comments.nvim",
			requires = "nvim-lua/plenary.nvim",
			config = function()
				require("user.todo_comments").config()
			end,
			event = "BufRead",
		},
		{
			"p00f/nvim-ts-rainbow",
			after = "nvim-treesitter",
		},
		{
			"kevinhwang91/rnvimr",
			cmd = "RnvimrToggle",
			config = function()
				-- Make Ranger replace Netrw and be the file explorer
				vim.g.rnvimr_ex_enable = 0
				-- Disable a border for floating window
				vim.g.rnvimr_draw_border = 1
				--Make Ranger to be hidden after picking a file
				vim.g.rnvimr_pick_enable = 0
				-- Add a shadow window, value is equal to 100 will disable shadow
				vim.g.rnvimr_shadow_winblend = 70
				vim.cmd([[source ~/.config/lvim/lua/user/rnvimr.vim]])
			end,
		},
		{
			"ybian/smartim",
			event = { "InsertEnter" },
			config = function()
				vim.g.smartim_default = "com.apple.keylayout.ABC"
			end,
		},
		{
			"folke/trouble.nvim",
			config = function()
				require("trouble").setup({
					auto_open = true,
					auto_close = true,
					height = 10,
					use_diagnostic_signs = true,
				})
			end,
			cmd = "TroubleToggle",
		},
		{
			"ray-x/lsp_signature.nvim",
			--event = "BufRead",
			config = function()
				require("user.lsp_signature").config()
			end,
		},
		{
			"mattn/emmet-vim",
			ft = { "html", "css", "php", "jsp", "markdown" },
			config = function()
				vim.cmd([[
        source ~/.config/lvim/html-snippets.vim
        autocmd BufRead,BufNewFile *.md setlocal spell
        ]])
			end,
			disable = true,
		},
		{
			"Pocco81/AutoSave.nvim",
			config = function()
				require("autosave").setup()
			end,
			disable = not lvim.builtin.autosave.active,
		},
		{
			"karb94/neoscroll.nvim",
			event = "WinScrolled",
			config = function()
				require("neoscroll").setup({
					-- All these keys will be mapped to their corresponding default scrolling animation
					mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
					hide_cursor = true, -- Hide cursor while scrolling
					stop_eof = true, -- Stop at <EOF> when scrolling downwards
					use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
					respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
					cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
					easing_function = nil, -- Default easing function
					pre_hook = nil, -- Function to run before the scrolling animation starts
					post_hook = nil, -- Function to run after the scrolling animation ends
				})
			end,
			disable = not lvim.builtin.neoscroll.active,
		},
		{
			"ZSaberLv0/ZFVimIM",
			--after = "ZFVimJob",
			disable = not lvim.builtin.ZFvim.active,
			config = function() --"let g:ZFVimIM_matchLimit = -1
				vim.cmd([[
        let g:ZFVimIM_cloudAsync_outputTo = {}
        let g:ZFVimIM_keymap = 0
        inoremap <expr><silent> ;; ZFVimIME_keymap_toggle_i()
        let g:ZFVimIM_sentence = 0
        let g:ZFVimIM_predictLimit = 0
        let g:ZFVimIM_matchLimit = 1
        ]])
				-- function! s:check()
				--   let state = ZFVimIME_state()
				--     if len(state['key']) == 4
				--         if !empty(state['list'])
				--             call feedkeys("\<space>", 't')
				--         else
				--             call feedkeys(repeat("\<bs>", len(state['key'])), "nt")
				--         endif
				--     endif
				-- endfunction
				-- autocmd User ZFVimIM_event_OnUpdateOmni call s:check()
			end,
		},
		{
			"ZSaberLv0/ZFVimJob",
			--event = "InsertEnter",
			disable = not lvim.builtin.ZFvim.active,
		},
		{
			"Leiyi548/ZFVimIM_openfly",
			--event = "InsertEnter",
			disable = not lvim.builtin.ZFvim.active,
		},
		{
			"aserowy/tmux.nvim",
			event = "BufRead",
			config = function()
				require("user.tmux").setup()
			end,
			disable = lvim.builtin.tmuxNavigator.active,
		},
		{
			"numToStr/Navigator.nvim",
			event = "BufRead",
			config = function()
				require("Navigator").setup()
			end,
			disable = not lvim.builtin.tmuxNavigator.active,
		},
		{
			"goolord/alpha-nvim",
			event = "BufWinEnter",
			config = function()
				require("user.dashboard").config()
				-- vim.cmd("language en_US.UTF-8")
			end,
			disable = not lvim.builtin.fancy_dashboard.active,
		},
		{
			"machakann/vim-sandwich",
			keys = { "s" },
			disable = "true",
		},
		{
			"danymat/neogen",
			config = function()
				require("neogen").setup({
					enabled = true, -- (default: true) automatic jump (with insert mode) on inserted annotation
					input_after_comment = true, -- (default: true) automatic jump (with insert mode) on inserted annotation
				})
			end,
			ft = { "lua", "python", "javascript", "typescriptreact", "c", "cpp", "go", "java" },
			event = "InsertEnter",
			requires = "nvim-treesitter/nvim-treesitter",
			disable = not lvim.builtin.neogen.active,
		},
		{
			"junegunn/vim-easy-align",
			disable = not lvim.builtin.easy_align.active,
		},
		{
			"chentau/marks.nvim",
			event = "BufReadPost",
			config = function()
				require("user.mark")
			end,
			disable = not lvim.builtin.fancy_mark.active,
		},
		{
			"mbbill/undotree",
			cmd = { "UndotreeToggle" },
		},
		{
			"nvim-treesitter/nvim-treesitter-textobjects",
			before = "nvim-treesitter",
		},
		{
			"romgrk/nvim-treesitter-context",
			after = "nvim-treesitter",
		},
		{
			"itchyny/vim-cursorword",
			event = { "BufReadPre", "BufNewFile" },
		},
		{
			"hrsh7th/cmp-calc",
			requires = "hrsh7th/nvim-cmp",
			after = "nvim-cmp",
		},
		{
			"andersevenrud/cmp-tmux",
			after = "nvim-cmp",
		},
		{
			"hrsh7th/cmp-cmdline",
			after = "nvim-cmp",
		},
		{
			"tzachar/cmp-tabnine",
			run = "./install.sh",
			requires = "hrsh7th/nvim-cmp",
			config = function()
				local tabnine = require("cmp_tabnine.config")
				tabnine:setup({
					max_lines = 1000,
					max_num_results = 10,
					sort = true,
				})
			end,
			opt = true,
			event = "InsertEnter",
			disable = not lvim.builtin.tabnine.active,
		},
		{
			"windwp/nvim-ts-autotag",
			ft = { "html", "javascript", "javascriptreact", "typescriptreact", "svelte", "vue" },
		},
		{
			"wellle/targets.vim",
			keys = { "c", "d", "y" },
		},
		{
			"tpope/vim-repeat",
			keys = { "." },
		},
		{
			"mg979/vim-visual-multi",
			branch = "master",
			event = "BufWrite",
		},
		-- {
		-- 	"akinsho/bufferline.nvim",
		-- 	config = function()
		-- 		require("user.bufferlineConfig").config()
		-- 	end,
		-- 	requires = "nvim-web-devicons",
		-- 	disable = not lvim.builtin.fancy_bufferline.active,
		-- },
		{
			"zeertzjq/symbols-outline.nvim",
			setup = function()
				require("user.symbols_outline").config()
			end,
			ft = { "lua", "python", "java", "javascript", "c", "cpp" },
			event = "BufReadPost",
			disable = not lvim.builtin.symbol_outline.active,
		},
		{
			"filipdutescu/renamer.nvim",
			config = function()
				require("renamer").setup({
					title = "Rename",
				})
			end,
			disable = not lvim.builtin.fancy_rename.active,
		},
		{
			"tpope/vim-fugitive",
			cmd = { "Git", "G" },
		},
		{
			"folke/zen-mode.nvim",
			config = function()
				require("user.zen").config()
			end,
			cmd = { "ZenMode" },
		},
		{
			"folke/twilight.nvim",
			config = function()
				require("user.twilight").config()
			end,
			cmd = { "Twilight" },
		},
		{
			"ThePrimeagen/harpoon",
			disable = not lvim.builtin.harpoon.active,
		},
		{
			"nathom/filetype.nvim",
		},
	}
end
return M
