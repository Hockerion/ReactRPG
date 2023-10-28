extends Resource
class_name NPC


@export var npc_name = "NPC Name"

@export_multiline var initial_dialog
@export_multiline var post_quest_dialog

@export var quest_item: Resource

var has_received_quest_item := false
var quest_reward = null