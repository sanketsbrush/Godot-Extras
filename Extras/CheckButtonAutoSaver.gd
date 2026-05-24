@icon("./CheckButtonAutoSaver.png")
class_name CheckButtonAutoSaver
extends CheckButton

func _ready() -> void:
	focus_mode = 0
	button_pressed = false
	button_pressed=EF.Load_Data(button_pressed,name+"_CheckButtonAutoSaver")
	toggled.connect(on_toggled)

func on_toggled(toggled_on:bool):
	EF.Save_Data(toggled_on,name+"_CheckButtonAutoSaver")
