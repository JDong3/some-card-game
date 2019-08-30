extends CursorArea
class_name ConnectedCursorArea

var props

func _init(props_).(props_):
	"""
	props_:
		...
		cursor_hub: CursorHub that is shared by the CursorAreas in the group
		id: String unique id within the cursor group
	"""
	props = props_
	props.cursor_hub.add_cursor_area(self, props['id'])