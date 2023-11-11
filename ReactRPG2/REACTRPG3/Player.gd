extends Node

class_name Player

var inventory: Array = []

#player ability
var ability: Array = []
var ability_score
var ability_level
var cash

var turn
var dice_roll

#player base
var attack
@export var health := 0
var health_regen
@export var mana := 0
var mana_regen
var armor

#level 
var level
var experience_level
var experience_points

#player etc
@export var player_name = " "
@export var race = " "
@export var raceDesc = " "
@export var profession  = " "
@export var professionDesc = " "
@export var sex = " "

#player attributes
@export var strength := 0
@export var dexterity := 0
@export var endurance := 0
@export var wisdom := 0
@export var charisma := 0
@export var luck := 0

#####ABILITITES#####

func learn_ability ():
	return
	
func cast_ability ():
	return
	
func replace_ability ():
	return
	
#####INVENTORY#####

func take_item(item: Item):
	inventory.append(item)

func use_item(item: Item):
	inventory.erase(item)

func drop_item(item: Item):
	inventory.erase(item)

func get_inventory_list() -> String:
	if inventory.size() == 0:
		return "You don't currently have anything."

	var item_string = ""
	for item in inventory:
		item_string += item.item_name + " "
	return "Inventory: " + item_string
