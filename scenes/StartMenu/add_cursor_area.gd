extends Node2D

func _ready():
	# set position of the cursor area
	var pos_x = get_viewport_rect().size.x / 2 - 48
	var pos_y = get_viewport_rect().size.y / 2 - 16*3
	var position = Vector2(pos_x, pos_y)
	set_position(position)

	var start_menu = StartMenuCursorGrid.new()
	start_menu.focus()
	add_child(start_menu)

	add_child(Global.START_FOCUS_MANAGER)
