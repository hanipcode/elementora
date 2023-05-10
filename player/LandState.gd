class_name LandState
extends BaseState


func _init():
	state_string_name = "Land"


func enter():
	player.animations.play("land")


func physics_process(_delta: float) -> State:
	return State.IDLE
