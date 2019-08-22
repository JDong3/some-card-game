extends Node2D

var cursor_grid

func make_sprite(texture_path):
	var res = Sprite.new()
	res.texture = load(texture_path)
	return res

func _ready():
	# set position of the cursor area
	var pos_x = get_viewport_rect().size.x / 2 - 48
	var pos_y = get_viewport_rect().size.y / 2 - 16*3
	var position = Vector2(pos_x, pos_y)
	set_position(position)

	var config = {
		'dimensions': Vector2(1, 3),
		'cell_size': Vector2(96, 32),
		'cells': [StartCell.new(), SettingsCell.new(), QuitCell.new()],
		'focus_interface': State.StartFocusManager.obtain_interface('start_menu_cluster')
	}

	cursor_grid = CursorGrid.new(config)
	add_child(cursor_grid)