@icon("./OptionButtonAutoSaver.png")
class_name OptionButtonAutoSaver
extends OptionButton

func _ready() -> void:
	if selected==-1:selected=0
	selected=EF.Load_Data(selected,name+"_OptionButtonAutoSaver")
	item_selected.connect(on_item_selected)
	mouse_entered.connect(on_mouse_entered)
	mouse_exited.connect(on_mouse_exited)

func on_mouse_entered():
	EF.make_sound(EF.BtnMI)

func on_mouse_exited():
	EF.make_sound(EF.BtnMO)

func on_item_selected(index:int):
	EF.make_sound(EF.BtnP)
	EF.Save_Data(selected,name+"_OptionButtonAutoSaver")
