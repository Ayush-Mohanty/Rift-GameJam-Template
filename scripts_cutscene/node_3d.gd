extends Node3D

func _ready():
	$Timer.timeout.connect(_on_timeout)

func _on_timeout():
	get_tree().change_scene_to_file("res://scripts_cutscene/cs_2.tscn")
