class_name NPC
extends Area2D

signal interaction_started
signal interaction_stopped

@onready var interactable: Sprite2D = $Interactable

var player_interacting: bool = false
var player_in_area: bool = false

var npc_dialog: NpcDialog

func _ready() -> void:
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)
	Events.player_started_interacting.connect(_on_player_starts_interaction)
	Events.player_stopped_interacting.connect(_on_player_stopped_interaction)


func _physics_process(_delta: float) -> void:
	if player_interacting and player_in_area:
		interaction_started.emit()


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		interactable.visible = true
		player_in_area = true

func _on_body_exited(body: Node2D) -> void:
	if body is Player:
		interactable.visible = false
		player_in_area = false


func _on_player_starts_interaction() -> void:
	player_interacting = true


func _on_player_stopped_interaction() -> void:
	player_interacting = false
