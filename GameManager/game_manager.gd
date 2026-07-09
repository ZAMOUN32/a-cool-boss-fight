extends Node2D

# Pré-charge des scènes
@onready var player_scene = preload("res://GameManager/Player/player.tscn")
@onready var bateowww_scene = preload("res://GameManager/BATO/BATEOWWW.tscn")

# Références
var player: CharacterBody2D
var current_map: Node2D

func _ready():
	# 1. Charge la map (BATEOWWW)
	current_map = bateowww_scene.instantiate()
	add_child(current_map)

	# 2. Charge le joueur à une position de départ
	player = player_scene.instantiate()
	player.position = Vector2(400, 300)  # Centre de l'arène (à ajuster)
	current_map.add_child(player)  # Le joueur est enfant de la map pour la hiérarchie

	# 3. (Optionnel) Gère les signaux ou autres initialisations
	# Exemple : connecter un signal de mort du boss pour recharger la scène
	# $BATEOWWW.connect("boss_defeated", _on_boss_defeated)
