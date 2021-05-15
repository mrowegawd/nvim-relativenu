local api = vim.api

local mode = 0

local function relative()
  vim.cmd("set number rnu")
end

local function norelative()
  vim.cmd("set number nornu")
end

local function dont_numbers()
  local dont_do_numbers = {
    "Trouble",
    "Mundo",
    "MundoDiff",
    "NeogitStatus",
    "NvimTree",
    "OUTLINE",
    "TelescopePrompt",
    "__vista__",
    "cekdulu",
    "cekdulu_dash",
    "dotooagenda",
    "fugitive",
    "gitcommit",
    "gundo",
    "help",
    "nerdtree",
    "qf",
    "sagahover",
    "sagasignature",
    "startify",
    "symbols-outline",
    "tagbar",
    "toggleterm",
    "unite",
    "vimshell",
    "vista",
    "vista_markdown",
    "w3m",
  }
  local filetype = api.nvim_buf_get_option(
    api.nvim_get_current_buf(),
    "filetype"
  )

  for i = 1, #dont_do_numbers do
    if dont_do_numbers[i] == filetype then
      vim.cmd("setlocal nonumber nornu")
    end
  end
end

local function start_relative()
  if mode == 0 then
    relative()
    mode = 1
  else
    norelative()
    mode = 0
  end

  dont_numbers()
end

local function setnumbers()
  mode = 1
  start_relative()
end

local function setrelative()
  mode = 0
  start_relative()
end

return {
  setnumbers = setnumbers,
  setrelative = setrelative,
  start_relative = start_relative,
}
