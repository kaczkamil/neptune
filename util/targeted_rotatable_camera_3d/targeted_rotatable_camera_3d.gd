extends Node3D
class_name TargetedRotatableCamera3D

@export var target: Node3D:
	set(v):
		target = v

@export var distance: float = 30.0:
	set(v):
		distance = max(v, 0)
		if camera != null:
			camera.position.z = v
@export var scroll_zoom: float = 2.0

@onready var camera: Camera3D = %Camera3D
@onready var camera_origin: Node3D = %CameraOrigin

func _ready() -> void:
	camera.position.z = distance

func _process(delta: float) -> void:
	if target != null:
		global_position = target.global_position
		global_rotation = target.global_rotation

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		if event.button_mask:
			camera_origin.rotation_degrees.y -= event.screen_relative.x
			camera_origin.rotation_degrees.x = clamp(camera_origin.rotation_degrees.x - event.screen_relative.y, -90, 90)
			
	elif event is InputEventMouseButton:
		if event.is_pressed():
			if event.button_index == MOUSE_BUTTON_WHEEL_UP:
				distance -= scroll_zoom
			elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
				distance += scroll_zoom
	
