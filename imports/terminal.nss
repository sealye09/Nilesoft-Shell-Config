menu(type='*' where=(sel.count or wnd.is_taskbar or wnd.is_edit) title=title.terminal sep=sep.top image=icon.run_with_powershell)
	{
		$tip_run_admin=["\xE1A7 Press SHIFT key to run " + this.title + " as administrator", tip.warning, 1.0]
		$has_admin=key.shift() or key.rbutton()
		
		item(where=package.exists("WindowsTerminal") title=title.Windows_Terminal tip=tip_run_admin admin=has_admin image='@package.path("WindowsTerminal")\WindowsTerminal.exe' cmd="wt.exe" arg=`-d "@sel.path\."`)
		// item(title=title.windows_powershell admin=has_admin tip=tip_run_admin image cmd-ps=`-noexit -command Set-Location -Path '@sel.dir'`)
		item(title="Powershell" admin=has_admin tip=tip_run_admin image=icon.powershell cmd='wt.exe' args='-p "PowerShell" -d .')
		item(title="Nushell" admin= has_admin tip=tip_run_admin image=icon.nushell cmd='wt.exe' args='-p "Nushell" -d .')
		item(title="Git Bash" admin= has_admin tip=tip_run_admin image=icon.git_bash cmd='wt.exe' args='-p "Git Bash" -d .')
		item(title="WSL Ubuntu" admin= has_admin tip=tip_run_admin  image=icon.ubuntu cmd='wt.exe' arg='-p "Ubuntu 22.04.3 LTS" -d .')
		item(title=title.command_prompt tip=tip_run_admin admin=has_admin image cmd-prompt=`/K TITLE Command Prompt &ver& PUSHD "@sel.dir"`)
	}