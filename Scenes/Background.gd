extends ParallaxBackground

export (String, FILE, "*.png") var bg_img := ""
onready var sprite = $ParallaxLayer/Sprite
onready var tween = $Tween


func _ready():
#	$ParallaxLayer/Sprite.texture = LevelManager.get_current_bg()
	sprite.modulate.a = 0.0
	yield(get_tree().create_timer(1), "timeout")
	
#	sprite.texture = load(bg_img)
#	var bg = LevelManager.backgrounds[LevelManager.current_level]
	sprite.texture = LevelManager.get_current_bg()
		
	tween.interpolate_property(
		sprite,
		"modulate:a",
		0.0,
		0.9,
		10.0,
		Tween.TRANS_LINEAR
	)
	tween.start()
