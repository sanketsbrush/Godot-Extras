extends Node

##on mouse entered
const BtnMI:float=-35.0
##on mouse exited
const BtnMO:float=-60.0
##on button pressed
const BtnP:float=-10.0

# search "find_EF.save" in file manager to see saved files from this project
func _ready() -> void:
	EF.Save_Data(true,"find")

func make_sound(VolumeDB:float):if get_tree().current_scene.has_node("BtnSound"):
	var btn_sound=get_tree().current_scene.get_node("BtnSound")
	btn_sound.volume_db=VolumeDB
	btn_sound.play()

func Save_Data(data:Variant,file_name:String):
	var path :String= "user://"+file_name+"_EF.save"
	var file :Object= FileAccess.open(path, FileAccess.WRITE)
	file.store_var(data)
	file.close()

func Load_Data(data:Variant,file_name:String):
	var path :String= "user://"+file_name+"_EF.save"
	if FileAccess.file_exists(path):
		var file = FileAccess.open(path, FileAccess.READ)
		data = file.get_var()
		return data
	else:
		return data
		Save_Data(data,file_name)

func Execute_String(txt:String):
	var exp = Expression.new()
	exp.parse(txt)
	var result = exp.execute()
	return result

func Device_Type():
	if OS.has_feature("android"):return "android"
	elif OS.has_feature("ios"):return "ios"
	elif OS.has_feature("windows"):return "windows"
	elif OS.has_feature("linux"):return "linux"
	else:return OS.get_name()


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
