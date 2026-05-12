extends Node2D

var gameplay_scene = preload("uid://yqpaetmc8mms").instantiate()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$CanvasLayer/Exit_Button.text = "Exit"
	$CanvasLayer/Settings_Button.text = "Settings"
	$CanvasLayer/Start_Button.text = "Start"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_start_button_pressed() -> void:
	get_tree().root.add_child(gameplay_scene)
	get_tree().root.get_node("Main").queue_free()
	await get_tree().process_frame
