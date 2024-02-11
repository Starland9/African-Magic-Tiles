extends Control


@onready var song : AudioStreamPlayer2D = $Song
@onready var tileSponer : TileSponer = $TileSponer
@onready var hud = $HUD

@export var GodMode := false

var score := 0

func _ready():
	tileSponer.initTiles(GameManager.current_times)

	song.stream = load(GameManager.current_path)
	song.play()
	_initProgressBar()
	
func _initProgressBar():
	hud.set_audio_player(song)
	

func _on_tile_sponer_wrong():
	get_tree().create_timer(0.1).timeout.connect(_wrong)
	
func _wrong():
	var __ = get_tree().change_scene_to_file("res://Scenes/home.tscn")


func _on_tile_sponer_tile_touch(value: int):
	score += value
	hud.set_score(score)
	
