extends Node2D

signal fire


func _process(_delta):
	$Arrow.look_at(get_global_mouse_position())
	
func _input(event):
	if event is InputEventMouseButton:
		emit_signal("fire")
