extends Area2D

signal storm_hit
signal wind_hit

func emit_wind(_var):
	wind_hit.emit()
	$CollisionPolygon2D.disabled = true

func emit_storm(_var):
	storm_hit.emit()
	$CollisionPolygon2D.disabled = true
