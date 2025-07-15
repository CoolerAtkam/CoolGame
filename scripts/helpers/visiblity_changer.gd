class_name VisibltyChanger
extends Node

@export var visiblity: bool = false

@onready var parent: CanvasItem = $".."


func _ready() -> void:
	if parent is CanvasItem:
		parent.visible = visiblity
