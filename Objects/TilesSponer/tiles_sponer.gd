extends Control
class_name TileSponer

signal wrong()
signal tile_touch()

const tile_scene = preload("res://Objects/Tile/tile.tscn")
var _init_random_pos_x := [0, 1]

@export var tile_y_spacing := 600.0

func _ready():
	pass
	
func initTiles(times: Array):
	var init_y := 0.0
	for time in times:
		var rnd_pos_x = _getRandomPosX()
		var tile: Tile = tile_scene.instantiate()
		add_child(tile)
		tile.position.y -= time * tile_y_spacing + init_y
		tile.position.x = ( get_viewport_rect().size.x / 4 * rnd_pos_x)
		tile.position.x += rnd_pos_x
		tile.wrong.connect(_on_Tile_wrong)
		tile.touch.connect(_on_Tile_touch)
		init_y += 0.05
		
func _getRandomPosX() -> int:
	var new_random_pos_x := randi_range(0, 3);
	if new_random_pos_x in _init_random_pos_x:
		return _getRandomPosX()
	else:
		_init_random_pos_x.pop_front()
		_init_random_pos_x.push_back(new_random_pos_x)
		return new_random_pos_x
		

func  _on_Tile_wrong():
	wrong.emit()
	
func _on_Tile_touch():
	tile_touch.emit()

