extends ColorRect

func _on_close_button_pressed() -> void:
	hide()

func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if !event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			hide()
