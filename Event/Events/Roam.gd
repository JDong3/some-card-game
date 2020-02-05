extends Event
class_name Roam

"""
an event that tiggers the *roam* phase of a room (usually the end of the seq)
"""

var dude
var from
var portals



func _init(props_):
	"""
	props:
		from: String,
		portals: Array<DoorPortal>
	"""
	from = props.from
	portals = props.portals

	.init(props_)

func start():
	dude = DudeEntity.new()
	dude.focusable.obtain_sole_focus()
	dude.is_move = true
	add_child(dude)

	dude.position = Vector2(100, 100)
	for portal in portals:
		if portal.to == from:
			dude.position = portal.position


func end():
	if dude in get_children():
		remove_child(dude)
