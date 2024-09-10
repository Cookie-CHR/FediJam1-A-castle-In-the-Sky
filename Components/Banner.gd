extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$To_shop.pressed.connect(LevelManager._go_to_shop)
	z_index = 1000


func adjust_labels(distance,time):
	$Distance.text = "%.2f m" %distance
	$Time.text = str(time)+" s"
	$Money.text = str(calc_money(distance, time))
	
	General.money += max(0, calc_money(distance, time))

func calc_money(distance, time):
	return floor(distance*time/50)
