function _G.save_last_screenshot ()
	local screenshot_file = '~/Documents/screenshots/temp.png'

	local fn = vim.fn

	local nums = {}
	for n in fn.glob('figs/*'):gmatch('figs/ss(%d)') do
		nums[#nums + 1] = n
	end

	table.sort(nums)
	local max = nums[#nums]

	if max == nil then max = 0 end

	fig_path = 'figs/ss' .. max+1 .. '.png'
	os.execute('cp ' .. screenshot_file .. ' ' .. fig_path)
	print('Copied ' .. screenshot_file .. ' as ' .. fig_path)

	vim.call('setline', '.', '\\begin{figure}[ht]')
	vim.call('append', '.', '\\end{figure}')
	vim.call('append', '.', '	\\includegraphics[width=0.5\\textwidth]{' .. fig_path .. '}')
	vim.call('append', '.', '	\\centering')

end

function _G.subscribe_screenshot ()
	local screenshot_file = '~/Documents/screenshots/temp.png'

	local fn = vim.fn

	local nums = {}
	for n in fn.glob('figs/*'):gmatch('figs/ss(%d)') do
		nums[#nums + 1] = n
	end

	table.sort(nums)
	local max = nums[#nums]
	if max == nil then
		max = 0
		print('There are no images in figs/')
		do return end
	end

	local screenshot_name = vim.fn.input('Name of the screenshot: ')
	if screenshot_name == '' then
		do return end
	end

	fig_path = 'figs/' .. screenshot_name .. '.png'
	os.execute('cp ' .. screenshot_file .. ' ' .. fig_path)
	print(' ')
	print('Copied ' .. screenshot_file .. ' as ' .. fig_path)
end
