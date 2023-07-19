local dap = require('dap')

vim.keymap.set("n", "<F5>", dap.continue)
vim.keymap.set("n", "<F4>", dap.step_over)
vim.keymap.set("n", "<F2>", dap.step_into)
vim.keymap.set("n", "<F3>", dap.step_out)
vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)
vim.keymap.set("n", "<leader>B",  "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
vim.keymap.set("n", "<leader>lp", "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
vim.keymap.set("n", "<leader>dr", dap.repl.open)

-- DAP Servers
require('dap-go').setup()
vim.keymap.set("n", "<leader>tg", "<cmd>lua require'dap-go'.debug_test()<CR>")

require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
require('dap-python').test_runner = 'pytest'
vim.keymap.set("n", "<leader>dn", require('dap-python').test_method)
vim.keymap.set("n", "<leader>df", require('dap-python').test_class)
vim.keymap.set("n", "<leader>ds", require('dap-python').debug_selection)

-- Debugger UI stuff
require("nvim-dap-virtual-text").setup {}
require("dapui").setup {}

local dapui = require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
-- dap.listeners.before.event_terminated["dapui_config"] = function()
--   dapui.close()
-- end
-- dap.listeners.before.event_exited["dapui_config"] = function()
--   dapui.close()
-- end

vim.keymap.set("n", "<leader>dq", dapui.close)
