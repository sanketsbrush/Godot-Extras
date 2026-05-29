@icon("./HSliderAutoSaver.png")
class_name HSliderAutoSaver
extends HSlider

func _ready() -> void:
	focus_mode = 0
	value=EF.Load_Data(value,name+"_HSliderAutoSaver")
	value_changed.connect(on_value_changed)
	mouse_entered.connect(on_mouse_entered)
	mouse_exited.connect(on_mouse_exited)

func on_mouse_entered():
	EF.make_sound(EF.BtnMI)

func on_mouse_exited():
	EF.make_sound(EF.BtnMO)

func on_value_changed(value:float):
	EF.Save_Data(value,name+"_HSliderAutoSaver")
	EF.make_sound(EF.BtnP)
