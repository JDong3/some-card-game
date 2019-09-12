extends AnimatedSprite
class_name CharacterSprite

var path

func _init(path_):
	path = path_
	frames = CharacterFrames.new(path)