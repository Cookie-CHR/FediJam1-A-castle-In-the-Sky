extends CharacterBody2D

var speed = 300
var g = 1000

var player1 = preload("res://Images/Player.png")
var player2 = preload("res://Images/Player_2.png")

var p1 = preload("res://Images/Plane_1.png")
var p2 = preload("res://Images/Plane_2.png")
var p3 = preload("res://Images/Plane_3.png")

var friction_0 = .7
var friction_1 = .5
var friction_2 = .3
var friction_3 = .1

signal still
var is_fired = false
var is_still = false

func _ready():
	$Plane.texture = p1
	match General.plane_lvl:
		1: $Plane.texture = p1
		2: $Plane.texture = p2
		2: $Plane.texture = p3
		_: pass
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	aim_mouse()
	apply_movement(delta)
	apply_friction()
	apply_gravity(delta)
	var collision_info = move_and_collide(velocity * delta)
	if collision_info:
		var collider = collision_info.get_collider().name
		if(collider == "Floor" and is_fired and !is_still):
			SoundManager.audio_play("thump");
			velocity = velocity.bounce(collision_info.get_normal())*0.8
		if(collider == "Ceiling"):
			SoundManager.audio_play("thump");
			velocity = velocity.bounce(collision_info.get_normal())*0.1
			
		
	if(velocity.x<20) and (velocity.y<20) and position.y>1850:
		if($Timer.time_left == 0):
			$Timer.start()
	else:
		$Timer.stop()

func aim_mouse():
	look_at(get_global_mouse_position())

func apply_movement(delta):
	var target = get_global_mouse_position()
	velocity += position.direction_to(target) * speed * delta
	

func apply_gravity(delta):
	velocity += Vector2(0, delta * g)

func apply_friction():
	var friction = friction_0
	match General.plane_lvl:
		1: friction = friction_1
		2: friction = friction_2
		3: friction = friction_3
		_: friction = friction_0
		
	velocity.x *= ( 100.0-friction ) /100
	velocity.y *= ( 100.0-friction ) /100
	

func boost(power, angle):
	velocity += Vector2(power*cos(angle), power*sin(angle))


func stop():
	velocity.x = velocity.x/2

func _is_still():
	velocity = Vector2(0,0)
	still.emit()
	is_still = true



func animate_sprite():
	$Player.texture = player2 if $Player.texture == player1 else player1
	is_fired = true
