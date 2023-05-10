class_name BaseLevelScene
extends BaseScene

@onready var player: Player = $Player
@onready var level_tile_map: TileMap = $Level


func _ready():
	if not player:
		push_warning("Player is not detected in this scene", self)
	if not level_tile_map:
		push_warning("Level Tile Map is not detected in this scene", self)

	player.set_camera_limit(level_tile_map)
