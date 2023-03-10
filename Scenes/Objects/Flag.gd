extends Node2D

var active = false

func _ready():
	pass


func _on_Area2D_body_entered(body):
	
	if body.is_in_group("Player"):
		print("checkpoint activated")
		active = true
		$AnimationPlayer.play("active")
		$Particles2D.emitting = true
		Checkpoint.last_checkpoint = global_position
		print(Checkpoint.last_checkpoint)
