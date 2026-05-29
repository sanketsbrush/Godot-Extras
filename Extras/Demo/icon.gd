extends Sprite2D

func _process(delta: float) -> void:
	position.y+=Input.get_axis("ui_up","ui_down")
