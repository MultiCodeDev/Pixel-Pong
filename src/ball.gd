extends RigidBody2D
class_name Ball

var start_position: Vector2 = Vector2(Global.SCREEN_WIDTH/2.0, Global.SCREEN_HEIGHT/2.0)
const negative_minimum_velocity: float = -200
const positive_minimum_velocity: float = 200

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	linear_velocity = getRandomVelocity()
	#linear_velocity = Vector2(Global.rng.randf_range(200, 300), Global.rng.randf_range(200, 300))
	
func getRandomVelocity() -> Vector2:
	var isNegative: bool = Global.rng.randi_range(0, 1) == 1
	if isNegative:
		return Vector2(Global.rng.randf_range(negative_minimum_velocity, -300),
							Global.rng.randf_range(negative_minimum_velocity, -300))
	else:
		return Vector2(Global.rng.randf_range(positive_minimum_velocity, 300),
							Global.rng.randf_range(positive_minimum_velocity, 300))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	
func _physics_process(_delta: float) -> void:
	var x_vel: float = linear_velocity.x
	var y_vel: float = linear_velocity.y
	# Keep horizontal velocity relatively fast
	x_vel = negative_minimum_velocity if x_vel < 0 and x_vel > negative_minimum_velocity \
		else positive_minimum_velocity if x_vel > 0 and x_vel < positive_minimum_velocity else x_vel
	# Clamp velocity to be in the range [-450, -150] and [150, 450]
	linear_velocity = Vector2(clampf(x_vel, -450, 450),
							clampf(y_vel, -450, 450))
		
