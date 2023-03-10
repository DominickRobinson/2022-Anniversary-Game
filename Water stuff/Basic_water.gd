extends Node2D

export var SWIM_FORCE := -80

var og_swim

func _ready():
	pass # Replace with function body.


func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		og_swim = body.SWIM_FORCE
		body.SWIM_FORCE = SWIM_FORCE
		body.is_swimming = true


func _on_Area2D_body_exited(body):
	if body.is_in_group("Player"):
		body.is_swimming = false
		body.SWIM_FORCE = og_swim
