extends Control

@onready var save_menu = $SaveMenu  # Assure-toi que le node s'appelle bien "SaveMenu" dans la scène

func _ready():
	save_menu.hide()  # Masque le sous-menu au démarrage

func _on_credits_button_pressed():
	print("Afficher les crédits")  # À remplacer par ta logique (ex: charger une scène "Credits.tscn")

func _on_start_game_button_pressed():
	save_menu.show()  # Affiche le sous-menu des sauvegardes

func _on_save_menu_back_button_pressed():
	save_menu.hide()  # Masque le sous-menu si on appuie sur "Retour"
