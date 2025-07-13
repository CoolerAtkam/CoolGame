class_name Follow
extends Path2D

@export var speed: float
@onready var path_follow: PathFollow2D = $PathFollow2D

func _physics_process(delta: float) -> void:
	path_follow.progress_ratio += speed * delta
