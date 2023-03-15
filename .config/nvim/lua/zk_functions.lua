function get_vtext()
  local a_orig = vim.fn.getreg('a')
  local mode = vim.fn.mode()
  if mode ~= 'v' and mode ~= 'V' then
    vim.cmd[[normal! gv]]
  end
  vim.cmd[[normal! "aygv]]
  local text = vim.fn.getreg('a')
  vim.fn.setreg('a', a_orig)
  return text
end


function _G.delete_file()
	vtext = get_vtext()
	os.remove(vtext)
end

function _G.paste_image()
	local screenshot_file = "~/Documents/screenshots/temp.png"


	cmd_paste = "xclip -selection clipboard -t image/png -o > "
	local img_name = vim.fn.input("Screenshot name: ")
	current_file_name = vim.fn.expand('%<.md')

	fig_path = "source/images" .. current_file_name .. "_" .. img_name .. ".png"
	os.execute(cmd_paste .. fig_path)

	local text = "![img_name](" .. fig_path .. ")"
	local current_line = vim.api.nvim_win_get_cursor(0)[1]
	vim.api.nvim_buf_set_lines(0, current_line, current_line, false, { text })
end
