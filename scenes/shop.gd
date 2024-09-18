extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Play.pressed.connect(LevelManager._play)
	$Money.text = str(General.money)




func _on_item_bought():
	$Money.text = str(General.money)

