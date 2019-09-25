extends Node2D

func _ready():
	# FightOrchestrator design incubator
	add_child(Global.GAME_FOCUS_MANAGER)

	var combat_orchestrator = FightOrchestrator.new({
		'hostiles': HostileArea.new()
	})
	add_child(combat_orchestrator)

	# in fight club
	var friendlies = FriendlyArea.new()
	friendlies.position = Vector2(150, 150)
	Global.FIGHT_CLUB.friendlies = friendlies

	# in fight club, need a deck that is filled
	var deck = Deck.new()
	for i in range(10):
		deck.add_card(AttackCard.new())
	Global.FIGHT_CLUB.deck = deck

	combat_orchestrator.start()