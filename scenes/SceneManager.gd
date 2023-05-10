class_name SceneManager
extends Node

var curent_scene: BaseScene

@onready var main_menu = $MainMenu


func _ready():
	init_scene()
	GameEffect.game_over_signal.connect(_on_game_over)


func init_scene(new_scene: BaseScene = null):
	if not new_scene:
		curent_scene = main_menu
	else:
		curent_scene = new_scene
	curent_scene.on_should_change_scene.connect(_on_should_change_scene)


func change_scene(scene_type: BaseScene.Scenes):
	var new_scene = load(BaseScene.MAP[scene_type]).instantiate()
	add_child(new_scene)
	curent_scene.queue_free()
	init_scene(new_scene)


func _on_should_change_scene(scene_type: BaseScene.Scenes):
	change_scene(scene_type)


func _on_game_over():
	var last_level_scene = self.curent_scene.scene_type
	change_scene(BaseScene.Scenes.GAME_OVER)
	(curent_scene as GameOverScene).last_level = last_level_scene
