extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D
var test = 1
var prog
func _process(_delta):
	animated_sprite.play("default")
	#Global.prog = $"..".progress
	if Global.prog < $"..".progress:
		Global.prog = $"..".progress

func kill():
	queue_free()
