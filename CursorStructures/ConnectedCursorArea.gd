extends CursorArea
class_name ConnectedCursorArea

func init(props_):
	"""
	:param props: Dictionary
	props_:
		cells: list of Cells that are contained in the CursorArea,
		focus_interface: FocusInterface obj

		cursor_hub: CursorHub that is shared by the CursorAreas in the group
		id: String unique id within the cursor group
	"""
	props = props_

	props['cursor_hub'].add_cursor_area(self, props['id'])

	.init(props)

	return self
