class_name BaseElementTileHandler
extends Object


func interact_with_player(
	player: Player,
	tile_map: TileMap,
	pos: Vector2i,
	element_tile: ElementTile,
):
	if not element_tile.active:
		return
	match PlayerData.selected_element_type:
		Element.Type.FIRE:
			handle_player_fire(player, tile_map, pos, element_tile)
		Element.Type.ICE:
			call_deferred("handle_player_ice", player, tile_map, pos, element_tile)

	print("element tile_map ", Element.STRING_MAP[element_tile.type], " is not implemented")


func handle_player_fire(
	_player: Player,
	_tile_map: TileMap,
	_pos: Vector2i,
	_element_tile: ElementTile,
):
	print("player fire not implemented")


func handle_player_ice(
	_player: Player,
	_tile_map: TileMap,
	_pos: Vector2i,
	_element_tile: ElementTile,
):
	print("player ice not implemented")


func handle_player_wind(
	_player: Player,
	_tile_map: TileMap,
	_pos: Vector2i,
	_element_tile: ElementTile,
):
	print("player wind not implemented")
