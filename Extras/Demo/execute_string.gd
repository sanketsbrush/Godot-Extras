extends Button
@onready var text_edit_auto_saver: TextEditAutoSaver = $"../TextEditAutoSaver"

func _ready() -> void:
	pressed.connect(on_pressed)

func on_pressed():
	var result = EF.Execute_String(text_edit_auto_saver.text)
	text_edit_auto_saver.text+= "\n\nAns: "+str(result)
