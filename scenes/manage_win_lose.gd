extends Control

signal game_success
signal game_fail


var curr_level = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	get_child(0).connect("game_success",_next_level)
	pass # Replace with function body.


func _next_level():
	LevelManager._go_to_level(curr_level+1)
