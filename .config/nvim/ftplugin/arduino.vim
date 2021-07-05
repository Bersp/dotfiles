lua << EOF

port = "/dev/ttyACM0"
baud = 115200

function update_commands(port)
	vim.cmd("nmap <buffer> <Leader><CR> :update<bar>!arduino-cli compile -b arduino:avr:uno && arduino-cli upload -p" .. port .. " -b arduino:avr:uno <CR>")

	vim.cmd("nmap <buffer> <Leader><Leader><CR> :update<bar>:sp \\| resize 10 \\| term python ~/.config/bashscripts/serial-monitor-arduino/monitor.py " .. port .. " " .. baud .. " <CR><CR>Ga")
end

function _G.update_port()

	handle = io.popen('arduino-cli board list | head -n 4')
	result = handle:read("*a")
	handle:close()
	print(result)
	print(' ')

	local new_port = vim.fn.input('\nNew port: /dev/tty')
	new_port = '/dev/tty' .. new_port
	update_commands(new_port)
	print(' ')
	print('Port updated to ' .. new_port)
end

update_commands(port)

vim.cmd('command UpdatePort execute "call v:lua.update_port()"')
EOF
