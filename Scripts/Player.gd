extends CharacterBody2D

const speed = 50
var current_dir = "none"

func _physics_process(delta):
	player_movement(delta)

func player_movement(delta):
	
	if Input.is_action_pressed("ui_right"):
		current_dir = "right"
		play_anim(1)
		velocity.x = speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_left"):
		current_dir = "left"
		play_anim(1)
		velocity.x = -speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_down"):
		current_dir = "down"
		play_anim(1)
		velocity.x = 0
		velocity.y = speed
	elif Input.is_action_pressed("ui_up"):
		current_dir = "up"
		play_anim(1)
		velocity.x = 0
		velocity.y = -speed
	else:
		play_anim(0)
		velocity.x = 0
		velocity.y = 0
	
	move_and_slide()

func play_anim(movement):
	var dir = current_dir
	var anim = $AnimatedSprite2D2
	
	if movement == 0:
		anim.flip_h = false
		anim.play("idle")
	elif dir == "right":
		anim.flip_h = false
		anim.play("side")
	elif dir == "left":
		anim.flip_h = true
		anim.play("side")
	elif dir == "up":
		anim.flip_h = false
		anim.play("up")
	elif dir == "down":
		anim.flip_h = false
		anim.play("down")
