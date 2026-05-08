extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const width = 13
const height = 38
var initial_x : float

func _physics_process(delta: float) -> void:
	
	var direction : int = 0
	if Input.is_action_pressed("move_down"):
		direction = 1
	elif Input.is_action_pressed("move_up"):
		direction = -1
	else:
		direction = 0
		
	position.y += direction * SPEED * delta
	
	var collision = move_and_collide(position, true)
	position.x = initial_x
	
	if collision:
		Global.reflect_ball.emit()
		
	#print(position)
