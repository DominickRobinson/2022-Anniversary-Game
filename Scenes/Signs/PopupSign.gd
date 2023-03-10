extends Node2D


export (Array, String) var description := ["test"]
export (Array, String, FILE) var image := ["Pictures/Valley Wallpaper.jpg"]

var current = 0

var scanning = false
var active = false

onready var picture = $Control/Picture
onready var left = $Control/GoLeft
onready var right = $Control/GoRight

func _ready():
	$Control.visible = false
	prep()

func _physics_process(delta):
	if scanning:
		#if Input.is_action_just_pressed("read_sign"):
		$Control.visible = !$Control.visible
		scanning = false
	
	if $Control.visible:
		if Input.is_action_just_pressed("read_sign"):
			current += 1
			if current == image.size():
				current = 0
			prep()


func prep():
	$Control/Label.text = description[current]
	picture.texture = load(image[current])


func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		scanning = true
			


func _on_Area2D_body_exited(body):
	if body.is_in_group("Player"):
		scanning = false
		$Control.visible = false

