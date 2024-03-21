extends Node3D

@export var enemy_ship: VehicleBody3D

func _process(delta):
	if enemy_ship.raycast.x > 3.0 and enemy_ship.raycast.z > 3.0 :
		enemy_ship.motor = 3.0
		enemy_ship.steer = 0
	if enemy_ship.raycast.x < 4.0 and enemy_ship.raycast.z > 4.0 :
		enemy_ship.motor = -0.2
		enemy_ship.steer = -1.0
	if enemy_ship.raycast.x > 4.0 and enemy_ship.raycast.z < 4.0 :
		enemy_ship.motor = -0.2
		enemy_ship.steer = 1.0
	if enemy_ship.raycast.x < 4.0 and enemy_ship.raycast.z < 4.00 :
		enemy_ship.motor = -0.3
		enemy_ship.steer = 0.0
