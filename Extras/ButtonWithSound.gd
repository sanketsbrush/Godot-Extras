@icon("./btn.png")
class_name ButtonWithSound
extends Button

func _ready() -> void:
	mouse_entered.connect(on_mouse_entered)
	mouse_exited.connect(on_mouse_exited)
	pressed.connect(on_pressed)

func on_mouse_entered():EF.make_sound(EF.BtnMI)
func on_mouse_exited():EF.make_sound(EF.BtnMO)
func on_pressed():EF.make_sound(EF.BtnP)
