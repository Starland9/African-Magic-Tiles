extends Control


var poss := []

@onready var song: Song = $Song
@onready var timer := $Timer

func _ready():
	timer.wait_time = song.stream.get_length()


func _process(delta):
	if Input.is_action_just_pressed("music_tap"):
		var pos = song.stream.get_length() - timer.time_left
		poss.append(pos)
	
	if Input.is_action_just_pressed("ui_accept"):
		print(poss)


	
