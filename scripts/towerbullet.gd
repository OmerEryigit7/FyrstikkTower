extends CharacterBody2D

var target = null
var damage = null

var speed = 800
var direction = Vector2.ZERO

func _ready():
	look_at(target.global_position)

func _process(delta: float) -> void:
	direction = global_position.direction_to(target.global_position)
	
	position += direction * speed * delta
	
	_on_hit_target()

func _on_hit_target() -> void:
	if target:
		target.get_parent().get_parent().kill()
	queue_free()
