

menu(type = '*' where = (sel.count or wnd.is_taskbar or wnd.is_edit) title = title.terminal sep = 'top' image = icon.run_with_powershell)
{
	var{ tip_run_admin = ["Press SHIFT key to run " + this.title + " as administrator", tip.warning, 1.0] }
	item(where = sys.ver.major >= 10 title = title.Windows_Terminal tip = tip_run_admin admin = key.shift() image = '@package.path("WindowsTerminal")\WindowsTerminal.exe' cmd = 'wt.exe' arg = '-d "@sel.path\."')
	item(title = "Git Bash" admin = @key.shift() tip = tip_run_admin image = 'D:\Program Files\Git\mingw64\share\git\git-for-windows.ico' cmd = 'wt.exe' args = '-p "Git Bash" -d .')
	item(title = title.command_prompt tip = tip_run_admin admin = key.shift() image cmd = 'cmd.exe')
	// item(title = "powershell" admin = @key.shift() tip = tip_run_admin image cmd = 'pwsh.exe' args = '-noexit -command Set-Location -Path "@sel.dir\."')
}