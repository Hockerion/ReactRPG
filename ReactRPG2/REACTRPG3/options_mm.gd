extends Control

func _on_back_options_button_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu.tscn")