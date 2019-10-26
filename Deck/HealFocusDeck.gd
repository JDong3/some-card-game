extends Deck
class_name HealFocusDeck

func _init():
	props.cards = [AttackCard.new(), AttackCard.new(), AttackCard.new(),
				   HealCard.new(), HealCard.new(), HealCard.new(),
				   HealCard.new(), HealCard.new(), HealCard.new(),
	               HealCard.new(), AoeHealCard.new(), AoeHealCard.new(),
				   AoeHealCard.new()]
	.init(props)

