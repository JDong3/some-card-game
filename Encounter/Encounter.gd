extends Node
class_name Encounter


var props = {}


"""
starts with pre fight animations/dialogue etc

then animations to get fight ready
then fight starts
then fight ends
some animations for fight end

player has ability to explore the room

for now when player enter a room there is just a fight
"""

func init(_props):
	"""
	_props:
		room: PackedScene
		fight/battle: the enemies and intro animations associated
	"""
	pass

func encount():
	"""
	directs the flow of the encounter
	"""
	pass