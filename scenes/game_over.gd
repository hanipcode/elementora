class_name GameOverScene
extends BaseScene

enum Menu {
	CONTINUE_MENU,
	BACK_TO_MENU,
}

var selected: Menu = Menu.CONTINUE_MENU
var last_level: BaseScene.Scenes
@onready var continue_menu: Label = $PanelContainer/MarginContainer/VBoxContainer/ContinueMenu
@onready var back_to_menu: Label = $PanelContainer/MarginContainer/VBoxContainer/BackToMenu
@onready var menu_map = {Menu.CONTINUE_MENU: continue_menu, Menu.BACK_TO_MENU: back_to_menu}
@onready var menu_order = [Menu.CONTINUE_MENU, Menu.BACK_TO_MENU]

# # Called when the node enters the scene tree for the first time.
# func _ready():
# 	pass  # Replace with function body.


func _input(_event):
	print(last_level)
	if Input.is_action_just_pressed("up"):
		prev()
	if Input.is_action_just_pressed("down"):
		next()
	if Input.is_action_just_pressed("space"):
		select()


func prev():
	var new_index = selected - 1 if selected != 0 else menu_map.size() - 1
	selected = menu_order[new_index]


func next():
	var new_index = selected + 1 if selected != menu_map.size() - 1 else 0
	selected = menu_order[new_index]


func select():
	match selected:
		Menu.CONTINUE_MENU:
			on_should_change_scene.emit(last_level)
		Menu.BACK_TO_MENU:
			on_should_change_scene.emit(BaseScene.Scenes.MENU)


func reset_labels():
	for menu in menu_order:
		menu_map[menu].label_settings.set("font_color", Color(1, 1, 1))


func _process(_delta):
	reset_labels()
	var selected_menu: Label = menu_map[selected]
	selected_menu.label_settings.set("font_color", Color(1, 0, 0))
