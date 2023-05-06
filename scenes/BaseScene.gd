class_name BaseScene
extends Node

signal on_should_change_scene(new_scene: Scenes)

enum Scenes {
	MENU,
	LEVEL_1,
}
