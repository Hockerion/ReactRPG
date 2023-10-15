extends Resource
class_name Item

#@export (String) var item_name := "Ïtem Name" <- old format
@export var item_name := "Item Name"
#@export(Types.ItemTypes) var item_type := Types.ItemTypes.KEY <- old format
@export var item_type := Types.ItemTypes.KEY

var use_value = null

func initialize(item_name: String, item_type: Types.ItemTypes): #In old version, item_type: int
	self.item_name = item_name #self is calling our item name our pareametr same a ou field, if not it changes the parameter= item_name
	self.item_type = item_type
