extends EventContainer
class_name SnowyPlains1

"""
Contains the events that make up the SnowyPlains1 Room
"""

func _init():
	props.event_pool = {
		'roam': Roam.new()
	}
	props.entry = 'roam'
	props.furniture = SnowyPlains1Furniture.new()
	.init(props)