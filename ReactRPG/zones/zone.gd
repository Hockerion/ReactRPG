@tool #tool is no longer supported in Godot 4
extends PanelContainer

class_name Zone

@export var zone_name: String = "Zone Name": set = set_zone_name #setget set_function, get_function
#@export (String) var room_name: String = "Room Name" this is no longer preent in GODOT 4
@export_multiline  var zone_description: String = "This is the description of the zone": set = set_zone_description

func set_zone_name(new_name: String):
	$MarginContainer/ZoneRows/ZoneName.text = new_name
	zone_name = new_name

func set_zone_description(new_description: String):
	$MarginContainer/ZoneRows/ZoneDescription.text = new_description
	zone_description = new_description

var exits: Dictionary = {}
var items: Array = []

func add_item(item: Item):
	items.append(item)

func remove_item(item: Item):
	items.erase(item)

func get_full_description() -> String: #formerly in command processor, change_zone
	#var strings = "\n".join(PackedStringArray([
	#var full_description = ", ".join(PackedStringArray(["You are now in: " + zone_name + ". It is " + zone_description, #formerly strings
		#"Exits: " + exit_string])) "Exits: " moved to get_exit_description
	var full_description = ", ".join(PackedStringArray([
		get_zone_description(),
		get_item_description(),
		get_exit_description()]))
	return full_description
	#var full_description = " ".join(PackedStringArray([get_zone_description()]))
	#var item_description = get_item_description()
	#if item_description != "":
	#	full_description.append(item_description)
	#full_description.append(get_exit_description())
	#var full_description_string = " ".join(PackedStringArray([full_description.append(get_exit_description())]))
	#return full_description_string

func get_zone_description() -> String:
	return "You are now in: " + zone_name + ". It is " + zone_description

func get_item_description() -> String:
	if items.size() == 0:
		return "No items to pickup."
	
	var item_string = ""
	for item in items:
		item_string += item.item_name + " "
	#return "Items: "  + " ".join(PackedStringArray([])) #changed from PoolStringArray in new version 4.0
	return "Items: " + item_string

func get_exit_description() -> String:
	#var exit_string = " ".join(PackedStringArray(new_zone.exits.keys()))
	#var exit_string = " ".join(PackedStringArray(new_zone.exits.keys()))
	return "Exits: " + ",".join(PackedStringArray(exits.keys()))

func connect_exit_unlocked(direction: String, zone, zone2_override = "null"):
	return _connect_exit(direction, zone, false, zone2_override) # false not really required since its default

func connect_exit_locked(direction: String, zone, zone2_override = "null"):
	return _connect_exit(direction, zone, true, zone2_override)

func _connect_exit(direction: String, zone, is_locked: bool = false, zone2_override = "null"): #, override_direction: bool = false):
	var exit = Exit.new()
	exit.zone_1 = self
	exit.zone_2 = zone
	#exit.zone_2_is_locked = is_locked
	exit.is_locked = is_locked
	exits[direction] = exit
	
	if zone2_override != "null":
		zone.exits[zone2_override] = exit
	else:
		match direction:
			"west":
				zone.exits["east"] = exit
				#exits[direction] = zone
				#zone.exits["east"] = self
			"east":
				zone.exits["west"] = exit
				#exits[direction] = zone
				#zone.exits["west"] = self
			"north":
				zone.exits["south"] = exit
				#exits[direction] = zone
				#zone.exits["south"] = self
			"south":
				zone.exits["north"] = exit
				#exits[direction] = zone
				#zone.exits["north"] = self
			"inside":
				zone.exits["outside"] = exit
			"outside":
				zone.exits["inside"] = exit
			_:
				printerr("Tried to connect to invalid direction: %s", direction)
	return exit
