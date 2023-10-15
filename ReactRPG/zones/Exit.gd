extends Resource
class_name Exit

#var zone_1: Zone = null
var zone_1 = null
#var zone_1_is_locked := false

#var zone_2: Zone = null
var zone_2 = null
#var zone_2_is_locked := false
var is_locked := false #makes it known by default its false

#var zone_3 = null
#var zone_3_is_locked := false

#func is_other_zone_locked(current_zone) -> bool:
#	if current_zone == zone_1:
#		return zone_2_is_locked
#	elif current_zone == zone_2:
#		return zone_1_is_locked
#	else: 
#		printerr("The zone you're trying to find is not connected to this exit.")
#		return true # prevents players from going to an invalid exit

func get_other_zone(current_zone):
	if current_zone == zone_1:
		return zone_2
	elif current_zone == zone_2:
		return zone_1
	#elif current_zone == zone_2:
		#return zone_3
	#elif current_zone == zone_3:
		#return zone_2
	else: 
		printerr("The zone you're trying to find is not connected to this exit.")
		return null
