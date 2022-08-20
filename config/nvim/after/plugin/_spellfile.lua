local path = require "plenary.path"

local g = vim.g

local M = {}

if not g.spellfile_URL then
  g.spellfile_URL = "https://ftp.nluug.nl/pub/vim/runtime/spell"
end

local get_dir_and_choices = function()
  local dirlist = {}
  local dirchoices = "&Cancel"

  return { dirlist = dirlist, dirchoices = dirchoices }
end

local writeable_spell_dir = function() end

local download_spell_files = function(selection)
  if selection == "No" then
    return
  end
  -- TODO: download spell file
  -- show progress in new floating buffer
end

M.loadFile = function(lang)
  local language = string.lower(lang)

  -- TODO: set donedict to empty
  local dirlist_and_choices = get_dir_and_choices()
  if dirlist_and_choices["dirlist"].length == 0 then
    local dir_to_create = writeable_spell_dir()
    if dir_to_create and dir_to_create.length > 0 then
      -- TODO: create directories with -p option
      local dir = path:new(dir_to_create)
      dir:mkdir({ parents = true, exists_ok = true })
    end
  else
    vim.notify("No spell file for '" .. language .. "' in ?TODO?", vim.log.levels.ERROR, { title = "Spelllanguage error" })
    return
  end

  vim.ui.select({ "Yes", "No" }, {
    prompt = "Download Spell File?",
  }, download_spell_files)
end

return M
