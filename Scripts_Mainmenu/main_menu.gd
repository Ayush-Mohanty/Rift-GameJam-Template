extends Control
@onready var animation_player: AnimationPlayer = $ColorRect/AnimationPlayer

func _on_options_pressed():
	get_tree().change_scene_to_file("res://Scripts_Mainmenu/settings.tscn")


func _on_quit_pressed():
	get_tree().quit()


func _on_play_pressed():
	get_tree().change_scene_to_file("res://scripts_cutscene/cs1.tscn")
	

	
func _process(delta):
	animation_player.play("fade_in")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	queue_free()
