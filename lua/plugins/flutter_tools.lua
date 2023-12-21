local M = { "akinsho/flutter-tools.nvim" }

M.enabled = true

M.event = "VeryLazy"

M.dependencies = {
    'nvim-lua/plenary.nvim',
    'stevearc/dressing.nvim', -- optional for vim.ui.select
}

M.ft = { "flutter", "dart" }

M.config = true

M.opts = function()
    local line = { "🭽", "▔", "🭾", "▕", "🭿", "▁", "🭼", "▏" }
    return {
        ui = {
            border = "rounded", -- line,
        },
        debugger = {
            enabled = false,
            run_via_dap = false,
            exception_breakpoints = {},
        },
        outline = { auto_open = false },
        decorations = {
            statusline = {
                device = true,
                app_version = true,
            },
        },
        widget_guides = {
            enabled = true,
            debug = false,
        },
        dev_log = {
            -- toggle it when you run without DAP
            enabled = true,
            open_cmd = "tabedit",
        },
        lsp = {
            color = {
                enabled = true,
                background = true,
                virtual_text = false,
            },
            settings = {
                showTodos = false,
                renameFilesWithClasses = "always",
                updateImportsOnRename = true,
                completeFunctionCalls = true,
                lineLength = 100,
            },
        },
    }
end

-- M.config = function()
--     require('flutter-tools').setup {
--         -- (uncomment below line for windows only)
--         -- flutter_path = "home/flutter/bin/flutter.bat",
--
--         debugger = {
--             -- make these two params true to enable debug mode
--             enabled = false,
--             run_via_dap = false,
--             register_configurations = function(_)
--
--                 require("dap").adapters.dart = {
--                     type = "executable",
--                     command = vim.fn.stdpath("data") .. "/mason/bin/dart-debug-adapter",
--                     args = {"flutter"}
--                 }
--
--                 require("dap").configurations.dart = {
--                     {
--                         type = "dart",
--                         request = "launch",
--                         name = "Launch flutter",
--                         dartSdkPath = 'home/flutter/bin/cache/dart-sdk/',
--                         flutterSdkPath = "home/flutter",
--                         program = "${workspaceFolder}/lib/main.dart",
--                         cwd = "${workspaceFolder}",
--                     }
--                 }
--                 -- uncomment below line if you've launch.json file already in your vscode setup
--                 -- require("dap.ext.vscode").load_launchjs(e
--             end,
--         },
--         dev_log = {
--             -- toggle it when you run without DAP
--             enabled = false,
--             open_cmd = "tabedit",
--         },
--         -- lsp = {
--         --     on_attach = require("lvim.lsp").common_on_attach,
--         --     capabilities = require("lvim.lsp").default_capabilities,
--         -- },
--
--     }
-- end

-- M.opts = {
--     ui = {
--         -- the border type to use for all floating windows, the same options/formats
--         -- used for ":h nvim_open_win" e.g. "single" | "shadow" | {<table-of-eight-chars>}
--         border = "rounded",
--         -- This determines whether notifications are show with `vim.notify` or with the plugin's custom UI
--         -- please note that this option is eventually going to be deprecated and users will need to
--         -- depend on plugins like `nvim-notify` instead.
--         notification_style = 'native',-- | 'plugin'
--     },
--     decorations = {
--         statusline = {
--             -- set to true to be able use the 'flutter_tools_decorations.app_version' in your statusline
--             -- this will show the current version of the flutter app from the pubspec.yaml file
--             app_version = false,
--             -- set to true to be able use the 'flutter_tools_decorations.device' in your statusline
--             -- this will show the currently running device if an application was started with a specific
--             -- device
--             device = false,
--             -- set to true to be able use the 'flutter_tools_decorations.project_config' in your statusline
--             -- this will show the currently selected project configuration
--             project_config = false,
--         }
--     },
--     debugger = { -- integrate with nvim dap + install dart code debugger
--         enabled = false,
--         run_via_dap = false, -- use dap instead of a plenary job to run flutter apps
--         -- if empty dap will not stop on any exceptions, otherwise it will stop on those specified
--         -- see |:help dap.set_exception_breakpoints()| for more info
--         exception_breakpoints = {},
--         register_configurations = function(paths)
--             require("dap").configurations.dart = {
--                 -- <put here config that you would find in .vscode/launch.json>
--             }
--         end,
--     },
--     flutter_path = "<full/path/if/needed>", -- <-- this takes priority over the lookup
--     flutter_lookup_cmd = nil, -- example "dirname $(which flutter)" or "asdf where flutter"
--     root_patterns = { ".git", "pubspec.yaml" }, -- patterns to find the root of your flutter project
--     fvm = false, -- takes priority over path, uses <workspace>/.fvm/flutter_sdk if enabled
--     widget_guides = {
--         enabled = false,
--     },
--     closing_tags = {
--         highlight = "ErrorMsg", -- highlight for the closing tag
--         prefix = ">", -- character to use for close tag e.g. > Widget
--         enabled = true -- set to false to disable
--     },
--     dev_log = {
--         enabled = true,
--         notify_errors = false, -- if there is an error whilst running then notify the user
--         open_cmd = "tabedit", -- command to use to open the log buffer
--     },
--     dev_tools = {
--         autostart = false, -- autostart devtools server if not detected
--         auto_open_browser = false, -- Automatically opens devtools in the browser
--     },
--     outline = {
--         open_cmd = "30vnew", -- command to use to open the outline buffer
--         auto_open = false -- if true this will open the outline automatically when it is first populated
--     },
--     lsp = {
--         color = { -- show the derived colours for dart variables
--             enabled = false, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
--             background = false, -- highlight the background
--             background_color = nil, -- required, when background is transparent (i.e. background_color = { r = 19, g = 17, b = 24},)
--             foreground = false, -- highlight the foreground
--             virtual_text = true, -- show the highlight using virtual text
--             virtual_text_str = "■", -- the virtual text character to highlight
--         },
--         on_attach = my_custom_on_attach,
--         capabilities = my_custom_capabilities, -- e.g. lsp_status capabilities
--         --- OR you can specify a function to deactivate or change or control how the config is created
--         -- capabilities = function(config)
--         --     config.specificThingIDontWant = false
--         --     return config
--         -- end,
--         -- see the link below for details on each option:
--         -- https://github.com/dart-lang/sdk/blob/master/pkg/analysis_server/tool/lsp_spec/README.md#client-workspace-configuration
--         settings = {
--             showTodos = true,
--             completeFunctionCalls = true,
--             analysisExcludedFolders = {"<path-to-flutter-sdk-packages>"},
--             renameFilesWithClasses = "prompt", -- "always"
--             enableSnippets = true,
--             updateImportsOnRename = true, -- Whether to update imports and other directives when files are renamed. Required for `FlutterRename` command.
--         }
--     }
-- }
--
-- M.config = function (_, opts)
--     require("flutter-tools").setup(opts)
-- end

return M
