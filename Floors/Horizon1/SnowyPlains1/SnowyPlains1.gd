extends EventContainer
class_name SnowyPlains1

"""
Contains the events that make up the SnowyPlains1 Room
"""

var rome_club = Global.ROME_CLUB

func _init():
	props.furniture = SnowyPlains1Furniture.new()
	props.event_pool = {
		'roam': Roam.new({
			'portals': props.furniture.get_portals()
		})
	}
	props.entry = 'roam'

	.init(props)

func end():
	rome_club.last_room = 'snowy_plains_1'
	.end()
