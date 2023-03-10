extends Node2D

export var catchphrase := "tweet tweet"

export (String, "blue", "red", "orange", "green") var color := "blue"
export (String, "small", "big") var size := "small"

var anim
var anim_idle
var anim_tweet

var rng = RandomNumberGenerator.new() 

func _ready():
	anim = str(size, "_", color, "_")
	anim_idle = str(anim, "idle")
	anim_tweet = str(anim, "tweet")

	$AnimationPlayer.play(anim_idle)
	
	$RichTextLabel.bbcode_text = str("[wave amp=30]", catchphrase)


func _on_AnimationPlayer_animation_finished(anim_name):
	rng.randomize()
	var random_number = rng.randf_range(0, 100)
	if random_number <= 30:
		$AnimationPlayer.play(anim_tweet)
	else:
		$AnimationPlayer.play(anim_idle)
