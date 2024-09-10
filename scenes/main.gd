extends Node2D


var bg_step = 10000
var max_x = 0 + bg_step
var bg_scn = preload("res://Components/Launch_bg.tscn")

signal still
var connected = false;


func _ready():
	still.connect(is_still)


func _process(_delta):
	if($Launcher.fired):
		var player = $Launcher/Player
		if !connected:
			player.still.connect($Camera2D.put_banner)
			connected = true
		
		$Camera2D.update_pos(player.position)
		$Camera2D.update_labels(player.velocity, player.position.x)
		$Camera2D.timer_start()
		
		if(player.position.x > max_x):
			var bg = bg_scn.instantiate()
			add_child(bg)
			var prev_bg = get_node("bg-"+str(max_x-bg_step))
			prev_bg.queue_free()
			max_x += bg_step
			bg.name = "bg-"+str(max_x)
			bg.position.x = max_x
			bg.z_index = -1

func is_still():
	print("a")
