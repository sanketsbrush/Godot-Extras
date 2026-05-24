@icon("./VSliderAutoSaver.png")
class_name VSliderAutoSaver
extends VSlider

func _ready() -> void:
	focus_mode = 0
	value=EF.Load_Data(value,(name+"_VSliderAutoSaver"))
	value_changed.connect(on_value_changed)

func on_value_changed(value:float):
	EF.Save_Data(value,(name+"_VSliderAutoSaver"))
