class_name SceneManager
extends Node

var curent_scene: BaseScene

@onready var main_menu = $MainMenu


func _ready():
	init_scene()


func init_scene(new_scene: BaseScene = null):
	if not new_scene:
		curent_scene = main_menu
	else:
		curent_scene = new_scene
	print(curent_scene)
	curent_scene.on_should_change_scene.connect(_on_should_change_scene)


func change_scene(scene_type: BaseScene.Scenes):
	var new_scene = load(BaseScene.MAP[scene_type]).instantiate()
	add_child(new_scene)
	curent_scene.queue_free()
	init_scene(new_scene)


func _on_should_change_scene(scene_type: BaseScene.Scenes):
	change_scene(scene_type)
