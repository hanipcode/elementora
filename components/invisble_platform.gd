class_name InvisblePlatform
extends StaticBody2D

@onready var collision_shape: CollisionShape2D = $CollisionShape2D


func _ready():
	print("rede", collision_shape)
