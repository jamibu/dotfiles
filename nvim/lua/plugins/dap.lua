local Plugin = {'mfussenegger/nvim-dap'}

Plugin.dependencies = {
    {"rcarriga/nvim-dap-ui"},
    {'theHamsta/nvim-dap-virtual-text' },
    {'nvim-telescope/telescope-dap.nvim'},
    {'mfussenegger/nvim-dap-python'},
}

function Plugin.config()
    local dap = require('dap')
    local dap_python = require('dap-python')
    local dapui = require('dapui')

    dap_python.setup('~/.virtualenvs/debugpy/bin/python')
    dap_python.test_runner = 'pytest'
    vim.keymap.set("n", "<leader>dn", require('dap-python').test_method)
    vim.keymap.set("n", "<leader>df", require('dap-python').test_class)
    vim.keymap.set("n", "<leader>ds", require('dap-python').debug_selection)

    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    vim.keymap.set("n", "<leader>dq", dapui.close)

    vim.keymap.set("n", "<F5>", dap.continue)
    vim.keymap.set("n", "<F4>", dap.step_over)
    vim.keymap.set("n", "<F2>", dap.step_into)
    vim.keymap.set("n", "<F3>", dap.step_out)
    vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)
    vim.keymap.set("n", "<leader>B",  "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
    vim.keymap.set("n", "<leader>lp", "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
    vim.keymap.set("n", "<leader>dr", dap.repl.open)
end

return Plugin
