extends Node2D

signal score_changed


# Private variables for lazy initiation
# Is it really private though? In Py, you have to import a class for that.
var _items: TileMapLayer = null  # the items layer.
var _world: TileMapLayer = null
var _player: Node2D = null
var _spawn_point: Marker2D = null
var _danger: TileMapLayer = null  # ref to TML_Danger tile map layer.
var _camera_2d: Camera2D = null

var item_scene: PackedScene = load("res://scenes/Item.tscn")

var score: int: set = set_score

func _ready() -> void:
	# Hide the items and danger levels.
	# Functions are defined below to store refs to the object
	# So we can call builtin's like hide() and reset() and more.
	# get_items().hide()
	get_items().hide()
	get_danger().hide()
	get_world()
	get_player().reset(get_spawn_point().position)  # Set player pos to overriden.
	set_camera_limits()  # Set cam boundaries.
	spawn_items()
	
	# Resets the player pos to the spawn point.
	get_player().reset(get_spawn_point().position)



# Getters for lazy initialization with error handling
#func get_items() -> TileMapLayer:
	#if _items == null:
		#_items = $TileMaps/TML_Items
		#if _items == null:
			#push_error("Node 'TML_Items' not found in LevelBase._get_items()")
	#return _items

func get_camera_2d() -> Camera2D:
	# Retrieves the Camera2D node; initializes and caches it on first access
	if _camera_2d == null:
		var player = get_player()
		if player.has_node("Camera2D"):
			_camera_2d = player.get_node("Camera2D") as Camera2D  # as=type cast?
		else:
			push_error("Node 'Camera2D' not found as a child of 'Player'!")
	return _camera_2d  
	
#func get_camera_2d() -> Camera2D:  # MY IMPLEMENTATION DIFFERS FROM NOTES
	#if _camera_2d == null:
		#_camera_2d = $Player/Camera2D
		#if _camera_2d == null:
			#push_error("Node '_camera_2d' not found in LevelBase._get_camera_2d()")
	#return _camera_2d

func get_danger() -> TileMapLayer:
	if _danger == null:
		_danger = $TileMaps/TML_Danger
		if _danger == null:
			push_error("Node 'TML_Danger' not found in LevelBase._get_danger()")
	return _danger
	

func get_items() -> TileMapLayer:
	if _items == null:
		_items = $TileMaps/TML_Items
		if _items == null:
			push_error("Node 'TML_Items' not found in LevelBase._get_items()")
		elif not _items is TileMapLayer:  # type() returns some sorta ID.
			push_error("Node 'TML_Items' is not a TileMapLayer!")
			_items = null  # Reset to null to avoid using incorrect type
	return _items



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
	
func get_world() -> TileMapLayer:
	if _world == null:
		if $TileMaps/TML_World:
			_world = $TileMaps/TML_World
		else:
			push_error("Node 'TML_World' not found!")
	return _world

func _on_item_picked_up() -> void:
	print("Item._on_item_picked_up() successful")
	score += 1
	#$PickupSound.play()

# Function to set camera limits
func set_camera_limits() -> void:
	# Sets the camera limits based on the world tilemap's size and tile size
	var map_size: Rect2 = get_world().get_used_rect()
	var cell_size: Vector2 = get_world().tile_set.tile_size

	# Set camera limits based on the tilemap dimensions
	get_camera_2d().limit_left = int((map_size.position.x - 5) * cell_size.x)
	get_camera_2d().limit_right = int((map_size.end.x + 5) * cell_size.x)

func set_score(value: int) -> void:
	score = value
	score_changed.emit(score)

# Spawns items based on the TileMapLayer's used cells
func spawn_items() -> void:
	# Use the lazy-initialized getter for Items
	var item_cells: Array[Vector2i] = get_items().get_used_cells()
	
	for cell in item_cells:
		var data: TileData = get_items().get_cell_tile_data(cell)
		var type: String = data.get_custom_data("type")  # Assuming "type" is stored as String
		var item: Node = item_scene.instantiate()
		add_child(item)
		item.init(type, get_items().map_to_local(cell))
		item.picked_up.connect(self._on_item_picked_up)
		# print("Connected!") # success
