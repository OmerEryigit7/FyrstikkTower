extends StaticBody2D

var bullet = preload("res://TowerBullet.tscn")
var enemy = preload("res://Enemies/enemy_test.tscn")
var bulletDamage = 5
var pathName
var currTarget = []
var curr
var noe=false
var poss
func _on_tower_body_entered(body: Node2D) -> void:
	var prog = Global.prog
	
	print(prog)
	
func _on_tower_body_exited(body: Node2D) -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	poss = Global.prog
