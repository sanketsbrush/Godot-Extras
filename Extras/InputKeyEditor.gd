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
	
	remove_all_keys_from_Input_Action(input_action)
	key_name = EF.Load_Data(key_name,input_action+"_InputKeyEditor")
	add_key_to_Input_Action(input_action,key_name)
	
	#text = key_name
	text = input_action+" : "+key_name
	#tooltip_text=input_action
	
	toggled.connect(on_toggle)


func on_toggle(toggled_on:bool):
	if toggled_on : text = "Press Key"
	#else : text = key_name
	else : text = input_action+" : "+key_name


func _input(event: InputEvent) -> void:
	if button_pressed : if event is InputEventKey:
		remove_all_keys_from_Input_Action(input_action)
		key_name=event.as_text_keycode()
		add_key_to_Input_Action(input_action,key_name)
		EF.Save_Data(key_name,input_action+"_InputKeyEditor")
		button_pressed = false


func add_key_to_Input_Action(Input_Action:String,Key_Name:String):
	var key = InputEventKey.new()
	key.physical_keycode = OS.find_keycode_from_string(Key_Name)
	InputMap.action_add_event(Input_Action, key)

func remove_a_key_from_Input_Action(Input_Action:String,Key_Name:String):
	var key = InputEventKey.new()
	key.physical_keycode = OS.find_keycode_from_string(Key_Name)
	InputMap.action_erase_event(Input_Action,key)

func remove_all_keys_from_Input_Action(Input_Action:String):
	InputMap.action_erase_events(Input_Action)
