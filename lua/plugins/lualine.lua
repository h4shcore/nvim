return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },

    config = function()
        local c = require("palette")

        require("lualine").setup({
            options = {
                icons_enabled = false,

                theme = {
                    normal = {
                        a = { bg = c.accent, fg = c.background, gui = "bold" },
                        b = { bg = c.black, fg = c.foreground },
                        c = { bg = c.background, fg = c.foreground },
                    },

                    insert = {
                        a = { bg = c.green, fg = c.background, gui = "bold" },
                        b = { bg = c.black, fg = c.foreground },
                        c = { bg = c.background, fg = c.foreground },
                    },

                    visual = {
                        a = { bg = c.magenta, fg = c.background, gui = "bold" },
                        b = { bg = c.black, fg = c.foreground },
                        c = { bg = c.background, fg = c.foreground },
                    },

                    replace = {
                        a = { bg = c.red, fg = c.background, gui = "bold" },
                        b = { bg = c.black, fg = c.foreground },
                        c = { bg = c.background, fg = c.foreground },
                    },

                    command = {
                        a = { bg = c.yellow, fg = c.background, gui = "bold" },
                        b = { bg = c.black, fg = c.foreground },
                        c = { bg = c.background, fg = c.foreground },
                    },

                    inactive = {
                        a = { bg = c.background, fg = c.brightBlack },
                        b = { bg = c.background, fg = c.brightBlack },
                        c = { bg = c.background, fg = c.brightBlack },
                    },
                },

                component_separators = {
                    left = "::",
                    right = "::",
                },

                section_separators = {
                    left = "",
                    right = "",
                },

                disabled_filetypes = {
                    statusline = {},
                    winbar = {},
                },

                ignore_focus = {},
                always_divide_middle = true,
                always_show_tabline = true,
                globalstatus = false,

                refresh = {
                    statusline = 1000,
                    tabline = 1000,
                    winbar = 1000,
                    refresh_time = 16,

                    events = {
                        "WinEnter",
                        "BufEnter",
                        "BufWritePost",
                        "SessionLoadPost",
                        "FileChangedShellPost",
                        "VimResized",
                        "FileType",
                        "CursorMoved",
                        "CursorMovedI",
                        "ModeChanged",
                    },
                },
            },

            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch", "diff", "diagnostics" },
                lualine_c = { "filename" },
                lualine_x = { "encoding", "fileformat", "filetype" },
                lualine_y = { "progress" },
                lualine_z = { "location" },
            },

            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { "filename" },
                lualine_x = { "location" },
                lualine_y = {},
                lualine_z = {},
            },

            tabline = {},
            winbar = {},
            inactive_winbar = {},

            extensions = {},
        })
    end,
}
