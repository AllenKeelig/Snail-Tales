extends Area2D

func _ready():
	connect("body_entered", Callable(self, "_on_Fruit_body_entered"))

func _on_Fruit_body_entered(body):
	if body.name == "Player":
		var game_manager = get_node("/root/TileMap/GameManager")  # Adjust this path to match your scene structure
		if game_manager:
			game_manager.collect_fruit(self)
		else:
			print("Error: GameManager node not found")
		queue_free()  # Remove the fruit from the scene
