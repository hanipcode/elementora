class_name FireElementTileHandler
extends BaseElementTileHandler

var invisible_platform_component = preload("res://components/invisble_platform.tscn")


func handle_player_ice(_player, tile_map, position, _element_tile):
	tile_map.set_cell(0, position, 5, Vector2i(-1, -1))
	# var new_element_tile = ElementTile.create_element_tile(Element.Type.ICE, false)
	# var tile_data = tile_map.get_cell_tile_data(0, position, false)
	# tile_data.set_custom_data("ElementTile", new_element_tile)
	var invisible_platform: InvisblePlatform = invisible_platform_component.instantiate()
	tile_map.add_child(invisible_platform)
	invisible_platform.collision_shape.position = tile_map.to_global(
		tile_map.map_to_local(position)
	)
