extends VBoxContainer

var data = load("res://CommandProcessor.gd").new()

@export var LoadScene : PackedScene

func _on_new_button_pressed() -> void:
	get_tree().change_scene_to_packed(LoadScene)

func _on_load_button_pressed() -> void:
	data.load_data()
	
func _on_options_button_pressed() -> void:
	get_tree().change_scene_to_file("res://options_mm.tscn")

func _on_mm_quit_button_pressed() -> void:
	get_tree().quit() 
