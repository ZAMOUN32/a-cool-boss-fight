extends Node2D

# Signal émis quand on entre dans une porte
signal tutorial_started(scene_path: String)

# Référence au joueur
@onready var player = $Player

func _ready():
	# Connecter toutes les portes
	for door in $Doors.get_children():
		door.connect("body_entered", _on_door_entered.bind(door))

func _on_door_entered(body, door: Area2D):
	if body.name == "Player":
		var scene_path = door.get_meta("tutorial_scene")
		if scene_path:
			tutorial_started.emit(scene_path)
			# Désactiver les entrées pendant la transition
			set_process_input(false)
