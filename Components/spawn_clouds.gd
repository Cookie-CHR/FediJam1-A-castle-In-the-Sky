extends Node2D


var wind_scn = preload("res://Components/wind.tscn")
var storm_scn = preload("res://Components/storm.tscn")

signal wind_hit
signal storm_hit

# Called when the node enters the scene tree for the first time.
func _ready():
	var n_wind = (6+General.luck_lvl) * 3
	var n_storm = (6-General.luck_lvl) * 3
	
	for i in range(n_wind):
		var wind = wind_scn.instantiate()
		wind.position = Vector2(randi_range(-2500,2500), randi_range(-1200,600))
		wind.z_index = 10
		add_child(wind)
		wind.connect("wind_hit", emit_wind)
	
	
	for i in range(n_storm):
		var storm = storm_scn.instantiate()
		storm.position = Vector2(randi_range(-2500,2500), randi_range(-1200,600))
		storm.z_index = 10
		add_child(storm)
		storm.connect("storm_hit", emit_storm)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func emit_wind():
	wind_hit.emit()

func emit_storm():
	storm_hit.emit()
