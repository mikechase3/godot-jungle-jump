extends Area2D
enum ItemType {CHERRY, GEM}
@export var item_type: ItemType = ItemType.CHERRY

signal picked_up  # emitted when player collects the item. Other parts can react to item.

var textures: Dictionary = {
	"cherry": "res://assets/sprites/cherry.png",
	"gem": "res://assets/sprites/gem.png"
}


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	match item_type:
		ItemType.CHERRY:
			$Sprite2D.texture = load(textures["cherry"]) as Texture
		ItemType.GEM:
			$Sprite2D.texture = load(textures["gem"]) as Texture


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	picked_up.emit()  # Tells other parts that item has been collected.
	queue_free()  # Removes this item from the scene.
