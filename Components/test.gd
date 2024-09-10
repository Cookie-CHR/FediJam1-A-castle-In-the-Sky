extends StaticBody2D

signal storm_hit
signal wind_hit
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func emit_wind():
	print("wind")
	wind_hit.emit()

func emit_storm():
	print("storm")
	storm_hit.emit()
