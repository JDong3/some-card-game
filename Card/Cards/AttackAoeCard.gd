extends Card
class_name AoeAttackCard

func _init():
	props.sprite = CardSprite.new('res://assets/cards/aoe-attack.png')
	props.selected_sprite = CardSprite.new('res://assets/cards/card-outline.png')
	props.transaction = {
		'damage': 6
	}
	props.metadata = {
		'group_target': true,
		'target_group': true
	}
	.init(props)
