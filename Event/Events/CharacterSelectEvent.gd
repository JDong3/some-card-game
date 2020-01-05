extends Event
class_name CharacterSelectEvent

var menu

func _init():
	menu = CharacterSelectCursorGrid.new()

func start():
	menu.focus()
	menu.position = Vector2(180, 100)
	add_child(menu)