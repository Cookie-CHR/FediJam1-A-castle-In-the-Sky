extends Area2D

signal storm_hit
signal wind_hit

func emit_wind(_var):
	print(_var)
	wind_hit.emit()

func emit_storm(_var):
	print(_var)
	storm_hit.emit()
