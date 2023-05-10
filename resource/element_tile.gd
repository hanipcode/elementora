class_name ElementTile
extends Resource

@export var type: Element.Type
@export var active: bool


static func create_element_tile(_type: Element.Type, _active: bool) -> ElementTile:
	var element_tile = ElementTile.new()
	element_tile.active = _active
	element_tile.type = _type

	return element_tile


func is_passable() -> bool:
	match type:
		_:
			return false


func get_element_handler() -> BaseElementTileHandler:
	var element_handler: BaseElementTileHandler
	print(type, Element.STRING_MAP[type])
	match type:
		Element.Type.FIRE:
			element_handler = FireElementTileHandler.new()
		_:
			element_handler = BaseElementTileHandler.new()

	return element_handler


func interact_with(player: Player, tile_map: TileMap, position: Vector2i):
	var element_handler = get_element_handler()
	element_handler.interact_with_player(player, tile_map, position, self)
