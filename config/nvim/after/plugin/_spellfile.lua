local g = vim.g

local M = {}

if not g.spellfile_URL then
  g.spellfile_URL = 'https://ftp.nluug.nl/pub/vim/runtime/spell'
end

local get_dir_and_choices = function()
  local dirlist = {}
  local dirchoices = '&Cancel'

  return {dirlist = dirlist, dirchoices = dirchoices}
end

local writeable_spell_dir = function()
end

M.loadFile = function(lang)
  local lang = string.lower(lang)

  -- TODO: set donedict to empty
  local dirlist_and_choices = get_dir_and_choices()
  if dirlist_and_choices["dirlist"].length == 0 then
    local dir_to_create = writeable_spell_dir()
    if dir_to_create.length > 0 then
      -- TODO: create directories with -p option
    end
  end

  print("No spell file for '" .. lang .. "' in ?TODO?")
end


