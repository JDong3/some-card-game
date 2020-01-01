extends Node
class_name BluePrint

"""
class that represents a BluePrint for the for the map layout algorithm to use,
a BluePrint is just an object that creates a RoomNode of the map, exposes
makeBlueprint function
"""

func make_blueprint():
	"""
	returns a blueprint of the floor map, a blueprint is a graph that represents
	the floor
	:param n: int, number of nodes in the graph
	"""
	var head
	var sec
	var third

	head = RoomNode.new({
		n: null,
		e: null,
		s: sec,
		w: null
	});

	sec = RoomNode.new({
		n: head,
		e: null,
		s: third,
		w: null
	});

	third = RoomNode.new({
		n: sec,
		e: null,
		s: null,
		w: null
	})

	return head
