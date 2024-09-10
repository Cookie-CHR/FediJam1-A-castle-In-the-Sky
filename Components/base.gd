extends Node2D

var curr_player = null
var player_array = {}
@export var planets = {
	"rock": 0,
	"sun": 0,
	"ice": 0,
	"grass": 0,
	"black": 0
}
@export var map = [
	["O", "-", "-", "-", "O"],
]
var total_moves = 0

signal game_success
signal game_fail

func _ready():
	var i = 0
	for p in planets:
		if(planets[p]>0):
			var spawner_packed = load("res://Components/spawner.tscn")
			var spawner = spawner_packed.instantiate()
			spawner.type = p
			spawner.charges = planets[p]
			spawner.name = "spawner_"+p
			spawner.position = Vector2(290+120*i, 550)
			add_child(spawner)
			i+=1
			total_moves += planets[p]
	
	$TileMap.draw_map(map)


func _input(_event):
	if Input.is_action_just_pressed("click"):
		if curr_player != null:
			var success = $TileMap.check_success(get_global_mouse_position(), player_array)
			if(!success):
				emit_signal("game_fail")
				return
			var complete = $TileMap.occupy_slot(get_global_mouse_position(), player_array)
			if (complete):
				AudioPlayer._play("drop")
				delete_player()
				total_moves -= 1
				if (total_moves == 0):
					emit_signal("game_success")

func delete_player():
	curr_player.queue_free()
	curr_player = null
	player_array = {}
			
func new_player(type):
	var curr_packed = load("res://Components/planet.tscn")
	var curr = curr_packed.instantiate()
	curr.type = type
	add_child(curr)
	curr_player = curr
	player_array = {
		"type":curr.type ,
		"texture":curr_player.sprite.texture, 
		"modulate":curr_player.sprite.modulate, 
		"rotation":curr_player.sprite.rotation_degrees
	}
func change_player():
	var type =  player_array["type"]
	for child in get_children():
		if child.name == "spawner_"+type:
			child.charges +=1
			child.adjust_look(child.charges)
	delete_player()
