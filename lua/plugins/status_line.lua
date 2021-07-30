local vim = vim
local gl = require('galaxyline')

local gls = gl.section
gl.short_line_list = { 'defx', 'packager', 'vista' }

-- Colors
local colors = {
  words = '#FFFFFF',
  base1 = '#AC96ED',
  base2 = '#8869A7',
  cursor_position = '#76257F',
  yellow = '#f1fa8c',
  cyan = '#8be9fd',
  green = '#50fa7b',
  orange = '#FFC586',
  magenta = '#ff79c6',
  blue = '#8be9fd',
  red = '#ff5555'
}

local icon = {
  error   = ' ';
  warn    = ' ';
  hint    = ' ';
  info    = ' ';
  modifiy = ' ';
  add     = ' ';
  merge   = ' ';
  renamed = ' ';
  unknown = ' ';
  deleted = ' ';
  ignored = ' ';
  close   = ' ';
  edit    = '';
  line    = '│';
  line1   = '⏽';
  branch  = ' ';
  gear    = ' ';
  light   = '';
  check   = '﫠';
  ok      = ' ';
  linux   = '';
  windows = '';
  mac     = '';
  tab     = '';
}

local separator = {
  l_up = ' ',
  l_down = '  ',
  r_up = ' ',
  r_down = ' '
}

local emoji_icon = {
  error         = '🚫';
  error1        = '🚨';
  warn          = '🚧';
  warn1         = '⚠️';
  hint          = '🌀';
  info          = '💡';
  info1         = 'ℹ️';
  light         = '💡';
  fire          = '🔥';
  fix           = '🔧';
  pin           = '📌';
  gear          = '⚙️';
  search        = '🔎';
  branch        = '🔱';
  right         = '👉';
  close         = '❎';
  file          = '📄';
  folder        = '📁';
  folder_opened = '📂';
  link          = '🔗';
}

----------------------
-- helper functions --
----------------------
local function buffer_not_empty()
  return not (vim.fn.empty(vim.fn.expand('%:t')) == 1)
end

local function in_git_repo()
  local vcs = require('galaxyline.provider_vcs')
  local branch_name = vcs.get_git_branch()

  return branch_name ~= nil
end

local function hide_in_width()
  return (vim.fn.winwidth(0) / 2 > 40) and in_git_repo()
end

local function ins_left(component)
  table.insert(gl.section.left, component)
end

local function ins_right(component)
  table.insert(gl.section.right, component)
end

local function ins_mid(component)
  table.insert(gl.section.mid, component)
end

-- FILE
ins_left {
  LeftStart = {
    provider = function() return "  " end,
    highlight = {colors.base1, colors.base1}
  }
}

ins_left {
  FileIcon = {
    provider = "FileIcon",
    condition = buffer_not_empty,
    highlight = {require("galaxyline.provider_fileinfo").get_file_icon_color, colors.base1}
  }
}

ins_left {
  FileName = {
    provider = {"FileName"},
    condition = buffer_not_empty,
    highlight = {colors.words, colors.base1, "bold"}
  }
}

-- GIT
ins_left {
  GitIcon = {
    provider = function()
      return icon.branch
    end,
    condition = in_git_repo,
    highlight = {colors.green, colors.base1, "bold"}
  }
}

ins_left {
  GitBranch = {
    provider = "GitBranch",
    condition = in_git_repo,
    highlight = {colors.green, colors.base1, "bold"}
  }
}

ins_left {
  BlankArea = {
    provider = function()
      return " "
    end,
    condition = in_git_repo,
    highlight = {colors.base1, colors.base1}
  }
}

ins_left {
  DiffAdd = {
    provider = "DiffAdd",
    condition = hide_in_width,
    icon = " " .. icon.add,
    highlight = {colors.green, colors.base1}
  }
}

ins_left {
  DiffModified = {
    provider = "DiffModified",
    condition = hide_in_width,
    icon = " " .. icon.modifiy,
    highlight = {colors.orange, colors.base1}
  }
}

