extends Node3D

@onready var time_manager: TimeManager = %TimeManager

func _on_time_control_changed(playing: bool, time_scale: float) -> void:
	if time_manager != null:
		time_manager.playing = playing
		time_manager.time_scale = time_scale
