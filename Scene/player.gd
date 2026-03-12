extends CharacterBody2D

@export var move_speed : float = 100
@export var acceleration : float = 50
@export var braking : float = 20
@export var gravity : float = 500
@export var jump_force : float = 200

var 	move_input : float 

@onready var sprite : Sprite2D = $Sprite
@onready var anim : AnimationPlayer = $AnimationPlayer

func _physics_process(_delta):
	if not is_on_floor():
		velocity.y += gravity * _delta 
	
	move_input = Input.get_axis("move_left", "move_right")
	
	
	
	
	if move_input != 0:
		velocity.x = lerp(velocity.x, move_input * move_speed, acceleration * _delta)
	else:
		velocity.x = lerp(velocity.x, 0.0, braking * _delta)
	
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -jump_force
	
	move_and_slide()
	
func _process(_delta):
	if velocity.x != 0:
		sprite.flip_h = velocity.x > 0
	
func _manage_animation():
	if not is_on_floor():
		anim.play("idle")
