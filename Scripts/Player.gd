extends CharacterBody2D

const speed = 50
var current_dir = "RIGHT"
var health = 5
var enemy_range = false
var i_frame = true
var alive = true
var attack_cooldown = true
var slime = preload("res://Scenes/slime.tscn")

func _ready():
	$AnimatedSprite2D2.play("idle")

func _physics_process(delta):
	
	player_movement(delta)
	enemy_attacks()
	if health <= 0:
		alive = false #add end screen

func player_movement(_delta):
	
	if Input.is_action_pressed("ui_right"):
		current_dir = "RIGHT"
		play_anim(1)
		velocity.x = speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_left"):
		current_dir = "LEFT"
		play_anim(1)
		velocity.x = -speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_down"):
		current_dir = "DOWN"
		play_anim(1)
		velocity.x = 0
		velocity.y = speed
	elif Input.is_action_pressed("ui_up"):
		current_dir = "UP"
		play_anim(1)
		velocity.x = 0
		velocity.y = -speed
	else:
		play_anim(0)
		velocity.x = 0
		velocity.y = 0
	move_and_slide()
	if Input.is_action_just_pressed("Attack"):
		attack()

func play_anim(movement):
	var dir = current_dir
	var anim = $AnimatedSprite2D2
	
	if movement == 0:
		anim.flip_h = false
		anim.play("idle")
	elif dir == "RIGHT":
		anim.flip_h = false
		anim.play("side")
	elif dir == "LEFT":
		anim.flip_h = true
		anim.play("side")
	elif dir == "UP":
		anim.flip_h = false
		anim.play("up")
	elif dir == "DOWN":
		anim.flip_h = false
		anim.play("down")


func _on_player_hitbox_body_entered(body):
	if body.has_method("enemy"):
		enemy_range = true

func _on_player_hitbox_body_exited(body):
	if body.has_method("enemy"):
		enemy_range = false

func enemy_attacks():
	if enemy_range and i_frame:
		health = health - 1
		i_frame = false
		$"I-frame".start()

func attack():
	if attack_cooldown == true:
		attack_cooldown = false
		var slime_instance = slime.instantiate()
		slime_instance.direction = current_dir
		slime_instance.global_position = $Marker2D.global_position
		add_child(slime_instance)
		$"Attack_cooldown".start()

func _on_iframe_timeout():
	i_frame = true


func _on_attack_cooldown_timeout():
	attack_cooldown = true
