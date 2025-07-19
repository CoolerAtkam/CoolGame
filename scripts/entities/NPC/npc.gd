class_name Npc
extends Entity

@export var dialog: NpcDialog

@onready var navigation: NavigationAgent2D = $NavigationAgent2D

var postions: PackedVector2Array
var postion_index: int = 0

func _ready() -> void:
	set_target_postions()
	actor_setup.call_deferred()

func _physics_process(delta: float) -> void:
	if navigation.is_navigation_finished():
		set_next_target()
	
	var next_position: Vector2 = navigation.get_next_path_position()
	var direction: Vector2 = global_position.direction_to(next_position)
	move(direction, delta)

func set_target_postions() -> void:
	postions.append(global_position)
	for target: Node in get_children():
		if target is Marker2D:
			postions.append((target as Marker2D).global_position)
			target.queue_free()

func actor_setup() -> void:
	await get_tree().physics_frame
	set_next_target()

func set_next_target() -> void:
	navigation.target_position = postions[postion_index]
	postion_index = (postion_index + 1) % postions.size()


func _on_interaction_started() -> void:
	Events.interaction_started.emit()
