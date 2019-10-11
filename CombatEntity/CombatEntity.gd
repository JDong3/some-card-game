extends Selectable
class_name CombatEntity

"""
parent class for friends and enemies
"""

var fight_club = Global.FIGHT_CLUB
var is_faint = false

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
var character_sprite
var hp_bar

func init(props_):
	"""
	props_:
		name: Str, display name of the CombatEntity
		hp_bar: HpBar, displays the hp of the CombatEntity
		character_sprite: CharacterSprite, the AnimatedSprite of the
			CombatEntity
	"""
	props = props_

	hp_bar = props.hp_bar
	character_sprite = props.character_sprite

	add_child(hp_bar)
	add_child(character_sprite)
	character_sprite.play('idle')

	selected_sprite = Sprite.new()
	selected_sprite.texture = load('res://assets/sprites/entity-selected.png')


	.init(props)

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
	if is_faint:
		return

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
	if hp_bar.hp - amount < 0:
		faintr()
	hp_bar.change_hp(-amount)

func faintr():
	is_faint = true
	render()

func render():
	pass

func process_heal(amount):
	"""
	"""

	props.hp_bar.change_hp(amount)

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