extends Sprite

var MapRoom = load('res://Map/MapRoom.gd')

func _init():
	var myMapRoom = MapRoom.new()
	self.add_child(myMapRoom)