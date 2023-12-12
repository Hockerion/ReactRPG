extends Control


@onready var game_info = $Background/MarginContainer/Columns/Rows/GameInfo
@onready var command_processor = $CommandProcessor
@onready var room_manager = $RoomManager
@onready var player = $Player


func _ready() -> void:
	var side_panel = $Background/MarginContainer/Columns/SidePanel
	side_panel.char_value_assignment()
	print(Character.ability[0])
	print(Character.ability[1])
	print(Character.ability[2])
	print(Character.ability[3])
	command_processor.connect("room_changed", Callable(side_panel, "handle_room_changed"))
	command_processor.connect("room_updated", Callable(side_panel, "handle_room_updated"))

	game_info.create_response(Types.wrap_system_text("Welcome to the retro text adventure! You can type 'help' to see available commands."))

	var starting_room_response = command_processor.initialize(room_manager.get_child(0), player)
	game_info.create_response(starting_room_response)

func _on_Input_text_entered(new_text: String) -> void:
	if new_text.is_empty():
		return

	var response = command_processor.process_command(new_text)
	game_info.create_response_with_input(response, new_text)

func _on_in_game_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://pause_screen.tscn")
