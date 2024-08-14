extends Area2D

var speed = 300
var direction = ""
var attack_cooldown = preload("res://Scenes/Player.tscn")

func _ready():

	set_as_top_level(true)


func _process(delta):
	var sprite = $Sprite2D
	if direction == "RIGHT":
		sprite.set_rotation_degrees(0)
		position += (Vector2.RIGHT*speed) *delta
	elif direction == "LEFT":
		sprite.set_rotation_degrees(180)
		position += (Vector2.LEFT*speed) *delta
	elif direction == "UP":
		position += (Vector2.UP*speed) *delta
		sprite.set_rotation_degrees(270)
	else :
		position += (Vector2.DOWN*speed) *delta
		sprite.set_rotation_degrees(90)

func _on_lifespan_timeout():
	self.queue_free()

func slime_attack():
	pass



func _on_body_entered(body):
	if body.has_method("enemy"):
		self.queue_free()
