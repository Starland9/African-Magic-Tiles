extends Control


@onready var animator : AnimationPlayer = $AnimationPlayer


func  _ready():
	animator.play("loading_rotation")
	#animator.play("label_anim")


func _on_timer_timeout():
	var __ = get_tree().change_scene_to_file(GameManager.next_scene)
