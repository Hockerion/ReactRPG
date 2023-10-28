extends Node


func _ready() -> void:
	$StartingRoom.connect_exit_unlocked("east", $LivingRoom)

	var House_exit = $LivingRoom.connect_exit_locked("outside", $OutsideHome, "inside")
	var Homekey = load_item("Housekey")
	Homekey.use_value = House_exit
	$LivingRoom.add_item(Homekey)
	var mom = load_npc("Mom")
	$LivingRoom.add_npc(mom)
	$LivingRoom.connect_exit_unlocked("west", $StartingRoom)
	
	$OutsideHome.connect_exit_unlocked("north", $MomsGarden)
	$OutsideHome.connect_exit_unlocked("east", $Road1)
	
	$MomsGarden.connect_exit_unlocked("south", $OutsideHome)
	var Papaya = load_item("Fruit")
	$MomsGarden.add_item(Papaya)
	var Pechay = load_item("Vegetable")
	$MomsGarden.add_item(Pechay)
		
	$Road1.connect_exit_unlocked("in", $BarangayHall)
	$Road1.connect_exit_unlocked("west", $OutsideHome)
	$Road1.connect_exit_unlocked("east", $VillageSquare)
	
	$VillageSquare.connect_exit_unlocked("north", $Road2)
	$VillageSquare.connect_exit_unlocked("in", $HawksburnStore)
	$VillageSquare.connect_exit_unlocked("west", $Road1)
	$VillageSquare.connect_exit_unlocked("inside", $SpencerEstate)
	var DSword = load_item("Sword")
	$VillageSquare.add_item(DSword)
	var Gatekey = load_item("GateKey")
	$VillageSquare.add_item(Gatekey)
	
	$Road2.connect_exit_unlocked("north", $VillageGate)
	$Road2.connect_exit_unlocked("south", $VillageSquare)
	$Road2.connect_exit_unlocked("in", $TheInn)
	$Road2.connect_exit_unlocked("inside", $BarangayHall)
	
	$HawksburnStore.connect_exit_unlocked("out", $VillageSquare)
	var jacob = load_npc("Jacob")
	$HawksburnStore.add_npc(jacob)
	var ADelights = load_item("Sweets")
	$HawksburnStore.add_item(ADelights)
	var GumamelaSoap = load_item("Product")
	$HawksburnStore.add_item(GumamelaSoap)
	
	$SpencerEstate.connect_exit_unlocked("outside", $VillageSquare)
	var emily = load_npc("Emily")
	$SpencerEstate.add_npc(emily)
	
	$TheInn.connect_exit_unlocked("out", $Road2)
	var hilda = load_npc("Innkeeper")
	$TheInn.add_npc(hilda)
	
	$BarangayHall.connect_exit_unlocked("out", $Road1)
	var chairman = load_npc("Chairman")
	$BarangayHall.add_npc(chairman)
	$BarangayHall.connect_exit_unlocked("outside", $Road2)
	
	var Gateexit = $VillageGate.connect_exit_locked("north", $Wildlands, "south")
	Gatekey.use_value = Gateexit

func load_item(item_name: String):
	return load("res://items/" + item_name + ".tres")


func load_npc(npc_name: String):
	return load("res://npcs/" + npc_name + ".tres")
