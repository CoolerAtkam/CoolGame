class_name Follow
extends Path2D

@export_category("NPC")
@export var npc_dialog: NpcDialog
@export_category("Path")
@export var speed: float

@onready var path_follow: PathFollow2D = $PathFollow2D
@onready var npc: NPC = $PathFollow2D/NPC


var walking: bool = true

func _ready() -> void:
	npc.npc_dialog = npc_dialog

func _physics_process(delta: float) -> void:
	if walking:
		path_follow.progress += speed * delta


func _on_interaction_started() -> void:
	Events.interaction_started.emit()
	walking = false


func _on_interaction_stopped() -> void:
	Events.interaction_started.emit()
	walking = true
