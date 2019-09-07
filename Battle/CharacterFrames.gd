extends SpriteFrames
class_name CharacterFrames

var path

func init(path_):
	"""
	path: path to animation folder
	"""
	path = path_
	combobulate()

func combobulate():
	# directory controller
	var dir = Directory.new()
	var item_name

	# open the folder which contains folders for different animations
	dir.open(path)
	dir.list_dir_begin(true, true)

	while true:
		item_name = dir.get_next()

		print(item_name)

		# break when all dir items are listed
		if item_name.casecmp_to('') == 0:
			break

		# skip if item is not a dir
		if !dir.current_is_dir():
			continue

		# add the animation if it is a dir
		if dir.current_is_dir():
			process_animation(item_name)

func process_animation(dir_name):
	"""
	add animation to SpriteFrames
	:param dir_name: String
	"""
	pass

