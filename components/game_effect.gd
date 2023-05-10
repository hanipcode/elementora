extends Node

signal game_over_signal


func game_over():
	game_over_signal.emit()
