extends Control


func _on_video_stream_player_finished() -> void:
	get_tree().change_scene_to_file("res://scripts_cutscene/cs_6.tscn")
