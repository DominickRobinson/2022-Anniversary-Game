extends KinematicBody2D

var rng = RandomNumberGenerator.new()

var direction = Vector2.RIGHT
var velocity = Vector2.ZERO

export var WALK_PROBABILITY := 30
export var WALK_SPEED := 50

onready var ledgeCheckRight = $RightLedgeCheck
onready var ledgeCheckLeft = $LeftLedgeCheck

func _ready():
	#$AnimatedSprite.play("idle")
	$AnimatedSprite.animation = "idle"
	rng.randomize()
	$AnimatedSprite.speed_scale = WALK_SPEED / 50.0


func _physics_process(delta):
	var found_wall = is_on_wall()
	var found_ledge = not ledgeCheckRight.is_colliding() or not ledgeCheckLeft.is_colliding()
	
	if found_wall or found_ledge:
		direction *= -1
		if direction.x == 1:
			$AnimatedSprite.flip_h = false
		else:
			$AnimatedSprite.flip_h = true
	
	if velocity != Vector2.ZERO:
		velocity = direction * WALK_SPEED
	
	move_and_slide(velocity, Vector2.UP)

func _on_Timer_timeout():
	var r = rng.randf_range(0, 100)
	if r <= WALK_PROBABILITY:
		velocity = direction * WALK_SPEED
		$AnimatedSprite.animation = "walk"
		#print("walk")
	else:
		velocity = Vector2.ZERO
		$AnimatedSprite.animation = "idle"
		#print("stop")
	$Timer.start()
