@icon("./TextEditAutoSaver.png")
class_name TextEditAutoSaver
extends TextEdit

func _ready() -> void:
	focus_mode = 0
	text=EF.Load_Data(text,name+"_TextEditAutoSaver")
	text_changed.connect(on_text_changed)
	mouse_entered.connect(on_mouse_entered)
	mouse_exited.connect(on_mouse_exited)


func on_text_changed(new_text:String):
	S()

func on_mouse_entered():
	EF.make_sound(EF.BtnMI)
	focus_mode = 1
	grab_focus()
	S()

func on_mouse_exited():
	EF.make_sound(EF.BtnMO)
	focus_mode = 0
	S()

func _input(event: InputEvent) -> void:if has_focus():
	if Input.is_action_just_pressed("ui_text_completion_replace"):
			text+="\nAnswer :- "+str(EF.Execute_String(text))
			S()

func S():
	EF.Save_Data(text,name+"_TextEditAutoSaver")
