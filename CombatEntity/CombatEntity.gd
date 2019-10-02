extends Selectable
class_name CombatEntity

"""
parent class for friends and enemies
"""

var fight_club = Global.FIGHT_CLUB

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
		hp_bar: HpBar, displays the hp of the CombatEntity
		character_sprite: CharacterSprite, the AnimatedSprite of the
			CombatEntity
	"""
	props = props_
	add_child(props['hp_bar'])
	add_child(props['character_sprite'])
	props['character_sprite'].play('idle')

	selected_sprite = Sprite.new()
	selected_sprite.texture = load('res://assets/sprites/entity-selected.png')

func send_transaction(transaction, target):
	# handle case for targeted card
		target.process_transaction(transaction, self)

func process_transaction(transaction, source):
	"""
	processes a transaction sent by another CombatInterface
	processes damage first, then effects
	:param transaction: Dictionary, a Dictionary describing the transaction
	transaction: see card defn
	"""
	# process primary effects, taking into account the modifiers
	if transaction.has('damage'):
		process_damage(transaction.damage)
	if transaction.has('heal'):
		process_heal(transaction.heal)
	if transaction.has('block'):
		process_block(transaction.block)

	#if transaction.has('poison'):
	#	poison += transaction['poison']
	#pass

func process_damage(amount):
	"""
	reponsible for making sure that CombatEntity takes the correct amount of
	damage
	:param amount: int, how much damage
	"""
	# looks at self vulnerable, adversary weakness
	props['hp_bar'].change_hp(-amount)

func process_heal(amount):
	"""
	"""
	pass

func process_block(amount):
	pass

func prepare():
	pass

func act():
	pass

func select():
	if !is_selected:
		add_child(selected_sprite)
		is_selected = true

func deselect():
	if is_selected:
		remove_child(selected_sprite)
		is_selected = false

func input(event):
	if event.is_action_released('cursor_select'):
		fight_club.transaction_interface.add_target(self)