extends StaticBody2D

# Preload Bullet and Enemy scenes
var enemy = preload("res://Enemies/enemy_test.tscn")
var bullet = preload("res://TowerBullet.tscn")
var bullet_damage = 5
var target_enemy = null
var shoot_rate = 1.0  # Time between shots (1 second)
var shoot_timer = 0.0  # Timer to track shooting interval
var curr_targets = []
var path_name
# Range detection with Area2D (ensure this is added as a child of StaticBody2D)
@onready var detection_area = $Tower

func _ready():
	
	# Initialize variables if needed
	shoot_timer = shoot_rate

func _process(delta: float) -> void:
	# If there's a target, shoot at the enemy
	if target_enemy:
		shoot_timer -= delta
		if shoot_timer <= 0:
			shoot_at_enemy()
			shoot_timer = shoot_rate
			target_enemy = null

func shoot_at_enemy():
	var temp_bullet = bullet.instantiate()
	temp_bullet.target = target_enemy
	temp_bullet.damage = bullet_damage
	add_child(temp_bullet)

func _on_tower_area_entered(area: Area2D) -> void:
	if area.get_parent().is_in_group("enemy"):
		target_enemy = area

func _on_tower_area_exited(area: Area2D) -> void:
	pass
