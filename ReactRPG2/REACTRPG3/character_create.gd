extends Control


#var data = load("res://CommandProcessor.gd").new()

#@onready var command_processorCC = $CommandProcessor

#@export var LoadScene : PackedScene

#@onready var room_name = $MarginContainer/Rows/TitleSection/RoomNameLabel
#@onready var room_description = $MarginContainer/Rows/RoomDescriptionLabel


##### VARIABLES AND CONNECTIONS #####

@onready var NME_label = $ColorRect/VBoxContainer/CurrentName
@onready var STR_label = $ColorRect/AttributeValues/STRvalue
@onready var DEX_label = $ColorRect/AttributeValues/DEXvalue
@onready var WIS_label = $ColorRect/AttributeValues/WISvalue
@onready var END_label = $ColorRect/AttributeValues/ENDvalue
@onready var CHR_label = $ColorRect/AttributeValues/CHRvalue
@onready var LCK_label = $ColorRect/AttributeValues/LCKvalue
@onready var RCE_label = $ColorRect/VBoxContainer/CurrentRace
@onready var PRF_label = $ColorRect/VBoxContainer/CurrenClass
@onready var RCE_Desc_label = $ColorRect/RaceDescriptionLabel
@onready var PRF_Desc_label = $ColorRect/ClassDescriptionLabel
@onready var SEX_label = $ColorRect/VBoxContainer/CurrentSex
@onready var HLT_label = $ColorRect/VBoxContainer/Totalhealth
@onready var MNA_label = $ColorRect/VBoxContainer/TotalMana
@onready var SKL_label = $ColorRect/Skills
@onready var ChImage = $ColorRect/Panel/CharImage


##### NAME #####

func _on_name_input_text_submitted(new_text: String) -> void:
	if new_text.is_empty():
		return
	else:
		Character.player_name = new_text
		NME_label.text = str(Character.player_name)


##### CHARACTER CLASS #####

func _on_warrior_b_pressed() -> void:
	Character.profession = "warrior"
	health_assignment()
	mana_assignment()
	ability_assignment()
	Character.professionDesc = "Warriors include soldiers, guardsmen, barbarian warriors, and anyone else for whom fighting is a way of life. They train in combat, and they generally approach problems head on, weapon drawn."
	PRF_Desc_label.text = str(Character.professionDesc)
	PRF_label.text = str(Character.profession).capitalize()
	ChangeImage()

func _on_mage_b_pressed() -> void:
	Character.profession = "mage"
	health_assignment()
	mana_assignment()
	ability_assignment()
	Character.professionDesc = "Mages are those who seek and use knowledge of the arcane. They do magic not as the Cleric does, by faith in a greater power, but rather through insight and understanding."
	PRF_Desc_label.text = str(Character.professionDesc)
	PRF_label.text = str(Character.profession).capitalize()
	ChangeImage()

func _on_rogue_b_pressed() -> void:
	Character.profession = "rogue"
	health_assignment()
	mana_assignment()
	ability_assignment()
	Character.professionDesc = "Rogues are those who take what they want or need by stealth, disarming traps and picking locks to get to the gold they crave; or “borrowing” money from pockets, beltpouches, etc. right under the nose of the “mark” without the victim ever knowing."
	PRF_Desc_label.text = str(Character.professionDesc)
	PRF_label.text = str(Character.profession).capitalize()
	ChangeImage()

func _on_priest_b_pressed() -> void:
	Character.profession = "priest"
	health_assignment()
	mana_assignment()
	ability_assignment()
	Character.professionDesc = "Priests are those who have devoted themselves to the service of a deity, pantheon or other belief system, spending their time in mundane forms of service such as preaching and ministering in a temple; but there are those who are called to go abroad from the temple and serve their deity in a more direct way, smiting undead monsters and aiding in the battle against evil and chaos."
	PRF_Desc_label.text = str(Character.professionDesc)
	PRF_label.text = str(Character.profession).capitalize()
	ChangeImage()



##### CHARACTER RACE #####

func _on_human_b_pressed() -> void:
	Character.race = "human"
	health_assignment()
	mana_assignment()
	Character.raceDesc = "Humans come in a broad variety of shapes and sizes; the Game Master must decide what sorts of Humans live in the game world. An average Human male in good health stands around six feet tall and weighs about 175 pounds."
	RCE_Desc_label.text = str(Character.raceDesc)
	RCE_label.text = str(Character.race).capitalize()
	ChangeImage()

func _on_elf_b_pressed() -> void:
	Character.race = "elf"
	health_assignment()
	mana_assignment()
	Character.raceDesc = "Elves are a slender race, with both genders standing around five feet tall, have pale skin, pointed ears, and delicate features. Elves are lithe, graceful, and have keen eyesight and hearing. Elves are typically inquisitive, passionate, self-assured, and sometimes haughty."
	RCE_Desc_label.text = str(Character.raceDesc)
	RCE_label.text = str(Character.race).capitalize()
	ChangeImage()

func _on_dwarf_b_pressed() -> void:
	Character.race = "dwarf"
	health_assignment()
	mana_assignment()
	Character.raceDesc = "Dwarves are a short, stocky race; both male and female Dwarves stand around four feet tall, take great pride in their beards, have a fair to ruddy complexion, stout frames, and a strong, muscular build. They are rugged and resilient, typically practical, stubborn and courageous. "
	RCE_Desc_label.text = str(Character.raceDesc)
	RCE_label.text = str(Character.race).capitalize()
	ChangeImage()

