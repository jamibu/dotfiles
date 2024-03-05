return {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = false,
    -- ft = "markdown",
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
    --   "BufReadPre path/to/my-vault/**.md",
    --   "BufNewFile path/to/my-vault/**.md",
    -- },
    dependencies = {
        -- Required.
        "nvim-lua/plenary.nvim",

        -- see below for full list of optional dependencies 👇
    },
    opts = {
        workspaces = {
            {
                name = "work",
                path = "~/notes/Work",
            },
            {
                name = "personal",
                path = "~/notes/Personal",
            },
        },

        new_notes_location = "notes_subdir",
        notes_subdir = "pages",

        daily_notes = {
            folder = "journals",
            template = "templates/Daily Note"
        },

        templates = {
            subdir = "templates",
        },

        note_id_func = function(title) return title end,

        disable_frontmatter = true,
        ui = {
            checkboxes = {
                -- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
                [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
                ["x"] = { char = "", hl_group = "ObsidianDone" },
                [">"] = { char = "", hl_group = "ObsidianRightArrow" },
                ["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
                ["-"] = { char = "󰰱", hl_group = "ObsidianTilde" },
                ["/"] = { char = "󱎖", hl_group = "ObsidianInProgress" },
            },
            hl_groups = {
                -- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
                ObsidianTodo = { bold = true, fg = "#f78c6c" },
                ObsidianInProgress = { bold = true, fg = "#f78c6c" },
                ObsidianDone = { bold = true, fg = "#89ddff" },
                ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
                ObsidianTilde = { bold = true, fg = "#ff5370" },
                ObsidianBullet = { bold = true, fg = "#89ddff" },
                ObsidianRefText = { underline = true, fg = "#c792ea" },
                ObsidianExtLinkIcon = { fg = "#c792ea" },
                ObsidianTag = { italic = true, fg = "#89ddff" },
                ObsidianHighlightText = { bg = "#75662e" },
            },
        },
    },

}
