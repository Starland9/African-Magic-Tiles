extends Control

var poss := []

@onready var song : AudioStreamPlayer2D = $Song
@onready var tileSponer : TileSponer = $TileSponer
@onready var score_label : Label = $HUD/Control/Label

var score := 0

func _ready():
	tileSponer.initTiles(GameManager.current_times)

	song.stream = load(GameManager.current_path)
	song.play()
	

func _on_tile_sponer_wrong():
	get_tree().create_timer(0.1).timeout.connect(_wrong)
	
func _wrong():
	var __ = get_tree().change_scene_to_file("res://Scenes/home.tscn")


func _on_tile_sponer_tile_touch():
	score += 1
	score_label.text = str(score)
	
