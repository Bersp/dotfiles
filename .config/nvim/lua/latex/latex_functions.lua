local actions = require("telescope.actions")
local finders = require("telescope.finders")
local pickers = require("telescope.pickers")
local sorters = require("telescope.sorters")
local action_state = require("telescope.actions.state")
local builtin = require("telescope.builtin")
local themes = require("telescope.themes")

function file_exists(filename)
	local file = io.open(filename, "r")
	if file ~= nil then
		io.close(file)
		return true
	else
		return false
	end
end

actions.delete_file = function(prompt_bufnr)
	local selected_entry = action_state.get_selected_entry()[1]
	actions.close(prompt_bufnr)

	os.remove(selected_entry)
	vim.cmd('echo "File removed: ' .. selected_entry .. '"')
end

-- Sections

actions.rename_section = function(prompt_bufnr)
	local old_filename_path = action_state.get_selected_entry()[1]
	actions.close(prompt_bufnr)

	print("Change name of section associated to " .. old_filename_path)

	local new_section_name = vim.fn.input("New section name: ")
	if new_section_name == "" then
		do
			return
		end
	end

	local new_filename_path = get_section_filename_path(new_section_name)

	if not file_exists(new_filename_path) then
		-- Write lines in the buffer
		vim.call("setline", ".", "\\section{" .. new_section_name .. "}")
		vim.call("append", ".", "\\subfile{" .. new_filename_path .. "}")

		-- Raname file
		os.rename(old_filename_path, new_filename_path)
	else
		print(" ")
		print('File "' .. filename_path .. '" already exists. No changes were made.')
	end
end

function get_section_filename_path(section_name)
	local file_name = section_name:lower()

	local replace_table = {
		[" "] = "_",
		["[:?)(,.]"] = "",
		["á"] = "a",
		["é"] = "e",
		["í"] = "i",
		["ó"] = "o",
		["ú"] = "u",
	}

	for v, w in pairs(replace_table) do
		file_name = file_name:gsub(v, w)
	end

	local filename_path = "sections/" .. file_name .. ".tex"

	return filename_path
end

function _G.latex_new_section()
	-- Get name of the setion from de selection
	local section_name = vim.fn.input("Section name: ")

	if section_name == "" then
		do
			return
		end
	end

	-- Path to the file asociated to the selected section
	local filename_path = get_section_filename_path(section_name)

	-- Write lines in the buffer
	vim.call("setline", ".", "\\section{" .. section_name .. "}")
	vim.call("append", ".", "\\subfile{" .. filename_path .. "}")

	-- Create file with the proper text
	local subfile_text = "\\documentclass[../main.tex]{subfiles}\n\n\\begin{document}\n\n\\end{document}"

	if not file_exists(filename_path) then
		file = io.open(filename_path, "w")
		file:write(subfile_text)
		file:close()
	else
		print(" ")
		print('File "' .. filename_path .. '" already exists')
	end
end

function _G.latex_section_picker()
	opts = opts or {}

	sections_array = {}

	local f = io.popen("find sections")
	i = 0 -- start from 0 becouse I want to skip the first value of f:lines()
	for section in f:lines() do
		sections_array[i] = section
		i = i + 1
	end

	pickers
		.new(themes.get_ivy({}), {
			prompt_title = "Sections",
			finder = finders.new_table(sections_array),
			sorter = sorters.get_fuzzy_file(),

			attach_mappings = function(_, map)
				map("i", "<c-d>", actions.delete_file)
				map("i", "<c-r>", actions.rename_section)

				return true
			end,
		})
		:find()
end

-- Figure

actions.rename_figure = function(prompt_bufnr)
	local old_filename_path = action_state.get_selected_entry()[1]
	actions.close(prompt_bufnr)

	print("Change name of figure " .. old_filename_path)

	local new_figure_name = vim.fn.input("New figure name: ")
	if new_figure_name == "" then
		do
			return
		end
	end

	local new_filename_path = "figs/" .. new_figure_name .. ".png"

	if not file_exists(new_filename_path) then
		-- Raname file
		os.rename(old_filename_path, new_filename_path)
		print(" ")
		print(old_filename_path .. " -> " .. new_filename_path)
	else
		print(" ")
		print('File "' .. filename_path .. '" already exists. No changes were made.')
	end
end

actions.include_figure = function(prompt_bufnr)
	local fig_path = action_state.get_selected_entry()[1]
	actions.close(prompt_bufnr)

	local text = {
		"\\begin{figure}[ht]",
		"    \\centering",
		"    \\includegraphics[width=0.5\\linewidth]{" .. fig_path .. "}",
		"\\end{figure}",
	}
	local current_line = vim.api.nvim_win_get_cursor(0)[1]
	vim.api.nvim_buf_set_lines(0, current_line, current_line, false, text)
end

actions.edit_figure = function(prompt_bufnr)
	local fig_path = action_state.get_selected_entry()[1]
	actions.close(prompt_bufnr)

	vim.fn.system("gimp " .. fig_path .. " &")
end

function _G.latex_figures_picker()
	sections_array = {}

	local f = io.popen("find figs")
	i = 0 -- start from 0 becouse I want to skip the first value of f:lines()
	for section in f:lines() do
		sections_array[i] = section
		i = i + 1
	end

	pickers
		.new(themes.get_ivy({}), {
			prompt_title = "Figures",
			finder = finders.new_table(sections_array),
			sorter = sorters.get_fuzzy_file(),

			attach_mappings = function(_, map)
				map("i", "<c-d>", actions.delete_file)
				map("i", "<c-r>", actions.rename_figure)
				map("i", "<c-e>", actions.edit_figure)
				map("i", "<CR>", actions.include_figure)

				return true
			end,
		})
		:find()
end

function _G.save_last_screenshot()
	local screenshot_file = "~/Documents/screenshots/temp.png"

	local screenshot_name = vim.fn.input("Screenshot name: ")

	if screenshot_name == "" then
		do
			return
		end
	end

	fig_path = "figs/" .. screenshot_name .. ".png"
	os.execute("cp " .. screenshot_file .. " " .. fig_path)

	local text = {
		"\\begin{figure}[ht]",
		"    \\centering",
		"    \\includegraphics[width=0.5\\linewidth]{" .. fig_path .. "}",
		"\\end{figure}",
	}
	local current_line = vim.api.nvim_win_get_cursor(0)[1]
	vim.api.nvim_buf_set_lines(0, current_line, current_line, false, text)
end
