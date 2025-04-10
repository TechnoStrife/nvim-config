return {
    'mfussenegger/nvim-dap',
    dependencies = {
        'leoluz/nvim-dap-go',
        'mfussenegger/nvim-dap-python',
        'rcarriga/nvim-dap-ui',
        'theHamsta/nvim-dap-virtual-text',
        'nvim-neotest/nvim-nio',
        'williamboman/mason.nvim',
    },
    config = function()
        local dap = require 'dap'
        local ui = require 'dapui'
        local topic = "[D]ebug: "

        require('dapui').setup()
        require('dap-go').setup()
        require("dap-python").setup("python3")
        require('dap.ext.vscode').load_launchjs(nil, {})

        vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = topic .. "toggle [B]reakpoint" })
        vim.keymap.set('n', '<leader>dc', dap.run_to_cursor, { desc = topic .. "run to [C]ursor" })
        vim.keymap.set('n', '<leader>dt', ui.toggle, { desc = topic .. "[T]oggle UI" })

        vim.keymap.set('n', '<leader>?', function()
            require('dapui').eval(nil, { enter = true })
        end, { desc = topic .. "evaluate" })

        vim.keymap.set('n', '<F1>', dap.continue, { desc = topic .. "continue" })
        vim.keymap.set('n', '<F2>', dap.step_into, { desc = topic .. "step into" })
        vim.keymap.set('n', '<F3>', dap.step_over, { desc = topic .. "step over" })
        vim.keymap.set('n', '<F4>', dap.step_out, { desc = topic .. "step out" })
        vim.keymap.set('n', '<F5>', dap.step_back, { desc = topic .. "step back" })
        vim.keymap.set('n', '<F12>', dap.restart, { desc = topic .. "restart" })

        dap.listeners.before.attach.dapui_config = function()
            ui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            ui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            ui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            ui.close()
        end
    end,
}
