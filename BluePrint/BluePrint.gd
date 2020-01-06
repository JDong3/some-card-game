extends Node
class_name BluePrint

"""
class that represents a BluePrint for the for the map layout algorithm to use,
a BluePrint is just an object that creates a RoomNode of the map, exposes
makeBlueprint function
"""

var map

func _init():
	map = make_map()

func get_nodes(res = []):
	"""
	return: Array<RoomNode>, all room nodes in the map (graph)
	"""
	pass

func get_adj(node):
	var res = []

	res.push_back(node.n)
	res.push_back(node.s)
	res.push_back(node.e)
	res.push_back(node.w)

	return res

func make_map():
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
