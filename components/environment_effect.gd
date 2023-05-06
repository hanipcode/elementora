extends Node

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func process(player: Player, delta: float):
	if not player.is_on_floor():
		gravity_effect(player, delta)


func gravity_effect(player: Player, delta: float):
	player.velocity.y += gravity * delta
