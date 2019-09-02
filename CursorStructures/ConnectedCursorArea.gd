extends CursorArea
class_name ConnectedCursorArea

func make_props():
	var res = {
		'focus_interface': Global.GAME_FOCUS_MANAGER.obtain_interface()
	}
	return

func _init(props_).(props_):
	"""
	props_:
		...
		cursor_hub+: CursorHub that is shared by the CursorAreas in the group
		id: String unique id within the cursor group
	"""
	for key in props_:
		props[key] = props_[key]