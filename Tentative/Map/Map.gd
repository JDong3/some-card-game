extends ViewportContainer

var MapRoom = load('res://Map/MapRoom.tscn')

func _init():
	var myMapRoom = MapRoom.instance()
	myMapRoom.config({'position': Vector2(100, 100)})
	self.add_child(myMapRoom)

func input(event):
	self.get_node('MapViewport').input(event)
