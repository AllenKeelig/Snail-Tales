extends Node

var total_fruits = 1  # Adjust this to reflect the actual number of fruits in your scene
var collected_fruits = 0
var quest_flag = false

func _ready():
	print("GameManager ready")
	# Clear the Label text initially
	var label = get_node("/root/TileMap/Label")
	if label:
		label.text = ""
	else:
		print("Error: Label node not found")

func collect_fruit(_fruit):
	collected_fruits += 1
	print("Collected Fruits: ", collected_fruits)
	if collected_fruits >= total_fruits:
		quest_flag = true
		print("All fruits collected! Proceed to the next task.")
		var label = get_node("/root/TileMap/Label")
		if label:
			label.text = "All fruits collected! Proceed to the next task."
		else:
			print("Error: Label node not found")
		# Start the timer
		var timer = get_node("/root/TileMap/MessageTimer")
		if timer:
			print("Starting timer")
			timer.start()
		else:
			print("Error: MessageTimer node not found")

# Called when the timer runs out
func _on_MessageTimer_timeout():
	print("Timer timeout reached")
	var label = get_node("/root/TileMap/Label")
	if label:
		label.text = ""
	else:
		print("Error: Label node not found")
