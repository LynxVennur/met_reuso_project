extends VehicleBody3D

@export var motor: float
@export var steer: float
@export var gravity_dir: Vector3
@export var gravity_power: float

@export var ray_left: RayCast3D
@export var ray_right: RayCast3D
@export var ray_front: RayCast3D
@export var raycast: Vector3

var engine_power := 100.0
var max_steering := .8
var steering_power := 0.05

var input_power: int
var input_steer: int

var speed: float

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	speed = linear_velocity.length()
	engine_force = lerp(engine_force, engine_power*motor, 0.1)
	if speed > 1:
		steering = lerp(steering, max_steering*steer/(speed*0.8), steering_power)
	else:
		steering = 0
	apply_central_force(-gravity_dir * gravity_power)
	
	var front = ray_front.get_collision_point()
	front = ray_front.to_local(front).length()
	
	var left = ray_left.get_collision_point()
	left = ray_front.to_local(left).length()
	
	var right = ray_right.get_collision_point()
	right = ray_front.to_local(right).length()
	
	raycast = Vector3(left, front, right)

