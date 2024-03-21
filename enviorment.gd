extends Node3D

@export var track: Path3D
# Called when the node enters the scene tree for the first time.
var num_lights = 10  # Número de luzes a serem adicionadas
var spacing = 1000.  # Espaçamento entre as luzes
var light_scene = preload("res://scenes/light.tscn")  # Cena da luz a ser instanciada

func _ready():

	for i in range(num_lights):
		var light_instance = light_scene.instantiate()
		light_instance.position = track.to_global(track.curve.sample_baked(i*spacing)) + track.curve.sample_baked_up_vector(i*spacing)*10
		add_child(light_instance)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
