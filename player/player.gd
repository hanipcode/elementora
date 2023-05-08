class_name Player
extends CharacterBody2D

@export var speed = 30

# Get the gravity from the project settings to be synced with RigidBody nodes.
@onready var state_manager: CharacterStateManager = $CharacterStateManager
@onready var animations: AnimatedSprite2D = $AnimatedSprite2D
@onready var element_detection: ElementDetection = $ElementDetection
@onready var element_type: Element.Type = PlayerData.selected_element_type


func stop_moving() -> void:
	velocity = Vector2.ZERO


func move() -> void:
	velocity.x = InputHelper.get_axis() * speed


func _ready() -> void:
	print("player element is", Element.STRING_MAP[element_type])
	state_manager.init(self)
	element_detection.init(self)


func _unhandled_input(event: InputEvent):
	state_manager.input(event)


func _physics_process(delta):
	EnvironmentEffect.process(self, delta)
	state_manager.physics_process(delta)
	var label: Label = $DebugLabel
	label.text = state_manager.curent_state.state_string_name
	move_and_slide()
