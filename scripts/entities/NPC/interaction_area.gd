class_name InteractionArea
extends Area2D

signal interaction_started

var player_entered: bool = false
var player_interacting: bool = false

func _ready() -> void:
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)
	Events.player_started_interacting.connect(_on_player_started_intreracting)
	Events.player_stopped_interacting.connect(_on_player_stopped_interacting)
	pass

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		player_entered = true
		if player_interacting:
			interaction_started.emit()

func _on_body_exited(body: Node2D) -> void:
	if body is Player:
		player_entered = false

func _on_player_started_intreracting() -> void:
	player_interacting = true
	if player_entered:
		interaction_started.emit()

func _on_player_stopped_interacting() -> void:
	player_interacting = false
