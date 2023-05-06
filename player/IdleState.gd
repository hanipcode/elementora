class_name IdleState
extends BaseState


func _init():
	state_string_name = "Idle"


func enter():
	player.animations.play("idle")
	player.stop_moving()


func input(_event: InputEvent) -> BaseState.State:
	var axis = InputHelper.get_axis()
	if axis != 0 and player.is_on_floor():
		return State.RUN
	return State.NULL


func physics_process(_delta):
	if not player.is_on_floor():
		return State.FALL

	return State.NULL
