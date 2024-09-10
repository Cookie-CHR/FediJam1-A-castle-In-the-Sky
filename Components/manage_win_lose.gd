extends Control

var base_scn = preload("res://scenes/level_inner.tscn")
var victory_panel = preload("res://Components/level_completed.tscn")
var fail_panel = preload("res://Components/level_fail.tscn")
signal game_success
signal game_fail


var curr_level = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	var base = base_scn.instantiate()
	base.name = str(curr_level)
	base.connect("game_success",_spawn_panel.bind("success"))
	base.connect("game_fail",_spawn_panel.bind("fail"))
	add_child(base)
	
	base.find_child("Reset").connect("pressed",_reset_level)
	base.find_child("Map").connect("pressed",_to_map)
	base.find_child("Mute").connect("pressed", mute_unmute.bind(base.find_child("Mute")))


func _spawn_panel(panel):
	if(panel == "success"):
		var p = victory_panel.instantiate()
		p.position = Vector2(576, 324)
		add_child(p)
		p.find_child("Next").connect("pressed",_next_level)
		p.find_child("Map").connect("pressed",_to_map)
	if(panel == "fail"):
		var p = fail_panel.instantiate()
		p.position = Vector2(576, 324)
		add_child(p)
		p.find_child("Reset").connect("pressed",_reset_level)
		p.find_child("Map").connect("pressed",_to_map)
	

func _next_level():
	LevelManager._go_to_level(int(curr_level)+1)
	
func _reset_level():
	LevelManager._go_to_level(int(curr_level))
	
func _to_map():
	LevelManager._go_to_map()

func mute_unmute(child):
	child.mute_unmute()
