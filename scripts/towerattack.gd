extends StaticBody2D

var bullet = preload("res://TowerBullet.tscn")
var enemy = preload("res://Enemies/enemy_test.tscn")
var bulletDamage = 5
var pathName
var currTarget = []
var curr


func _on_tower_body_entered(body: Node2D) -> void:
	
	pass    

func _on_tower_body_exited(body: Node2D) -> void:
	pass # Replace with function body.
