-- Git commit message best practices:
-- - Subject line (line 1): max 50 characters
-- - Line 2: always blank
-- - Body (line 3+): wrap at 72 characters

vim.opt_local.textwidth = 72
vim.opt_local.colorcolumn = '73'
vim.opt_local.spell = true
vim.opt_local.spelllang = 'en_us'

-- Truncate subject line if it exceeds 50 characters
local function truncate_subject()
  local line = vim.fn.getline(1)
  if #line > 50 then
    vim.fn.setline(1, line:sub(1, 50))
  end
end

-- Ensure line 2 is blank
local function ensure_blank_line()
  local line_count = vim.fn.line('$')
  if line_count >= 2 then
    local line2 = vim.fn.getline(2)
    if line2 ~= '' then
      vim.fn.setline(2, '')
    end
  end
end

local group = vim.api.nvim_create_augroup('GitCommitFormat', { clear = true })

vim.api.nvim_create_autocmd('InsertLeave', {
  group = group,
  buffer = 0,
  callback = function()
    truncate_subject()
    ensure_blank_line()
  end,
})
