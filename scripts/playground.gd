extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(checkingTypeOfSomethingGIPPITY())
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func checkingTypeOfSomething() -> String:
	# Make sure you put "var" there or it'll compalin it's not in scope.
	var child_sprite = $Sprite2D
	var child_sprite_2 = $Sprite2D2
		
	#print(type(child_sprite))  # wrong
	var first = (typeof(child_sprite))  # returned 0 when unassigned a type.	print(typeof(child_sprite))  # returned 0 when unassigned a type.
	var second = (typeof(child_sprite_2))  # returned 0 when unassigned a type.
	
	# return String(first + second)  # ERR - nonexistent String Constructor
	# Was also stupid, you need to cast ints -> str before "add"/concatinating them.
	return String(first) + ", " + String(second)  # UGH, sitll a nonexistent str.
	
func checkingTypeOfSomethingGIPPITY() -> String:
	var child_sprite = $Sprite2D
	var child_sprite_2 = $Sprite2D2

	# Get type of each child sprite
	var first = typeof(child_sprite)  # This should return an integer
	var second = typeof(child_sprite_2)  # This should also return an integer

	# Convert to string and concatenate with a comma
	return String(first) + ", " + String(second)  # ARE YOU F-in kidding still no work.
