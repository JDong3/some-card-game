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

func get_nodes():
	var res = []
	xd(map, res)
	return res

func xd(head=map, res=[]):
	"""
	some weird algorithm that gradually fills res with the nodes of the graph
	"""
	# add self to results if not visited
	if not head in res:
		res.push_back(head)

	# base case, if all adj are visited exit
	var adj_all_visited = true
	var adj = get_adj(head)

	for node in adj:
		if not node in res:
			adj_all_visited = false
	if adj_all_visited:
		return res

	# recur
	for node in adj:
		xd(node, res)


func get_adj(node):
	var res = []
	if node.n:
		res.push_back(node.n)
	if node.s:
		res.push_back(node.s)
	if node.e:
		res.push_back(node.e)
	if node.w:
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

	head = RoomNode.new()
	sec = RoomNode.new()
	third = RoomNode.new()

	head.s = sec
	head.n = sec
	head.e = sec
	head.w = sec


	head.uid = 0
	sec.n = head
	sec.s = third
	sec.uid = 1
	third.n = sec
	third.uid = 2

	return head
