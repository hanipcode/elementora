class_name CharacterStateManager
extends Node

var curent_state: BaseState

@onready var states = {
	BaseState.State.IDLE: $Idle,
	BaseState.State.RUN: $Run,
	BaseState.State.FALL: $Fall,
	BaseState.State.LAND: $Land,
}


func change_state(new_state: BaseState.State) -> void:
	if curent_state:
		curent_state.exit()
	curent_state = states[new_state]
	curent_state.enter()


func init(player: Player) -> void:
	for child in get_children():
		child.player = player

	change_state(BaseState.State.IDLE)


func physics_process(delta: float) -> void:
	var new_state = curent_state.physics_process(delta)
	if new_state != BaseState.State.NULL:
		change_state(new_state)


func input(event: InputEvent) -> void:
	var new_state = curent_state.input(event)
	if new_state != BaseState.State.NULL:
		change_state(new_state)
