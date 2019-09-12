extends Selectable
class_name CombatEntity

"""
parent class for friends and enemies
"""

# var combat_manager
# var uid

# dot
# var poison
# var bleed

# atk mods (when sending damage)
# var weak

# def mods (when receiving damage)
# var vulnerable
# var evasion

# block mods
# var frail

var selected_sprite

func init(props_):
	"""
	props_:
		name: Str, display name of the CombatEntity
		hp_bar: HpBar
		character_sprite: CharacterSprite
	"""
	props = props_
	add_child(props['hp_bar'])
	add_child(props['character_sprite'])
	props['character_sprite'].play('idle')

	selected_sprite = Sprite.new()
	selected_sprite.texture = load('res://assets/sprites/entity-selected.png')

	return self

func send_transaction(transaction, target):
	"""
	sends a transaction to a target CombatInterface
	:param transaction: Dictionary, a Dictionary describing the transaction
	transaction:
		poison?:
		weaken?:
		.
		.
		.
	:param target: CombatInterface, the CombatInterface of the target you are sending
	the transaction to
	"""
	target.process_transaction(transaction)

func process_transaction(transaction):
	"""
	processes a transaction sent by another CombatInterface
	processes damage first, then effects
	:param transaction: Dictionary, a Dictionary describing the transaction
	transaction:
		poison?:
		weaken?:
		.
		.
		.
	"""
	if transaction.has('damage'):
		process_damage(transaction['damage'])
	#if transaction.has('poison'):
	#	poison += transaction['poison']
	#pass

func process_damage(damage):
	props['hp_bar'].change_hp(-damage)

func process_dot():
	pass

func input(event):
	pass

func select():
	if !is_selected:
		add_child(selected_sprite)
		is_selected = true

func deselect():
	if is_selected:
		remove_child(selected_sprite)
		is_selected = false