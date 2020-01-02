extends Event
class_name CharacterSelectEvent

var menu

func _init():
	menu = CharacterSelectCursorGrid.new()
	add_child(menu)