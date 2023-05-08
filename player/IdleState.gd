class_name IdleState
extends BaseState


func _init():
	state_string_name = "Idle"


func enter():
	player.animations.play("idle")
	player.stop_moving()


func physics_process(_delta):
	var axis = InputHelper.get_axis()
	if axis != 0 and player.is_on_floor():
		return State.RUN
	if not player.is_on_floor():
		return State.FALL

	return State.NULL
