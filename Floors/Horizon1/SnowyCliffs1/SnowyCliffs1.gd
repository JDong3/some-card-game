extends EventContainer
class_name SnowyCliffs1

var rome_club = Global.ROME_CLUB

func _init():
	props.furniture = SnowyCliffs1Funiture.new()
	props.event_pool = {
		'roam': Roam.new({
			'portals': props.furniture.get_portals()
		})
	}
	props.entry = 'roam'
	.init(props)

func end():
	rome_club.last_room = 'snowy_cliffs_1'
	.end()


