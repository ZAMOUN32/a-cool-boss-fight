extends Control

signal save_selected(save_slot: int)  # Signal pour indiquer quelle sauvegarde est choisie

func _on_save_1_button_pressed():
	emit_signal("save_selected", 1)  # Émet un signal avec le numéro de la sauvegarde
	get_parent().hide()  # Masque le sous-menu

func _on_save_2_button_pressed():
	emit_signal("save_selected", 2)
	get_parent().hide()

func _on_back_button_pressed():
	get_parent().hide()  # Masque le sous-menu
