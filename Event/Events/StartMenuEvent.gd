extends Event
class_name StartMenuEvent

var menu

func _init():
	menu = StartMenuCursorGrid.new()
	var position = Vector2(180, 80)
	menu.set_position(position)
	menu.focus()

	add_child(menu)
	.init(props)




