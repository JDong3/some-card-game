extends Node2D

func _ready():
	var friendlies = FriendlyArea.new()
	var hostiles = HostileArea.new()
	var deck = Deck.new()
	for i in range(30):
		deck.add_card(TestCard.new())

	friendlies.position = Vector2(150, 150)
	hostiles.position = Vector2(250, 150)

	add_child(friendlies)
	add_child(hostiles)
