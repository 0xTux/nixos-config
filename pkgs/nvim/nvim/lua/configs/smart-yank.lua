require("smartyank").setup({
  highlight = {
    enabled = true,
    higroup = "IncSearch",
    timeout = 2000,
  },
  clipboard = {
    enabled = true,
  },
  tmux = {
    enabled = true,
    cmd = { "tmux", "set-buffer", "-w" },
  },
  osc52 = {
    enabled = true,
    ssh_only = false,
    silent = false,
    echo_hl = "Directory",
  },
})
