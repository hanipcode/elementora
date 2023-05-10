class_name ElementDetection
extends Area2D

var player: Player
@onready var collision: CollisionShape2D = $CollisionShape2D


func init(_player: Player):
	player = _player
	body_shape_entered.connect(_on_body_shape_entered)


func _on_body_shape_entered(body_rid: RID, body: Node2D, _body_index: int, _area_index: int):
	if body is TileMap:
		var pos: Vector2i = body.get_coords_for_body_rid(body_rid)
		var tile_data = body.get_cell_tile_data(0, pos, false)
		var element_tile: ElementTile = tile_data.get_custom_data("ElementTile")
		if element_tile:
			element_tile.interact_with(player, body, pos)
