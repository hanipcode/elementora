extends Node

enum InputKeys { UP, DOWN, LEFT, RIGHT, INTERACT, ESCAPE }
enum InputContext { PLAYER, CONTEXT_MENU, PAUSE }
const INPUT_STRING = {
	InputKeys.UP: "up",
	InputKeys.DOWN: "down",
	InputKeys.LEFT: "left",
	InputKeys.RIGHT: "right",
	InputKeys.INTERACT: "interact"
}

var input_context: InputContext = InputContext.PLAYER


func get_axis() -> float:
	if input_context != InputContext.PLAYER:
		return 0
	return Input.get_axis(INPUT_STRING[InputKeys.LEFT], INPUT_STRING[InputKeys.RIGHT])


func set_context(new_context: InputContext):
	input_context = new_context
