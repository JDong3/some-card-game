extends Cell
class_name Card

var fight_club
var transaction
var metadata

func init(_props):
	"""
	_props:
		sprite: Sprite
		SelectedSprite: Sprite
		text: String
		source+: CombatEntity

		metadata: Dict
			single_target: bool=false
			multi_target: int=0, if greater then 0 this is treated as true
			group_target: bool=false

			target_hostile: bool=True

			animation: str='attack'

		transaction:
			# primary effects
			damage: int, how much damage the card does
			heal: int
			block: int

			# status effects
			poison: int, decrement by 1
			weakness: int, halved then floored
			vulnerability: int, halved then floored

			# modifiers
			times: int=1, how many times to do the attack
			aoe: bool=false
	"""
	props = _props
	transaction = props.transaction
	metadata = props.metadata
	fight_club = Global.FIGHT_CLUB

	if !metadata.has('animation'):
		metadata.animation = 'attack'


	# defaults for metadata
	if !props.metadata.has('single_target'):
		props.metadata.single_target = false
	if !props.metadata.has('multi_target'):
		props.metadata.multi_target = false
	if !props.metadata.has('group_target'):
		props.metadata.group_target = false
	if !props.metadata.has('target_hostile'):
		props.metadata.target_hostile = true

	# defaults for transaction


	.init(props)

func input(event):
	"""
	add the card transaction and source to the transaction_interface
	:return: null
	"""
	.input(event)

	if event.is_action_released('cursor_select'):
		fight_club.transaction_interface.add_card(self) # probably need to fix this hack
		fight_club.transaction_interface.add_source(props.source)
