@icon("./QuitGame.png")
class_name QuitGame
extends Button

func _ready():
	focus_mode = 0
	pressed.connect(btn_pressed)
	mouse_entered.connect(on_mouse_entered)
	mouse_exited.connect(on_mouse_exited)

func on_mouse_entered():
	EF.make_sound(EF.BtnMI)

func on_mouse_exited():
	EF.make_sound(EF.BtnMO)

func btn_pressed():
	EF.make_sound(EF.BtnP)
	get_tree().quit()
