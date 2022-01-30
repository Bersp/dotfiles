local actions = require('telescope.actions')
local finders = require('telescope.finders')
local pickers = require('telescope.pickers')
local sorters = require('telescope.sorters')
local action_state = require('telescope.actions.state')

function file_exists(filename)
	local file = io.open(filename, 'r')
	if file ~= nil then
		io.close(file)
	  return true
	else
	  return false
	end
end

function get_filename_path(section_name)
	local file_name = section_name:lower()

	local replace_table = {[' '] = '_', ['[:?)(,.]'] = '',
		    			   ['á'] = 'a', ['é'] = 'e', ['í'] = 'i', ['ó'] = 'o', ['ú'] = 'u'}

	for v, w in pairs(replace_table) do
		file_name = file_name:gsub(v, w)
	end

	local filename_path = 'sections/' .. file_name .. '.tex'

	return filename_path
end

function _G.latex_new_section()
	-- Get name of the setion from de selection
	local section_name = vim.fn.input('Section name: ')
	if section_name == '' then
		do return end
	end


	-- Path to the file asociated to the selected section
	local filename_path = get_filename_path(section_name)

	-- Write lines in the buffer
	vim.call('setline', '.', '\\section{' .. section_name .. '}')
	vim.call('append', '.',  '\\subfile{' .. filename_path .. '}')

	-- Create file with the proper text
	local subfile_text = '\\documentclass[../main.tex]{subfiles}\n\n\\begin{document}\n\n\\end{document}'

	if not file_exists(filename_path) then
		file = io.open(filename_path, 'w')
		file:write(subfile_text)
		file:close()
	else
		print(' ')
		print('File "' .. filename_path .. '" already exists')
	end
end

actions.delete_file = function(prompt_bufnr)
  local selected_entry = action_state.get_selected_entry()[1]

  os.remove(selected_entry)
  vim.cmd('echo "File removed: ' .. selected_entry .. '"')
end

actions.rename_file = function(prompt_bufnr)
  local old_filename_path = action_state.get_selected_entry()[1]
	actions.close(prompt_bufnr)

	print('Change name of section associated to ' .. old_filename_path)

	local new_section_name = vim.fn.input('New section name: ')
	if new_section_name == '' then
		do return end
	end

	local new_filename_path = get_filename_path(new_section_name)

  if not file_exists(new_filename_path) then
		-- Write lines in the buffer
		vim.call('setline', '.', '\\section{' .. new_section_name .. '}')
		vim.call('append', '.',  '\\subfile{' .. new_filename_path .. '}')

		-- Raname file
		os.rename(old_filename_path, new_filename_path)
  else
  	print(' ')
  	print('File "' .. filename_path .. '" already exists. No changes were made.')
  end

end

function _G.latex_section_picker()
  local f = io.popen("find sections")

  sections_array = {}

  i = 0 -- start from 0 becouse I want to skip the first value of f:lines()
  for section in f:lines() do
  	sections_array[i] = section
  	i = i + 1
  end

  pickers.new(opts, {
    prompt_title = 'Sections',
    finder = finders.new_table(sections_array),
    sorter = sorters.fuzzy_with_index_bias(),

    attach_mappings = function(_, map)
      map('i', '<c-d>', actions.delete_file)
      map('i', '<c-r>', actions.rename_file)

      return true
    end,

  }):find()
end
