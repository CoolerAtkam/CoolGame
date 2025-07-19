class_name Player
extends Entity

@onready var interaction_timer: Timer = $InteractionTimer


var interacting: bool = false

func _ready() -> void:
	Events.interaction_started.connect(_on_interaction_started)
	Events.interaction_stopped.connect(_on_interaction_stopped)


func _physics_process(delta: float) -> void:
	if interacting:
		return
	
	var direction: Vector2 = Input.get_vector("left", "right", "up", "down")
	
	move(direction, delta)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("iteraction_enter"):
		interaction_timer.start()
		Events.player_started_interacting.emit()


func _on_interaction_started() -> void:
	interacting = true


func _on_interaction_stopped() -> void:
	interacting = false


func _on_interaction_timeout() -> void:
	Events.player_stopped_interacting.emit()
