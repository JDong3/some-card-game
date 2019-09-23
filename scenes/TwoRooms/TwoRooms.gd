extends Node2D

var Room = load('res://scenes/TwoRooms/Room.tscn')

func _ready():
	var my_room = Room.instance()

	add_child(my_room)

	var my_room2 = Room.instance()
	my_room2.position = Vector2(100, 100)
	add_child(my_room2)
