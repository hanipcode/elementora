class_name BaseState
extends Node

enum State { NULL, IDLE, RUN, FALL, LAND }
var player: Player
var state_string_name = "Base"


func enter() -> void:
	pass


func exit() -> void:
	pass


func input(_event: InputEvent) -> State:
	return State.NULL


func process(_delta: float) -> State:
	return State.NULL


func physics_process(_delta: float) -> State:
	return State.NULL
