@icon("./QuitGame.png")
class_name QuitGame
extends Button

func _ready():
	focus_mode = 0
	pressed.connect(btn_pressed)

func btn_pressed():
	get_tree().quit()
