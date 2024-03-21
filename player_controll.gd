extends Node3D

@export var player_ship: VehicleBody3D
@export var camera_controll: Camera3D
@export var camera_anchor: Node3D
@export var camera_look:Node3D
@export var gravity_dir: Vector3
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var glob_camera_anchor = camera_anchor.global_position
	var local_camera_anchor = to_local(glob_camera_anchor)
	
	var glob_camera_look = camera_look.global_position
	var local_camera_look = to_local(glob_camera_look)
	
	camera_controll.position = lerp(camera_controll.position, local_camera_anchor, 0.1)
	camera_controll.look_at(local_camera_look, player_ship.basis.y)
	player_ship.gravity_dir = gravity_dir
	
func _input(event):
	player_ship.motor = (int)(Input.is_action_pressed("ui_up")) - \
						(int)(Input.is_action_pressed("ui_down"))
						
	player_ship.steer = (int)(Input.is_action_pressed("ui_left")) - \
						(int)(Input.is_action_pressed("ui_right"))
