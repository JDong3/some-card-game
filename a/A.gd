extends Node2D

func _ready():
	var cell = StartCell.new()
	self.add_child(cell)