ins_left {
  DiffRemove = {
    provider = "DiffRemove",
    condition = hide_in_width,
    icon = " " .. icon.deleted,
    separator = separator.l_down,
    separator_highlight = {colors.base1, colors.base2},
    highlight = {colors.red, colors.base1}
  }
}

-- LSP warnings
ins_left {
  DiagnosticError = {
    provider = "DiagnosticError",
    icon = icon.error,
    highlight = {colors.red, colors.base2}
  }
}

ins_left {
  DiagnosticWarn = {
    provider = "DiagnosticWarn",
    icon = icon.warn,
    highlight = {colors.yellow, colors.base2}
  }
}

ins_left {
  DiagnosticHint = {
    provider = "DiagnosticHint",
    icon = icon.hint,
    highlight = {colors.cyan, colors.base2}
  }
}

ins_left {
  LeftEnd = {
    provider = function() return " " end,
    highlight = {colors.base1, colors.base2}
  }
}

-----------
-- RIGHT --
-----------

ins_right {
  RightStart = {
    provider = function() return " " end,
    highlight = {colors.base2, colors.base1},
    separator = separator.r_up,
    separator_highlight = {colors.base1, colors.base2},
  }
}

-- LSP

ins_right {
 ShowLspClient = {
    provider = "GetLspClient",
    condition = function()
      local tbl = {["dashboard"] = true, [""] = true}
      if tbl[vim.bo.filetype] then
        return false
      end
      return true
    end,
    icon = icon.gear,
    highlight = {colors.orange, colors.base1}
 }
}

ins_right {
  ShowLspClientSeparator = {
    provider = function() return " " .. separator.r_up end,
    highlight = {colors.base2, colors.base1},
  }
}

-- Cursor position
ins_right {
  LineInfo = {
    provider = function()
      local line = vim.fn.line('.')
      local column = vim.fn.col('.')
      return " " .. string.format("%3d:%2d", line, column) .. " "
    end,
    condition = hide_in_width,
    highlight = {colors.words, colors.base2},
    separator = icon.r_down,
    separator_highlight = {colors.base1, colors.base2}
  }
}

ins_right {
  LineInfoSeparator = {
    provider = function() return separator.r_up end,
    highlight = {colors.base1, colors.base2},
  }
}

-- Tab size
ins_right {
  Tabstop = {
    provider = function()
      return "  " .. icon.tab .. " " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
    end,
    condition = hide_in_width,
    highlight = {colors.words, colors.base1}
  }
}


-- Text Format
ins_right {
  FileEncode = {
    provider = function()
      local encode = vim.bo.fenc ~= '' and vim.bo.fenc or vim.o.enc
      return " " .. encode:lower()
    end,
    condition = hide_in_width,
    highlight = {colors.words, colors.base2},
    separator = separator.r_up,
    separator_highlight = {colors.base2, colors.base1}
  }
}

-- File Format
ins_right {
  FileFormat = {
    provider = function()
      local fileformat = vim.bo.fileformat
      if fileformat == 'unix' then
        return "  " .. icon.linux
      end
      if fileformat == 'windows' then
        return "  " .. icon.windows
      end
      if fileformat == 'mac' then
        return "  " .. icon.mac
      end
      return "  ?"
    end,
    condition = hide_in_width,
    highlight = {colors.words, colors.base2},
  }
}

-- Filename
ins_right {
  BufferType = {
    provider = "FileTypeName",
    condition = hide_in_width,
    highlight = {colors.words, colors.base1, "bold"},
    separator = separator.r_up,
    separator_highlight = {colors.base1, colors.base2}
  }
}

ins_right {
  RightEnd = {
    provider = function() return " " end,
    highlight = {colors.base2, colors.base1}
  }
}

-- Force manual load so that nvim boots with a status line
gl.load_galaxyline()
