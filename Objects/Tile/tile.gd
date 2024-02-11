extends TextureRect
class_name Tile

signal wrong()
signal touch()

var screen_size
var dir := 1
var speed = 600.0

func _ready():
	screen_size = get_viewport_rect().size
	custom_minimum_size.x = (screen_size.x / 4)
	custom_minimum_size.y = (screen_size.y / 4.5)
	size = custom_minimum_size

	

func _process(delta):
	position.y += speed * delta * 1
	
	if position.y > screen_size.y:
		if not _disabled():
			_wrong()
		
func _wrong():
	dir = -1
	speed *= 0.5
	modulate.r = 1
	wrong.emit()

	

func _desable():
	modulate.a = 0.2
	
func _disabled():
	return modulate.a < 0.3

func _on_touch_pressed():
	_desable()
	touch.emit()
