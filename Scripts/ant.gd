extends CharacterBody2D

var speed = 75
var player_chase = false
var player = null
var direction : Vector2

func _ready():
	$"antanimations2".play("default")

func _process(_delta):
	if player_chase:
		var anim = $antanimations2
		direction = player.position - position
 
		if direction.x < 0:
			anim.flip_h = false
		else:
			anim.flip_h = true

func _physics_process(delta):
	if player_chase:
		velocity = direction.normalized() * 40
		move_and_collide(velocity * delta)

func _on_detection_area_body_entered(body):
	player = body
	player_chase = true

func _on_detection_area_body_exited(body):
	player = null
	player_chase = false
