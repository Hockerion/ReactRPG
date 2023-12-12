extends CanvasLayer

var data = load("res://CommandProcessor.gd").new()

func _on_resume_pressed() -> void:
	get_tree().change_scene_to_file("res://Game.tscn")

func _on_save_pressed() -> void:
	data.save_data()
func _on_p_quit_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu.tscn")
