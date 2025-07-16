extends CharacterBody2D

@export var speed: float
@export var target_markers: Node
@export var dialog: NpcDialog

@onready var navigation: NavigationAgent2D = $NavigationAgent2D

var postions: Array[Vector2]
var postion_index: int = 0

func _ready() -> void:
	postions.append(global_position)
	for target in target_markers.get_children():
		if target is Marker2D:
			postions.append(target.global_position)
	actor_setup.call_deferred()

func _physics_process(_delta: float) -> void:
	if navigation.is_navigation_finished():
		set_next_target()
	
	var next_position: Vector2 = navigation.get_next_path_position()

	velocity = global_position.direction_to(next_position) * speed
	move_and_slide()

func actor_setup() -> void:
	await get_tree().physics_frame
	set_next_target()

func set_next_target() -> void:
	navigation.target_position = postions[postion_index]
	postion_index = (postion_index + 1) % postions.size()


func _on_interaction_started() -> void:
	Events.interaction_started.emit()
