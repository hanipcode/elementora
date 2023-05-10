class_name SelectElementScene
extends BaseScene

var selected = 0

@onready var ice_menu: Label = $PanelContainer/MarginContainer/VBoxContainer/IceElement
@onready var fire_menu: Label = $PanelContainer/MarginContainer/VBoxContainer/FireElement
@onready var wind_menu: Label = $PanelContainer/MarginContainer/VBoxContainer/WindElement
@onready var menu_map = {
	Element.Type.ICE: ice_menu,
	Element.Type.FIRE: fire_menu,
	Element.Type.WIND: wind_menu,
}
@onready var menu_order = [Element.Type.ICE, Element.Type.FIRE, Element.Type.WIND]

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
	selected = new_index


func next():
	var new_index = selected + 1 if selected != menu_map.size() - 1 else 0
	selected = new_index


func select():
	PlayerData.selected_element_type = menu_order[selected]
	on_should_change_scene.emit(BaseScene.Scenes.LEVEL_1)


func reset_labels():
	for menu in menu_order:
		menu_map[menu].label_settings.set("font_color", Color(1, 1, 1))


func _process(_delta):
	reset_labels()
	var selected_menu: Label = menu_map[menu_order[selected]]
	selected_menu.label_settings.set("font_color", Color(1, 0, 0))
