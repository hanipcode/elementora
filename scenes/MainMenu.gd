class_name MainMenu
extends BaseScene

enum Menu {
	START,
	QUIT,
}

var selected: Menu = Menu.START

@onready var start_menu: Label = $PanelContainer/MarginContainer/VBoxContainer/StartMenu
@onready var quit_menu: Label = $PanelContainer/MarginContainer/VBoxContainer/QuitMenu
@onready var menu_map = {Menu.START: start_menu, Menu.QUIT: quit_menu}
@onready var menu_order = [Menu.START, Menu.QUIT]

# # Called when the node enters the scene tree for the first time.
# func _ready():
# 	pass  # Replace with function body.


func _input(_event):
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
		Menu.START:
			print("start")
			on_should_change_scene.emit(BaseScene.Scenes.ELEMENT_SELECT)
		Menu.QUIT:
			print("quit")
			get_tree().quit()


func reset_labels():
	for menu in menu_order:
		menu_map[menu].label_settings.set("font_color", Color(1, 1, 1))


func _process(_delta):
	reset_labels()
	var selected_menu: Label = menu_map[selected]
	selected_menu.label_settings.set("font_color", Color(1, 0, 0))
