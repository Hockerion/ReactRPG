extends PanelContainer

##### ROOMS #####

@onready var room_name = $MarginContainer/SidePanel/Rows/TitleSection/RoomNameLabel
@onready var room_description = $MarginContainer/SidePanel/Rows/RoomDescriptionLabel

##### FUNCTIONS #####

@onready var exit_label = $MarginContainer/SidePanel/Rows/ListArea/ExitLabel
@onready var npc_label = $MarginContainer/SidePanel/Rows/ListArea/NpcLabel
@onready var item_label = $MarginContainer/SidePanel/Rows/ListArea/ExitLabel

##### CHARACTER #####

# PERSONAL INFO #

@onready var NME_labelSP = $MarginContainer/SidePanel/CharInfo/HBoxContainer/PerInfovalues/SPCNameval
@onready var SEX_labelSP = $MarginContainer/SidePanel/CharInfo/HBoxContainer/PerInfovalues/SPCSexval
@onready var RCE_labelSP = $MarginContainer/SidePanel/CharInfo/HBoxContainer/PerInfovalues/SPRaceval
@onready var PRF_labelSP = $MarginContainer/SidePanel/CharInfo/HBoxContainer/PerInfovalues/SPClassval
@onready var HLT_labelSP = $MarginContainer/SidePanel/CharInfo/HBoxContainer/PerInfovalues/SPCHealthval
@onready var MNA_labelSP = $MarginContainer/SidePanel/CharInfo/HBoxContainer/PerInfovalues/SPCManaval

# ATTRIBUTES #

@onready var STR_labelSP = $MarginContainer/SidePanel/CharInfo/HBoxContainer/AttrValue/SPSTRval
@onready var DEX_labelSP = $MarginContainer/SidePanel/CharInfo/HBoxContainer/AttrValue/SPDXTval
@onready var WIS_labelSP = $MarginContainer/SidePanel/CharInfo/HBoxContainer/AttrValue/SPWISval
@onready var END_labelSP = $MarginContainer/SidePanel/CharInfo/HBoxContainer/AttrValue/SPENDval
@onready var CHR_labelSP = $MarginContainer/SidePanel/CharInfo/HBoxContainer/AttrValue/SPCHRval
@onready var LCK_labelSP = $MarginContainer/SidePanel/CharInfo/HBoxContainer/AttrValue/SPLCKval

# ABILITY #

@onready var SKL1_Desc_labelSP = $MarginContainer/SidePanel/CharInfo/SPAbilities/SkillsDefSP/Abilitydef1SP
@onready var SKL2_Desc_labelSP = $MarginContainer/SidePanel/CharInfo/SPAbilities/SkillsDefSP/Abilitydef2SP
@onready var SKL3_Desc_labelSP = $MarginContainer/SidePanel/CharInfo/SPAbilities/SkillsDefSP/Abilitydef3SP
@onready var SKL4_Desc_labelSP = $MarginContainer/SidePanel/CharInfo/SPAbilities/SkillsDefSP/Abilitydef4SP


func handle_room_changed(new_room):
	room_name.text = str(new_room.room_name)
	room_description.text = str(new_room.room_description)

	exit_label.text = new_room.get_exit_description()

	var npc_string = new_room.get_npc_description()
	if npc_string == "":
		npc_label.hide()
	else:
		npc_label.show()
		npc_label.text = str(npc_string)

	var item_string = new_room.get_item_description()
	if item_string == "":
		item_label.hide()
	else:
		item_label.show()
		item_label.text = str(item_string)



func char_value_assignment():
	NME_labelSP.text = Character.player_name
	SEX_labelSP.text = Character.sex.capitalize()
	RCE_labelSP.text = Character.race.capitalize()
	PRF_labelSP.text = Character.profession.capitalize()
	HLT_labelSP = str(Character.health)
	MNA_labelSP = str(Character.mana)

	STR_labelSP.text = str(Character.strength)
	DEX_labelSP.text = str(Character.dexterity)
	WIS_labelSP.text = str(Character.wisdom)
	END_labelSP.text = str(Character.endurance)
	CHR_labelSP.text = str(Character.charisma)
	LCK_labelSP.text = str(Character.luck)
	
	SKL1_Desc_labelSP.text = str(Character.ability[0])
	SKL2_Desc_labelSP.text = str(Character.ability[1])
	SKL3_Desc_labelSP.text = str(Character.ability[2])
	SKL4_Desc_labelSP.text = str(Character.ability[3])

func handle_room_updated(current_room):
	handle_room_changed(current_room)
