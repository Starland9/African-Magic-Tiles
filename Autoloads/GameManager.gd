extends Node

var current_path : String
var current_times : Array

var current_scene : String
var next_scene : String
var previous_scene : String


func change_scene_to(new_scene_path: String):
	next_scene = new_scene_path
	var __ = get_tree().change_scene_to_file("res://Scenes/loading_screen.tscn")
	
