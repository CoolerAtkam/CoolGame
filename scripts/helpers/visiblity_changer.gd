class_name VisibltyChanger
extends Node

@export var visiblity: bool = false

@onready var parent: Node = $".."


func _ready() -> void:
	if "visible" in parent:
		@warning_ignore("unsafe_property_access")
		parent.visible = visiblity
	queue_free()
