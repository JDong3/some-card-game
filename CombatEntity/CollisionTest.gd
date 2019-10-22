extends Node2D

func _ready():
	var inter = DangerInt.new()
	inter.position = Vector2(200, 200)
	add_child(inter)