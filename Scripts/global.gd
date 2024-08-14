extends Node2D

var Attacking = false
var Ant_status = true
func _process(delta):
	if Ant_status == false:
		print("ant dead")
