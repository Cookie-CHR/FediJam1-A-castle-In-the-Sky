extends CharacterBody2D

var speed = 300
var g = 1000

var friction_0 = .6
var friction_1 = .4
var friction_2 = .2

signal still

func _ready():
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
		if(collider == "Floor"):
			velocity = velocity.bounce(collision_info.get_normal())*0.7
			
		
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
		_: friction = friction_0
		
	velocity.x *= ( 100.0-friction ) /100
	velocity.y *= ( 100.0-friction ) /100
	

func boost(power, angle):
	velocity += Vector2(power*cos(angle), power*sin(angle))


func stop():
	velocity.x = velocity.x/10

func _is_still():
	velocity = Vector2(0,0)
	still.emit()
