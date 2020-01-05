extends CursorGrid
class_name StartMenuCursorGrid

func _init():
	props['dimensions'] = Vector2(1, 3)
	props['cell_size'] = Vector2(96, 32)
	props['cells'] = [StartCell.new(), SettingsCell.new(), QuitCell.new()]
	props['focus_manager'] = Global.GAME_FOCUS_MANAGER

	print('startmeu ', self)
	.init(props)