func _on_beastman_b_pressed() -> void:
	Character.race = "beastman"
	health_assignment()
	mana_assignment()
	Character.raceDesc = "A Beast Man (or woman, or what have you) is a humanoid character with traits reminiscent of an animal. They might have claws (even on their toes), fangs, either heavy hair or actual fur, possibly horns or even scales, and their eyes will usually be structurally different or yellow"
	RCE_Desc_label.text = str(Character.raceDesc)
	RCE_label.text = str(Character.race).capitalize()
	ChangeImage()

##### SEX #####

func _on_male_button_pressed() -> void:
	Character.sex = "male"
	SEX_label.text = str(Character.sex).capitalize()
	ChangeImage()

func _on_female_button_pressed() -> void:
	Character.sex = "female"
	SEX_label.text = str(Character.sex).capitalize()
	ChangeImage()

##### ATTRIBUTES #####

### STRENGTH ###

func _on_strength_add_b_pressed() -> void:
	Character.strength += 1
	STR_label.text = str(Character.strength)

func _on_strength_minus_b_pressed() -> void:
	Character.strength -= 1
	STR_label.text = str(Character.strength)

### DEXTERITY ###

func _on_dexterity_add_b_pressed() -> void:
	Character.dexterity += 1
	DEX_label.text = str(Character.dexterity)

func _on_dexterity_minus_b_pressed() -> void:
	Character.dexterity -= 1
	DEX_label.text = str(Character.dexterity)

### WISDOM ###

func _on_wisdom_add_b_pressed() -> void:
	Character.wisdom += 1
	WIS_label.text = str(Character.wisdom)

func _on_wisdom_minus_b_pressed() -> void:
	Character.wisdom -= 1
	WIS_label.text = str(Character.wisdom)

### ENDURANCE ###

func _on_endurance_add_b_pressed() -> void:
	Character.endurance += 1
	END_label.text = str(Character.endurance)

func _on_endurance_minus_b_pressed() -> void:
	Character.endurance -= 1
	END_label.text = str(Character.endurance)

### CHARISMA ###

func _on_charisma_add_b_pressed() -> void:
	Character.charisma += 1
	CHR_label.text = str(Character.charisma)

func _on_charisma_minus_b_pressed() -> void:
	Character.charisma -= 1
	CHR_label.text = str(Character.charisma)

### LUCK ###

func _on_luck_add_b_pressed() -> void:
	Character.luck += 1
	LCK_label.text = str(Character.luck)

func _on_luck_minus_b_pressed() -> void:
	Character.luck -= 1
	LCK_label.text = str(Character.luck)



##### START #####

func _on_start_game_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Game.tscn")


##### BACK #####

func _on_back_cc_button_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu.tscn")



##### HEALTH #####

func health_assignment() -> void:
	var Prace = Character.race
	var Pclass = Character.profession
	if Prace != null:
		Character.health = 0
	match Prace:
		"human":
			Character.health = 10
		"elf":
			Character.health = 15
		"dwarf":
			Character.health = 20
		"beastman":
			Character.health = 25
	if Pclass != null:
		Character.health = 0
	match Pclass:
		"warrior":
			Character.health += 20
		"mage":
			Character.health += 5
		"rogue":
			Character.health += 15
		"priest":
			Character.health += 10
	HLT_label.text = str(Character.health)



##### MANA #####

func mana_assignment() -> void:
	var Prace = Character.race
	var Pclass = Character.profession
	if Prace != null:
		Character.mana = 0
	match Prace:
		"human":
			Character.mana = 20
		"elf":
			Character.mana = 25
		"dwarf":
			Character.mana = 10
		"beastman":
			Character.mana = 15
	if Pclass != null:
		Character.mana = 0
	match Pclass:
		"warrior":
			Character.mana += 5
		"mage":
			Character.mana += 20
		"rogue":
			Character.mana += 10
		"priest":
			Character.mana += 15
	MNA_label.text = str(Character.mana)



##### ABILITY #####

func ability_assignment() -> void:
	var Pclass = Character.profession
	if Pclass != null:
		Character.ability = []
	match Pclass:
		"warrior":
			Character.ability = ["Slash", "Block", "Pierce", "Roar"]
		"mage":
			Character.ability = ["Fireball", "IceSpear", "Earthquake", "Cyclone"]
		"rogue":
			Character.ability = ["DaggerThrow", "Stealth", "Smokebomb", "Dodge"]
		"priest":
			Character.ability = ["Heal", "Bless", "Pray", "Intimidation"]
	SKL_label.text = str(Character.ability)



##### IMAGE #####

func ChangeImage() -> void:
	var Prace = Character.race
	var Pclass = Character.profession
	var Psex = Character.sex
	if Prace == "dwarf" && Pclass == "mage" && Psex == "female":
		ChImage.texture = load("res://Images/FDM.jpg")	
	elif  Prace == "dwarf" && Pclass == "mage" && Psex == "male":
		ChImage.texture = load("res://Images/MDM.jpg")	
	else:
		return
