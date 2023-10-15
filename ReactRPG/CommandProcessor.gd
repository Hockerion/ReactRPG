extends Node

#where the game logic happens
signal zone_changed(new_zone)
signal zone_updated(current_zone)
#signal response_generated(response_text)

var current_zone = null
var player = null

func initialize(starting_zone, player) -> String:
	self.player = player
	return change_zone(starting_zone)

func process_command(input: String) -> String:
	var words = input.split(" ", false)
	if words.size() == 0:
		return "Error: No words were parsed!"
	var first_word = words[0].to_lower() #turns all words to lowercase, nulling case sensitivity
	var second_word = ""
	if words.size() > 1:
		second_word = words[1].to_lower()

	match first_word:
		"go": 
			return go(second_word)
		"take": 
			return take(second_word)
		"inventory": 
			return inventory()
		"drop": 
			return drop(second_word)
		"use": 
			return use(second_word)
		#"talk":
			#return talk(second_word)
		#"give":
			#return give(second_word)
		"help": 
			return help()
		_:
			return "Unrecognized Command! Please try again!"
	

func go(second_word: String) -> String:
	if second_word == "":
		return "Go Where?"
	
	if current_zone.exits.keys().has(second_word):
		var exit = current_zone.exits[second_word]
		#if exit.is_other_zone_locked(current_zone):
		if exit.is_locked:
			return "%s is currenlty inaccesible!" % second_word
		
		var change_response = change_zone(exit.get_other_zone(current_zone))
		return "\n".join(PackedStringArray(["You go to %s." % second_word, change_response]))
		#This function now is reversed in Godot 4.0 = PackedStringArray(req_godot).join('.') -> '.'.join(PackedStringArray(req_godot))
	else:
		return "That is not a valid exit of this area"
	#return "You go to %s %s" % [second_word, some_other_string] if you need more than one variable

func take(second_word: String) -> String:
	if second_word == "":
		return "Take what?"
	
	for item in current_zone.items:
		if second_word.to_lower() == item.item_name.to_lower():
			current_zone.remove_item(item)
			player.take_item(item)
			return "You've taken the " + item.item_name +"!"
	return "No item exists within the zone!"

func drop(second_word: String) -> String:
	if second_word == "":
		return "Take what?"
	
	for item in player.inventory:
		if second_word.to_lower() == item.item_name.to_lower():
			player.drop_item(item)
			current_zone.add_item(item)
			return "You've dropped the " + item.item_name +"!"
	return "You don't have the item!"

func inventory() -> String:
	return player.get_inventory_list()

func use(second_word) -> String:
	if second_word == "":
		return "Use what?"
	
	for item in player.inventory:
		if second_word.to_lower() == item.item_name.to_lower():
			match item.item_type:
				Types.ItemTypes.KEY:
					for exit in current_zone.exits.values():
						#if exit.zone_2 == item.use_value:
						if exit == item.use_value:
							#exit.zone_2_is_locked = false
							exit.is_locked = false
							player.drop_item(item) #no need to manually delete them due to godot doing it for use through resources
							#return "You used the %s to unlock the locked to %s" % [item.item_name, exit.zone_2.zone_name]							
							return "You used the %s to unlock the locked to %s" % [item.item_name, exit.get_other_zone(current_zone).zone_name]
					return "That item doesn't unlock any doors!"
				_:
					return "Tried to use an item with an invalid type!"
	return "You don't have that item!"

func help() -> String:
	return "You can use these commands: go [location', take [item], inventory, drop [item], use [item] help]"	

func change_zone(new_zone: Zone) -> String:
	current_zone = new_zone
	emit_signal("zone_changed", new_zone)
	return new_zone.get_full_description()
	#emit_signal("response_generated", "\n".join(strings))
	
	#emit_signal("response_generated", strings)
	#emit_signal("response_generated", new_room.room_description)
