extends Node2D

export var catchphrase := "hello, i am but a humble snowfellow"
export var speak_prob := .3

var rng = RandomNumberGenerator.new() 


func _ready():
	$AnimationPlayer.play("idle")
	$RichTextLabel.bbcode_text = str("[wave]", catchphrase)


func _on_AnimationPlayer_animation_finished(anim_name):
	rng.randomize()
	var random_number = rng.randf()
	if random_number <= speak_prob:
		print("show")
		$RichTextLabel.visible = true
	else:
		print("hide")
		$RichTextLabel.visible = false
	
	$AnimationPlayer.play()
