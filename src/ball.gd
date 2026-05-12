extends RigidBody2D
class_name Ball

var last_velocity: Vector2
@onready var timer = $Timer
@onready var reset_timer = $Reset_Timer
var start_position: Vector2 = Vector2(Global.SCREEN_WIDTH/2.0, Global.SCREEN_HEIGHT/2.0)
var position_flag: bool = true
var player_can_collide: bool = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	linear_velocity = Vector2(Global.rng.randf_range(200, 300), Global.rng.randf_range(200, 300))
	
	#last_velocity = linear_velocity


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	
func _physics_process(_delta: float) -> void:
	var x_vel: float = linear_velocity.x
	var y_vel: float = linear_velocity.y
	# Keep horizontal velocity relatively fast
	x_vel = -150.0 if x_vel < 0 and x_vel > -150 else 150.0 if x_vel > 0 and x_vel < 150 else x_vel
	# Clamp velocity to be in the range [-450, -150] and [150, 450]
	linear_velocity = Vector2(clampf(x_vel, -450, 450),
							clampf(y_vel, -450, 450))
		

func reflect(body) -> void:
	#linear_velocity.x *= -1
	if player_can_collide == true:
		player_can_collide = false
		timer.start()
		if $Sprite2D.flip_h != true:
			$Sprite2D.flip_h = true
		else:
			$Sprite2D.flip_h = false
		print("reflect")
		print(body.name)
		
