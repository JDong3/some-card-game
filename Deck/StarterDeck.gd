extends Deck
class_name StarterDeck

func _init():
	props.cards = [AttackCard.new(), AttackCard.new(), AttackCard.new(),
	               HealCard.new()]
	.init(props)

