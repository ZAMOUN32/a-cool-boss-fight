extends Node2D

# Signal pour les tutoriels (conservé)
signal tutorial_started(scene_path: String)

# Pré-charge des scènes
@onready var tilemap_scene = preload("res://BATO/tileset/tilemap.tscn")
@onready var player_scene = preload("res://player.tscn")

# Référence au joueur
var player

func _ready():
	# 1️⃣ Charge la tilemap (elle sera enfant de BATEOWWW)
	var tilemap = tilemap_scene.instantiate()
	add_child(tilemap)

	# 2️⃣ Charge le joueur à une position de départ (à ajuster)
	player = player_scene.instantiate()
	player.position = Vector2(300, 300)  # Coordonnées en pixels (X, Y)
	add_child(player)

	# 3️⃣ (Optionnel) Conserve le système de portes si tu en as besoin
	if has_node("Doors"):
		for door in $Doors.get_children():
			door.connect("body_entered", _on_door_entered.bind(door))

func _on_door_entered(body, door: Area2D):
	if body.name == "Player":
		var scene_path = door.get_meta("tutorial_scene")
		if scene_path:
			tutorial_started.emit(scene_path)
			set_process_input(false)
