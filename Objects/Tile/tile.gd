extends TextureRect
class_name Tile

signal wrong()
signal touch(value: int)
signal bloc_all_tiles()

@onready var anim_player = $AnimPlayer

var screen_size
var dir := 1
var speed = 600.0
var is_wrong = false

func _ready():
	screen_size = get_viewport_rect().size
	custom_minimum_size.x = (screen_size.x / 4)
	custom_minimum_size.y = (screen_size.y / 4.5)
	size = custom_minimum_size

	

func _process(delta):
	position.y += speed * delta * dir
	
	if position.y > screen_size.y + custom_minimum_size.y:
		if not _disabled():
			dir = -1
			speed *= 0.6
			is_wrong = true
			anim_player.play("wrong")
			bloc_all_tiles.emit()
			get_tree().create_timer(1).timeout.connect(_wrong)
			
func bloc() -> bool:
	if not is_wrong:
		dir = 0
	return is_wrong
		
func _wrong():
	wrong.emit()

func _desable():
	modulate.a = 0.2
	
func _disabled():
	return modulate.a < 0.3

func _on_touch_pressed():
	_desable()
	touch.emit(1)
