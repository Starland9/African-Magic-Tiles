extends Panel
class_name MusicListItem

@export var json_file: JSON

@onready var title : Label = $HBoxContainer/VBoxContainer/Title
@onready var artists : Label = $HBoxContainer/VBoxContainer/Artits
@onready var player : AudioStreamPlayer2D = $Player

var times : Array
var path : String

func _ready():
	pass


func initItem(json_file: JSON):
	var data = json_file.data
	
	title.text = data.title
	
	artists.text = ""
	for artist in data.artists:
		artists.text += artist + ", "
		
	times = data.times
	
	player.stream = load(data.path)
	path = data.path
	
	


func _on_play_btn_pressed():
	GameManager.current_path = path
	GameManager.current_times = times
		
	get_tree().create_timer(0.5).timeout.connect(_goToPlayScene)
	
func _goToPlayScene():
	var __ = get_tree().change_scene_to_file("res://Scenes/main.tscn")
	
