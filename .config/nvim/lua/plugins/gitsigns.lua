-- https://github.com/lewis6991/gitsigns.nvim

require('gitsigns').setup{
  current_line_blame_formatter_opts = {
    relative_time = false
  },
  current_line_blame_formatter = function(name, blame_info, opts)
    if blame_info.author == name then
      blame_info.author = 'You'
    end

    local text
    if blame_info.author == 'Not Committed Yet' then
      text = blame_info.author
    else
      local date_time

      if opts.relative_time then
        date_time = require('gitsigns.util').get_relative_time(tonumber(blame_info['author_time']))
      else
        date_time = os.date('%Y-%m-%d', tonumber(blame_info['author_time']))
      end

      text = string.format('%s, %s, %s - %s', date_time, blame_info.abbrev_sha, blame_info.author, blame_info.summary)
    end

    return {{' '..text, 'GitSignsCurrentLineBlame'}}
  end,
  on_attach = function(bufnr)
    local function map(mode, lhs, rhs, opts)
      opts = vim.tbl_extend('force', {noremap = true, silent = true}, opts or {})
      vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
    end

    require('keymap').on_attach.gitsigns(map)
  end
}
