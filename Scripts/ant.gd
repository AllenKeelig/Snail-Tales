extends CharacterBody2D

var speed = 50
var player_chase = false
var player = null
var direction = Vector2(0, 0)
var home = Vector2(101, 420)
var health = 10
var hitbox = false
var alive = true

func _ready():
	$"antanimations2".play("default")

func _process(_delta):
	var anim = $antanimations2
	
	if player_chase:
		direction = player.position - position
 
		if direction.x < 0:
			anim.flip_h = false
		else:
			anim.flip_h = true
	else :
		direction = home - position
		anim.flip_h = false

func _physics_process(delta):
	attacked()
	if health <= 0:
		alive = false
		Global.Ant_status = false
		self.queue_free()
	if player_chase:
		velocity = direction.normalized() * 40
		move_and_collide(velocity * delta)
	else :
		velocity = direction.normalized() * 40
		move_and_collide(velocity * delta)

func _on_detection_area_body_entered(body):
	player = body
	player_chase = true

func _on_detection_area_body_exited(body):
	player = null
	player_chase = false

func enemy():
	pass


func _on_enemy_hitbox_body_entered(body):
	if body.has_method("attack"):
		hitbox = true

func _on_enemy_hitbox_body_exited(body):
	if body.has_method("attack"):
		hitbox = false

func attacked():
	if hitbox:
		health = health - 1

