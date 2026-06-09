extends CharacterBody2D

# Vitesse et saut
@export var speed = 300.0
@export var jump_velocity = -500.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	# Gravité
	if not is_on_floor():
		velocity.y += gravity * delta

	# Saut (Espace/Entrée)
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jump_velocity

	# Déplacement (flèches gauche/droite)
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	move_and_slide()
