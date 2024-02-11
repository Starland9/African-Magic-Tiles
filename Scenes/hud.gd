extends CanvasLayer
class_name HUD

@onready var score_label = $Control/Label
@onready var progress_bar : ProgressBar = $Control/ProgressBar
@onready var score_anim = $ScoreAnim

var audio_player : AudioStreamPlayer2D

func _ready():
	pass

func set_score(value: int):
	_animate_score()
	score_label.text = str(value)

func _animate_score():
	score_anim.play("score_anim")


func set_audio_player(player : AudioStreamPlayer2D):
	audio_player = player
	var stream = audio_player.stream
	progress_bar.min_value = 0.0
	progress_bar.max_value = stream.get_length()
	
func _process(delta):
	progress_bar.value = audio_player.get_playback_position() if not audio_player == null else 0.0
	


func _on_to_home_btn_pressed():
	GameManager.change_scene_to("res://Scenes/home.tscn")
