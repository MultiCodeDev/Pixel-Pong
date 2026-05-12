extends Node2D

var ball_resource = preload("uid://bhvb8rupj81fk")
var ball: Ball

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Pause_Menu/Screen/Continue_Button.text = "Continue"
	$Pause_Menu/Screen/Exit_Button.text = "Exit"
	$Pause_Menu/Screen/Settings_Button.text = "Settings"
	$Pause_Menu.get_node("Screen").hide()
	$Player1/Sprite2D.texture = load("uid://4e4vu6rga6x8")
	$Player2/Sprite2D.texture = load("uid://d3beprqwwvnbf")
	$Player1.initial_x = 0
	$Player2.initial_x = Global.SCREEN_WIDTH - $Player2.width
	$Player1.position = Vector2(0, Global.SCREEN_HEIGHT / 2.0)
	$Player2.position = Vector2($Player2.initial_x , Global.SCREEN_HEIGHT / 2.0)
	$Player2/CollisionShape2D.position -= Vector2(0.2, 0)
	#ball = ball_resource.instantiate()
	#ball.connect("body_shape_enterd")
	#add_child(ball)
	ball = $Ball
	ball.position = Vector2(Global.SCREEN_WIDTH / 2.0, Global.SCREEN_HEIGHT / 2.0)
	#$Ball.position = Vector2(Global.SCREEN_WIDTH / 2.0, Global.SCREEN_HEIGHT / 2.0)
	$Right_Wall.position = Vector2(638, 0)
	$Left_Wall.position = Vector2.ZERO
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	#pass
	if Input.is_action_pressed("pause"):
		_on_pause_button_pressed()
	print(ball.linear_velocity)


func _on_pause_button_pressed() -> void:
	get_tree().paused = true
	get_node("Pause_Button").hide()
	$Pause_Menu/Screen.show()
	#$Pause_Menu.get_node("Screen").show()
	await get_tree().process_frame


func _on_continue_button_pressed() -> void:
	get_tree().paused = false
	get_node("Pause_Button").show()
	$Pause_Menu/Screen.hide()
	await get_tree().process_frame


func _on_ball_body_shape_entered(_body_rid: RID, body: Node, _body_shape_index: int, _local_shape_index: int) -> void:
	#print(body.name)
	if body.name == "Left_Wall" || body.name == "Right_Wall":
		#get_tree().reload_current_scene()
		print("Should Reset")
		reset(body)

func reset(body: Node) -> void:
	if body.name == "Left_Wall":
		$Player2_Score.text = str($Player2_Score.text.to_int() + 1)
	else:
		$Player1_Score.text = str($Player1_Score.text.to_int() + 1)
	ball.call_deferred("queue_free")
	ball = ball_resource.instantiate()
	ball.connect("body_shape_entered", _on_ball_body_shape_entered)
	ball.position = ball.start_position
	ball.linear_velocity = (Vector2(Global.rng.randf_range(200, 300), Global.rng.randf_range(200, 300)))
	call_deferred("add_child", ball)
	call_deferred("move_child", ball, 1)
	
	
	

	
