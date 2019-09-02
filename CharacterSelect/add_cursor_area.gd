extends Node2D

func _ready():
	var pos_x = get_viewport_rect().size.x / 2 - 48
	var pos_y = get_viewport_rect().size.y / 2 - 3*16
	set_position(Vector2(pos_x, pos_y))

	var config = {
		'dimensions': Vector2(1, 1),
		'cell_size': Vector2(96, 32),
		'focus_interface': Global.CHARACTER_FOCUS_MANAGER.obtain_interface(),
		'cells': [BardCell.new()]
	}

	var cursor_grid = CursorGrid.new(config)

	add_child(cursor_grid)