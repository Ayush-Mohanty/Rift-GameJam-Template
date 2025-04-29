extends Node2D

@onready var animation_player: AnimationPlayer = $ColorRect/AnimationPlayer

func _ready():
	var bus_index = AudioServer.get_bus_index("Master")
	var db = AudioServer.get_bus_volume_db(bus_index)
	$MasterVolumeSlider.value = db_to_linear(db)
	animation_player.play("change")

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://Scripts_Mainmenu/main_menu.tscn")

func _on_full_screen_toggled(toggled_on: bool) -> void:
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

func _on_v_sync_toggled(toggled_on: bool) -> void:
	var vsync_mode = 1 if toggled_on else 0
	ProjectSettings.set_setting("display/window/vsync/vsync_mode", vsync_mode)
	DisplayServer.window_set_vsync_mode(vsync_mode)

func _on_master_volume_slider_value_changed(value: float) -> void:
	var bus_index = AudioServer.get_bus_index("Master")

	if value == 0:
		AudioServer.set_bus_mute(bus_index, true)
	else:
		AudioServer.set_bus_mute(bus_index, false)
		AudioServer.set_bus_volume_db(bus_index, linear_to_db(value))
