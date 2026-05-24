@icon("./ButtonChangeScene.png")
class_name ButtonChangeScene
extends Button

## Add scene path
@export var scene_path:String

func _ready() -> void:
	focus_mode = 0
	toggle_mode = true
	button_pressed = false
	tooltip_text = scene_path
	if get_tree().get_current_scene().scene_file_path==scene_path:
		text +="<"
	pressed.connect(btn_pressed)

func btn_pressed():
	if ResourceLoader.exists(scene_path):
		if get_tree().get_current_scene().scene_file_path==scene_path:
			get_tree().reload_current_scene()
		else : 
			get_tree().change_scene_to_file(scene_path)
	else:
		text = "level not found"
