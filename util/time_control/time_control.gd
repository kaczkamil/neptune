extends HBoxContainer

signal changed(playing: bool, time_scale: float)

@export var playing: bool = true
@export var time_scale: float = 1.0

@export var time_scale_max: float = 1.0:
	set(v):
		time_scale_max = v
		if slider != null:
			slider.max_value = v
@export var time_scale_step: float = 0.01:
	set(v):
		time_scale_step = v
		if slider != null:
			slider.step = v

@onready var slider: HSlider = %ScaleSlider
@onready var label: Label = %ScaleLabel

func _on_button_toggled(toggled_on: bool) -> void:
	playing = toggled_on
	changed.emit(playing, time_scale)
	_update_display()

func _on_scale_slider_value_changed(value: float) -> void:
	time_scale = value
	changed.emit(playing, time_scale)
	_update_display()

func _ready() -> void:
	_update_display()
	changed.emit(playing, time_scale)
	slider.max_value = time_scale_max
	slider.step = time_scale_step

func _update_display() -> void:
	label.text = "%.2fx" % time_scale
