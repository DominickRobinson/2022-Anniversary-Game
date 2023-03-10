extends KinematicBody2D

export (String, "Alexa", "Dom", "Panda", "Dom (white shorts)") var CHARACTER := "Alexa"
export var player_num := 1


export (int) var GRAVITY := 5
export (int) var FALLING_GRAVITY := 15
export (int) var SWIMMING_GRAVITY := -1.5
export (int) var RUN_ACCELERATION := 4
export (int) var MAX_SPEED := 150
export (int) var JUMP_FORCE := -140
export (int) var JUMP_RELEASE_FORCE := -72
export (int) var SWIM_FORCE := -80
export (int) var FRICTION_FORCE := 4
export (Vector2) var WALLJUMP_VECTOR := Vector2(-70, -170)

export (int) var HIT_STRENGTH := 200


var max_horizontal_velocity
var max_vertical_velocity

var velocity = Vector2.ZERO
var input = Vector2.ZERO

var is_swimming = false

var char_index = 0
var characters = ["Alexa", "Dom", "Panda", "Dom (white shorts)"]

var ball = preload("res://Scenes/Pickleball/Pickleball.tscn")

onready var anim = $AnimationPlayer

func _ready():
	choose_character(CHARACTER)


func choose_character(name):
	match name:
		"Alexa":
			char_index = 0
			$Sprite.texture = load("res://Assets/Characters/Alexa.png")
			$Sprite.hframes = 46
		"Dom":
			char_index = 1
			$Sprite.texture = load("res://Assets/Characters/Dom.png")
			$Sprite.hframes = 44
		"Panda":
			char_index = 2
			$Sprite.texture = load("res://Assets/Characters/Panda-Sheet.png")
			$Sprite.hframes = 44
		"Dom (white shorts)":
			char_index = 3
			$Sprite.texture = load("res://Assets/Characters/Dom (white pants).png")
			$Sprite.hframes = 44

func _physics_process(delta):

	#apply gravity
	apply_gravity()
	input = Vector2.ZERO
	input.x = Input.get_action_strength("ui_right2") - Input.get_action_strength("ui_left2")
	
	
	if Input.is_action_just_pressed("throw_ball2"):
		var b = ball.instance()
		get_parent().add_child(b)
		if $Sprite.flip_h == false:	
			b.global_position = $RightThrow.global_position
		else:
			b.global_position = $LeftThrow.global_position
		
	
	
	if Input.is_action_just_pressed("toggle_character2"):
		char_index += 1
		if char_index == characters.size():
			char_index = 0
		choose_character(characters[char_index])
	
	if input.x == 0:
		apply_friction()
	else:
		apply_acceleration(input.x)
	
	
	if is_swimming:
		if Input.is_action_just_pressed("jump2"):
			velocity.y = SWIM_FORCE
	elif is_on_floor():	
		if Input.is_action_just_pressed("jump2"):
			velocity.y = JUMP_FORCE
	else:
		if Input.is_action_just_released("jump2") and velocity.y < JUMP_RELEASE_FORCE:
			velocity.y = JUMP_RELEASE_FORCE
	
	if not is_on_floor() and nextToWall() and Input.is_action_just_pressed("jump2"):
		velocity = WALLJUMP_VECTOR
		if nextToLeftWall():
			velocity.x *= -1
	
	#handle animations
	animation_controller()
	
	#move and slide!
	velocity = move_and_slide(velocity, Vector2.UP)

#moves player when pressing movement
func apply_acceleration(amount):
	velocity.x = move_toward(velocity.x, amount * MAX_SPEED, RUN_ACCELERATION)
	pass

#stops player when not pressing movement
func apply_friction():
	if is_on_floor():
		velocity.x = move_toward(velocity.x, 0, FRICTION_FORCE)

#controls gravity
func apply_gravity():
	if is_swimming:
		velocity.y += SWIMMING_GRAVITY
	elif velocity.y > 0 and not Input.is_action_pressed("jump2"):
		velocity.y += FALLING_GRAVITY
	else:
		velocity.y += GRAVITY
	
		

#animation logic
func animation_controller():
	
	var run_bounds = 10
	var jump_bounds = 40
	
	if input.x > 0:
		$Sprite.flip_h = false
	elif input.x < 0:
		$Sprite.flip_h = true
	
	if Input.is_action_pressed("swing2"):
		anim.play("PaddleSwing")
		var things = $HitArea.get_overlapping_bodies()
		for thing in things:
			if thing.is_in_group("ball2"):
				thing = thing as RigidBody2D
				thing.linear_velocity = (thing.global_position - global_position).normalized() * HIT_STRENGTH
		return true
	
	if is_on_floor():
		if input.x != 0:
			anim.play("Run")
		else:
			if velocity.x in range(-run_bounds, run_bounds):	
				if Input.is_action_pressed("smile2"):
					anim.play("Smile")
				elif Input.is_action_pressed("victory2"):
					anim.play("Victory")
				else:
					anim.play("Idle")
			else:
				anim.play("Slide")
	else:
		
		if nextToWall():
			if velocity.y > 0:
				anim.play("WallSlide")
			if nextToRightWall():
				$Sprite.flip_h = false
			elif nextToLeftWall():
				$Sprite.flip_h = true
		else:
			if velocity.y < -jump_bounds:
				anim.play("Jump")
			elif velocity.y in range(-jump_bounds, jump_bounds):
				anim.play("Hangtime")
			else:
				anim.play("Fall")
			
	if anim.current_animation == "Run":
		anim.playback_speed = 0.5 + 2 * abs(velocity.x) / MAX_SPEED
	else:
		anim.playback_speed = 1
	

func nextToWall():
	return nextToRightWall() or nextToLeftWall()

func nextToRightWall():
	return $RightCast.is_colliding()

func nextToLeftWall():
	return $LeftCast.is_colliding()

#func jumped():
#	return Input.is_action_just_pressed("Jump")


func reset_scene():
	get_tree().reload_current_scene()
