@icon("./TextEditAutoSaver.png")
class_name TextEditAutoSaver
extends TextEdit

func _ready() -> void:
	focus_mode = 0
	text=EF.Load_Data(text,name+"_TextEditAutoSaver")
	text_changed.connect(on_text_changed)
	mouse_entered.connect(on_mouse_entered)
	mouse_exited.connect(on_mouse_exited)

func on_text_changed():
	EF.Save_Data(text,name+"_TextEditAutoSaver")

func on_mouse_entered():
	focus_mode = 1
	grab_focus()
func on_mouse_exited():
	focus_mode = 0
