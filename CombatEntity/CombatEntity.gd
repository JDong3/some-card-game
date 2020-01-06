extends Bass
class_name CombatEntity

"""
parent class for friends and enemies
"""

var fight_club = Global.FIGHT_CLUB
var is_faint = false
var is_move = false # whether the objects moves or not

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
var area

var play_anim # ????

func init(_props):
	"""
	_props:
		area=def: Area2D, area with collision shape
		character_sprite: CharacterSprite, AnimatedSprite of the CombatEntity
		hp_bar: HpBar, displays the hp of the CombatEntity
		name: Str, display name of the CombatEntity
		offset: Vector2
	"""
	props = _props

	is_move = false

	hp_bar = props.hp_bar
	character_sprite = props.character_sprite

	if !props.has('area'):
		area = CapsuleArea.new({'radius': 20})

	combobulate()
	.init(props)

func combobulate():
	add_child(hp_bar)
	add_child(character_sprite)
	play('idle')

	selected_sprite = PathSprite.new('res://assets/sprites/entity-selected.png')
	add_child(area)

func play(anim):
	"""
	plays an anim of character_sprite
	"""
	character_sprite.play(anim)

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
		return # print()
		fight_club.transaction_interface.add_target(self)
	if is_move:
		input_move(event)
	.input(event)

# moveable
func input_move(event):
	if event.is_action_pressed('roam_up'):
		is_move_up = true
	if event.is_action_released('roam_up'):
		is_move_up = false
	if event.is_action_pressed('roam_down'):
		is_move_down = true
	if event.is_action_released('roam_down'):
		is_move_down = false
	if event.is_action_pressed('roam_left'):
		is_move_left = true
	if event.is_action_released('roam_left'):
		is_move_left = false
	if event.is_action_pressed('roam_right'):
		is_move_right = true
	if event.is_action_released('roam_right'):
		is_move_right = false

func _process(delta):
	var speed = 100
	if is_move_up:
		position.y -= delta * speed
	if is_move_down:
		position.y += delta * speed
	if is_move_right:
		position.x += delta * speed
	if is_move_left:
		position.x -= delta * speed

# animation stuff

func on_card():
	"""
	triggers the sequence of animations that needs to be played after you play
	a card or a card bundle

	the args are got form the TransactionInterface from the FightClub
	"""
	var timer
	var cards = fight_club.transaction_interface.cards

	# check card type to know what animation the actor needs to play
	if cards[0].metadata.animation.casecmp_to('attack') == 0:
		play('attack')
	else:
		play('block')
	# start timer

	while true:
		timer = Timer.new()
		add_child(timer)
		timer.one_shot = true
		timer.connect('timeout', self, 'on_card_reaction')
		timer.start(0.7)
		break

func on_card_reaction():
	"""
	triggered when a card is played
	"""
	var targets = fight_club.transaction_interface.targets
	var cards = fight_club.transaction_interface.cards
	var source = fight_club.transaction_interface.source
	print(targets)
	targets[0].character_sprite.play('block')

	for target in fight_club.transaction_interface.targets:
		source.send_transaction(cards[0].props.transaction, target)
		fight_club.hand.remove_card(cards[0])
		fight_club.discard_pile.add_card(cards[0])

	fight_club.transaction_interface.clear()