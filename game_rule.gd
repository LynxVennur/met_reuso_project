extends Node3D

@export var track: Path3D
@export var ship: Node3D
@export var ship_ia: Node3D

# Called when the node enters the scene tree for the first time.
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var global_ship_pos = ship.player_ship.global_position
	var local_ship_pos = to_local(global_ship_pos)
	var closest_off = track.curve.get_closest_offset(local_ship_pos)
	var gravity_dir = track.curve.sample_baked_up_vector(closest_off)
	ship.gravity_dir = gravity_dir
	
	var global_ship_ia_pos = ship_ia.global_position
	var local_ship_iap_pos = to_local(global_ship_ia_pos)
	var closest_off_ia = track.curve.get_closest_offset(local_ship_pos)
	var gravity_ia_dir = track.curve.sample_baked_up_vector(closest_off_ia)
	ship_ia.gravity_dir = gravity_ia_dir
