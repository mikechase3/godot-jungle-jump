extends Node2D

# Private variables for lazy initiation
# Is it really private though? In Py, you have to import a class for that.
var _items: TileMapLayer = null  # the items layer.
var _danger: TileMapLayer = null  # ref to TML_Danger tile map layer.
var _player: Node2D = null
var _spawn_point: Marker2D = null

func _ready() -> void:
	# Hide the items and danger levels.
	# Functions are defined below to store refs to the object
	# So we can call builtin's like hide() and reset() and more.
	get_items().hide()
	get_danger().hide()
	
	# Resets the player pos to the spawn point.
	get_player().reset(get_spawn_point().position)



# Getters for lazy initialization with error handling
#func get_items() -> TileMapLayer:
	#if _items == null:
		#_items = $TileMaps/TML_Items
		#if _items == null:
			#push_error("Node 'TML_Items' not found in LevelBase._get_items()")
	#return _items
	
func get_items() -> TileMapLayer:
	if _items == null:
		_items = $TileMaps/TML_Items
		if _items == null:
			push_error("Node 'TML_Items' not found in LevelBase._get_items()")
		elif not _items is TileMapLayer:  # type() returns some sorta ID.
			push_error("Node 'TML_Items' is not a TileMapLayer!")
			_items = null  # Reset to null to avoid using incorrect type
	return _items

func get_danger() -> TileMapLayer:
	if _danger == null:
		_danger = $TileMaps/TML_Danger
		if _danger == null:
			push_error("Node 'TML_Danger' not found in LevelBase._get_danger()")
	return _danger

func get_player() -> Node2D:
	if _player == null:
		_player = $Player
		if _player == null:
			push_error("Node 'Player' not found in LevelBase._get_player()")
	return _player

func get_spawn_point() -> Marker2D:
	if _spawn_point == null:
		_spawn_point = $SpawnPoint
		if _spawn_point == null:
			push_error("Node 'SpawnPoint' not found in LevelBase._get_spawn_point()")
	return _spawn_point
