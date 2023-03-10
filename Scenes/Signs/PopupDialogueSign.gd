extends Node2D

export var description := ""

var scanning = false

onready var label = $Control/Label

func _ready():
	label.text = description
	$Control.visible = false


func _physics_process(delta):
	if scanning:
		#if Input.is_action_just_pressed("read_sign"):
		$Control.visible = !$Control.visible
		scanning = false

func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		scanning = true
			


func _on_Area2D_body_exited(body):
	if body.is_in_group("Player"):
		scanning = false
		$Control.visible = false
