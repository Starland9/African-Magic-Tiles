extends Control


const music_item_scene := preload("res://Objects/MusicListItem/music_list_item.tscn")

@onready var v_box : VBoxContainer = $ScrollContainer/VBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	_load_songs()


func _load_songs():
	var files := DirAccess.get_files_at("res://Musics/")
	for file in files:
		var jsonFile := JSON.new()
		jsonFile = load("res://Musics/" + file)
		var music_item : MusicListItem = music_item_scene.instantiate()
		v_box.add_child(music_item)
		music_item.initItem(jsonFile)

func _on_play_btn_pressed():
	var __ = get_tree().change_scene_to_file("res://Scenes/main.tscn")
