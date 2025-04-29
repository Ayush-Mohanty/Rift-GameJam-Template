extends Control
@onready var animation_player: AnimationPlayer = $fade/AnimationPlayer

func _ready():
	transition()
	
func transition():
	animation_player.play("fade_in")
