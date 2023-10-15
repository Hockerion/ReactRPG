extends Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$RoomZone.connect_exit_unlocked("east", $HouseZone)
	var key = Item.new()
	key.initialize("Housekey", Types.ItemTypes.KEY)
	key.use_value =  $RoomZone
	$RoomZone.add_item(key)
	
	$HouseZone.connect_exit_unlocked("west", $RoomZone)
	var House_exit = $HouseZone.connect_exit_locked("outside", $OutsideZone, "inside")
	#var Housekey = Item.new()
	#Housekey.initialize("Housekey", Types.ItemTypes.KEY)
	#Housekey.use_value =  House_exit
	#$HouseZone.add_item(Housekey)
	
	#ar Gatekey = Item.new()
	#Gatekey.initialize("Gatekey", Types.ItemTypes.KEY)
	
	var House_entrance = $OutsideZone.connect_exit_locked("inside", $HouseZone, "outside")
	Housekey.use_value = House_entrance
	$OutsideZone.connect_exit_unlocked("north", $GardenZone)
	$OutsideZone.connect_exit_unlocked("east", $Road1Zone)
	
	$GardenZone.connect_exit_unlocked("south", $OutsideZone)
	
	$Road1Zone.connect_exit_unlocked("inside", $HallZone)
	$Road1Zone.connect_exit_unlocked("east", $OutsideZone)
	$Road1Zone.connect_exit_unlocked("west", $Road2Zone)
	
	$Road2Zone.connect_exit_unlocked("north", $Road3Zone)
	$Road2Zone.connect_exit_unlocked("inside", $StoreZone)
	$Road2Zone.connect_exit_unlocked("east", $Road1Zone)
	$Road2Zone.connect_exit_unlocked("inside", $FriendZone)
	
	$Road3Zone.connect_exit_unlocked("north", $GateZone)
	$Road3Zone.connect_exit_unlocked("south", $Road2Zone)
	$Road3Zone.connect_exit_unlocked("inside", $InnZone)
	$Road3Zone.connect_exit_unlocked("inside", $HallZone)
	
	$StoreZone.connect_exit_unlocked("outside", $Road2Zone)
	
	$FriendZone.connect_exit_unlocked("outside", $Road2Zone)
	
	$InnZone.connect_exit_unlocked("outside", $Road3Zone)
	
	$HallZone.connect_exit_unlocked("south", $Road1Zone)
	$HallZone.connect_exit_unlocked("east", $Road3Zone)
	
	$GateZone.connect_exit_unlocked("south", $Road3Zone, "north")
	var Gateexit = $GateZone.connect_exit_locked("north", $WildZone, "south")
	Gatekey.use_value = Gateexit
	$HallZone.add_item(Gatekey)
	
	$WildZone.connect_exit_unlocked("south", $GateZone)
	

