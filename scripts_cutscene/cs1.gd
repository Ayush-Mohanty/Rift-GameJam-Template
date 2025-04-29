extends Control

func _on_video_stream_player_finished() -> void:
 get_tree().change_scene_to_file("res://demo_level/world_castle.tscn")
