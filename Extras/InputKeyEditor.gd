@icon("./InputKeyEditor.png")
class_name InputKeyEditor
extends Button

## add actions name from " Project> ProjectSettings> InputMap> Actions "
@export var input_action:String
## add keys name from keyboard
@export var key_name:String


func _ready() -> void:
	focus_mode = 0
	toggle_mode = true
	button_pressed = false
	
	EF.remove_all_keys_from_Input_Action(input_action)
	key_name = EF.Load_Data(key_name,input_action+"_InputKeyEditor")
	EF.add_key_to_Input_Action(input_action,key_name)
	
	text = input_action+" : "+key_name
	
	toggled.connect(on_toggle)
	mouse_entered.connect(on_mouse_entered)
	mouse_exited.connect(on_mouse_exited)

func on_mouse_entered():
	EF.make_sound(EF.BtnMI)

func on_mouse_exited():
	EF.make_sound(EF.BtnMO)


func on_toggle(toggled_on:bool):
	EF.make_sound(EF.BtnP)
	if toggled_on : text = "Press Key"
	else : text = input_action+" : "+key_name


func _input(event: InputEvent) -> void:
	if button_pressed : if event is InputEventKey:
		EF.remove_all_keys_from_Input_Action(input_action)
		key_name=event.as_text_keycode()
		EF.add_key_to_Input_Action(input_action,key_name)
		EF.Save_Data(key_name,input_action+"_InputKeyEditor")
		button_pressed = false
