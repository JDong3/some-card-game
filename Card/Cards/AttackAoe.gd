extends Card

func _init():
	props.sprite
	props.selected_sprite
	props.transaction = {
		'damage': 6
	}
	props.metadata = {
		'target_group': true
	}
	.init(props)