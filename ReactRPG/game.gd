extends Control

const Response = preload("res://input/response.tscn")
var max_scroll_length := 0
const TurnResponse = preload("res://input/TurnResponse.tscn")

#put @ infront of onready and export since it might be different in Godot 4
@export var max_remembered_lines := 30
@onready var command_processor = $CommandProcessor
@onready var story_history = $Background/MarginContainer/GameInterface/GameInfo/ScrollContainer/StoryHistory
@onready var scroll = $Background/MarginContainer/GameInterface/GameInfo/ScrollContainer
@onready var scrollbar = scroll.get_v_scroll_bar()
@onready var zone_manager = $ZoneManager
@onready var player = $Player

func _ready() -> void:
	scrollbar.changed.connect(handle_changed_scrollbar)
	#scrollbar.connect("changed", self, "handle_changed_scrollbar") no longer works in godot 4
	max_scroll_length = scrollbar.max_value
	
	create_response_generator("Welcome to ReactRPG! Type 'Help' to see available commanmds!")
	#command_processor.response_generated.connect(handle_response_generator)
	#command_processor.connect("response_generated", self, "handle_response_generator") is outdated
	var starting_zone_response = command_processor.initialize(zone_manager.get_child(0), player)
	create_response_generator(starting_zone_response)

func handle_changed_scrollbar():
	if max_scroll_length != scrollbar.max_value:
		max_scroll_length = scrollbar.max_value
		scroll.scroll_vertical = max_scroll_length

func _on_input_text_submitted(new_text: String) -> void:
	if new_text.is_empty(): #is_empty() instead of empty()
		return
	var turn_response = TurnResponse.instantiate()
	var response = command_processor.process_command(new_text)
	turn_response.set_text(new_text, response)
	add_game_response(turn_response)

func create_response_generator(response_text: String): #func handle_response_generator(response_text: String):
	var response = Response.instantiate() #instance is instantiate
	response.text = response_text 
	add_game_response(response)

func add_game_response(response: Control):
	story_history.add_child(response)
	delete_history_beyond_limit()

func delete_history_beyond_limit():
	if story_history.get_child_count() > max_remembered_lines:
		var forget_rows = story_history.get_child_count() - max_remembered_lines
		for i in range (forget_rows):
			story_history.get_child(i).queue_free()  #use tabs instead of space

	# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#pass # Replace with function body.

	#func _ready() -> void:
	#	var story_history = $Story_History
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass
