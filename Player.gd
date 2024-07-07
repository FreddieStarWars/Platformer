extends CharacterBody2D

@export var max_speed : float
@export var acceleration : float
@export var deceleration : float
@export var jump_time : int
@export var jump_speed : float

var dir : bool
var move : bool
var movesteps : int
var jump_timer : int 

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += 10

	if Input.is_action_pressed("move_right") and velocity.x < max_speed:
		velocity.x += acceleration
	elif Input.is_action_pressed("move_left") and velocity.x > -max_speed:
		velocity.x -= acceleration
	else:
		if abs(velocity.x) < deceleration:
			velocity.x = 0
		else:
			velocity.x -= sign(velocity.x) * deceleration
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			velocity.y = -jump_speed
			jump_timer = jump_time
	elif jump_timer > 0:
		velocity.y = -jump_speed
		jump_timer -= 1
	if Input.is_action_just_released("jump"):
		jump_timer = 0
	print(velocity)
	print(jump_timer)
	print(is_on_floor())
	
	
	move_and_slide()
