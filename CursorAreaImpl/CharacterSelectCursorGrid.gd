extends CursorGrid
class_name CharacterSelectCursorGrid



func _init():
	props.dimensions = Vector2(1, 1)
	props.cell_size = Vector2(96, 32)
	props.focus_manager = Global.GAME_FOCUS_MANAGER
	props.cells = [BardCell.new()]

	.init(props)