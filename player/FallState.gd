class_name FallState
extends BaseState


func _init():
	state_string_name = "Fall"


func enter():
	player.animations.play("fall")


func physics_process(_delta: float) -> State:
	if player.is_on_floor():
		return State.LAND

	return State.NULL
