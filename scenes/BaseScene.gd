class_name BaseScene
extends Node

signal on_should_change_scene(new_scene: Scenes)

enum Scenes { MENU, ELEMENT_SELECT, LEVEL_1, GAME_OVER }

const MAP = {
	BaseScene.Scenes.MENU: "res://scenes//main_menu.tscn",
	BaseScene.Scenes.LEVEL_1: "res://scenes/first_level.tscn",
	BaseScene.Scenes.ELEMENT_SELECT: "res://scenes/select_element.tscn",
	BaseScene.Scenes.GAME_OVER: "res://scenes/game_over.tscn"
}

@export var scene_type: Scenes
