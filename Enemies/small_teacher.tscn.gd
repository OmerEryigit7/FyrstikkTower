extends PathFollow2D
var speed = 350

var enemyHealth = 1
func _process(delta):
	progress += speed * delta

	if progress_ratio >= 0.99:
		defines.health -= 5
		defines.remaining_enemy -= 1
		get_node("/root/Main/Label").text = str(defines.health)
		
		if defines.health <=0:
			get_node("/root/Main/Label").text = "Game over!"
			get_tree().change_scene_to_file("res://Levels/game_over.tscn")
			
		queue_free()
		
		if defines.remaining_enemy == 0:
			defines.wave += 1
			get_node("/root/Main/Path2D").spawn()
			get_node("/root/Main/Label2").updatelabel()
