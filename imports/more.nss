menu(type = '*' where = (sel.count or wnd.is_taskbar or wnd.is_edit) title = '更多' sep = 'top' image=\uE253)
{
	item(where=window.is_taskbar||sel.count title='设置' image=\uE0F3 cmd='ms-settings:')
	item(where=window.is_taskbar||sel.count title='系统信息' image=\uE0F3 cmd='ms-settings:about')
	item(where=window.is_taskbar||sel.count title='个性化' image=\uE0F3 cmd='ms-settings:personalization')
	item(where=window.is_taskbar||sel.count title='显示设置' image=\uE0F3 cmd='ms-settings:display')

	separator
	menu(where=sel.count>0 type='file|dir|drive|namespace|back' title=title.copy_path image=icon.copy_path)
	{
		item(where=sel.count > 1 title='Copy (@sel.count) items selected' cmd=command.copy(sel(false, "\n")))
		item(mode="single" title=@sel.path tip=sel.path cmd=command.copy(sel.path))
		item(mode="single" type='file' separator="before" find='.lnk' title='open file location')
		separator
		item(mode="single" where=@sel.parent.len>3 title=sel.parent cmd=@command.copy(sel.parent))
		separator
		item(mode="single" type='file|dir|back.dir' title=sel.file.name cmd=command.copy(sel.file.name))
		item(mode="single" type='file' where=sel.file.len != sel.file.title.len title=@sel.file.title cmd=command.copy(sel.file.title))
		item(mode="single" type='file' where=sel.file.ext.len>0 title=sel.file.ext cmd=command.copy(sel.file.ext))
	}
	menu(mode="single" type='back' expanded=true)
	{
		menu(title='New Folder' image=icon.new_folder)
		{
			item(title='DateTime' cmd=io.dir.create(sys.datetime("ymdHMSs")))
			item(title='Guid' cmd=io.dir.create(str.guid))
		}

		menu(title='New File' image=icon.new_file)
		{
			var { dt = sys.datetime("ymdHMSs")}
			item(title='TXT' cmd=io.file.create('@(dt).txt', 'Hello World!'))
			item(title='XML' cmd=io.file.create('@(dt).xml', '<root>Hello World!</root>'))
			item(title='JSON' cmd=io.file.create('@(dt).json', '[]'))
			item(title='HTML' cmd=io.file.create('@(dt).html', "<html>\n\t<head>\n\t</head>\n\t<body>Hello World!\n\t</body>\n</html>"))					
		}
	}
}