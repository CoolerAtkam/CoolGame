class_name Player
extends CharacterBody2D

@export var speed: float
@export var lerp_streangth: float

func _physics_process(delta: float) -> void:
	var direction: Vector2 = Input.get_vector("left", "right", "up", "down")
	
	velocity = velocity.lerp(direction * speed, delta * lerp_streangth)
	
	move_and_slide()
