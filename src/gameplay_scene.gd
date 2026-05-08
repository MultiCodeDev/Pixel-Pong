extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Pause_Menu/Screen/Continue_Button.text = "Continue"
	$Pause_Menu/Screen/Exit_Button.text = "Exit"
	$Pause_Menu/Screen/Settings_Button.text = "Settings"
	$Pause_Menu.get_node("Screen").hide()
	$Player1/Sprite2D.texture = load("uid://4e4vu6rga6x8")
	$Player2/Sprite2D.texture = load("uid://d3beprqwwvnbf")
	$Player1.initial_x = 0
	$Player2.initial_x = 640 - $Player2.width
	$Player1.position = Vector2(0, 170)
	$Player2.position = Vector2($Player2.initial_x , 170)
	$Ball.position = Vector2(320, 170)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

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
