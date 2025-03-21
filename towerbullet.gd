extends CharacterBody2D

var speed = 400  # Bullet speed
var direction = Vector2.ZERO  # Direction the bullet will travel

# Called every frame to update bullet position
func _process(delta: float) -> void:
	if direction != Vector2.ZERO:
		position += direction * speed * delta
		
		# Check if the bullet hits the target (simple collision check)
