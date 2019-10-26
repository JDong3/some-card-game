extends Deck
class_name AttackFocusDeck

func _init():
	props.cards = [AttackCard.new(), AttackCard.new(), AttackCard.new(),
				   AttackCard.new(), AttackCard.new(), AoeAttackCard.new(),
				   AoeAttackCard.new(), AoeAttackCard.new(),
				   AoeAttackCard.new(),AoeAttackCard.new(), HealCard.new(),
				   AoeHealCard.new()]
	.init(props)

