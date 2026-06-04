@icon("./ButtonChangeScene.png")
class_name ButtonChangeScene
extends Button

## Add scene path
@export var scene_path:String

func _ready() -> void:
	focus_mode = 0
	if !ResourceLoader.exists(scene_path):text = "level not found"
	toggle_mode = false
	tooltip_text = scene_path
	if get_tree().get_current_scene().scene_file_path==scene_path:
		text +="<"
	pressed.connect(btn_pressed)
	mouse_exited.connect(on_mouse_exited)
	mouse_entered.connect(on_mouse_entered)

func on_mouse_entered():
	EF.make_sound(EF.BtnMI)

func on_mouse_exited():
	EF.make_sound(EF.BtnMO)

func btn_pressed():
	EF.make_sound(EF.BtnP)
	if ResourceLoader.exists(scene_path):
		if get_tree().get_current_scene().scene_file_path==scene_path:
			get_tree().reload_current_scene()
		else :
			get_tree().change_scene_to_file(scene_path)
	else:
		text = "level not found"
