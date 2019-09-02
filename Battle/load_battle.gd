extends TileMap

func _ready():
	# load hand
	var c_hub = CursorHub.new()
	var hand = Hand.new({
		'cells': [TestCardCell.new({'source': 'a'}), TestCardCell.new({'source': 'a'})],
		'cursor_hub': c_hub
	})
	hand.set_position(Vector2(120, 270))
	add_child(hand)

	var friendly = FriendlyArea.new({
		'cursor_hub': c_hub
	})
	friendly.set_position(Vector2(80, 140))
	add_child(friendly)

	var hostile = HostileArea.new({
		'cursor_hub': c_hub
	})
	hostile.set_position(Vector2(300, 140))
	add_child(hostile)