extends Event
class_name Roam

"""
an event that tiggers the *roam* phase of a room (usually the end of the seq)
"""

var dude
var portals
var rome_club = Global.ROME_CLUB
var fight_club = Global.FIGHT_CLUB


func _init(_props):
	"""
	props:
		portals: Array<DoorPortal>
		default_starting_location: Vector2=Vector2(100, 100)
	"""
	props = _props

	if !props.has('portals'):
		portals = []
	else:
		portals = props.portals

	.init(props)

func start():
	dude = rome_club.dude
	dude.focusable.obtain_sole_focus()
	dude.is_move = true
	add_child(dude)

	dude.position = Vector2(100, 100)
	for portal in portals:
		if portal.to == rome_club.last_room:
			dude.position = portal.position

func end():
	if dude in get_children():
		remove_child(dude)
