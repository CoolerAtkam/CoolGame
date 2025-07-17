class_name Entity
extends CharacterBody2D

@export var speed: float
@export var acceleration: float
@export_group("Debug")
@export var can_move: bool = true

func move(direction: Vector2, delta: float) -> void:
	if not can_move:
		return
	velocity = velocity.lerp(direction * speed, delta * acceleration)
	move_and_slide()
