extends Path2D

var enemy_angryteacher = 5 #wave 1
var enemy_smallteacher = 3 #wave 1

@export var enemy_angryteacher_scene: PackedScene #enemy_scene er definert inne i inspektøren
@export var enemy_smallteacher_scene: PackedScene

func _ready():
	defines.wave = 1
	defines.health = 100
	defines.money = 100
	defines.remaining_enemy += enemy_angryteacher 
	spawn()

func spawn():
	if enemy_angryteacher_scene: #Hvis enemy_scene finnes
		if defines.wave < 6:
			
			if defines.wave == 2:
				defines.remaining_enemy = 0 + enemy_angryteacher
				enemy_angryteacher = 7
				enemy_smallteacher = 4
				get_node("%AudioStreamPlayer2").play_sound()
				
			elif defines.wave == 3: 
				defines.remaining_enemy = 0 + enemy_angryteacher + enemy_smallteacher
				enemy_angryteacher = 7
				enemy_smallteacher = 5
				get_node("%AudioStreamPlayer2").play_sound()

				
			elif defines.wave == 4: 
				defines.remaining_enemy = 0 + enemy_angryteacher + enemy_smallteacher
				enemy_angryteacher = 7
				enemy_smallteacher = 6
				get_node("%AudioStreamPlayer2").play_sound()

				
			elif defines.wave == 5: 
				defines.remaining_enemy = 0 + enemy_angryteacher + enemy_smallteacher
				enemy_angryteacher = 7
				enemy_smallteacher = 7
				get_node("%AudioStreamPlayer2").play_sound()

				
			for i in range(enemy_angryteacher):
				await get_tree().create_timer(0.85).timeout #1 sek pause mellom hvert spawn
				var enemy = enemy_angryteacher_scene.instantiate() #Enemy er en ny forekomst av enemyTest scenen
				add_child(enemy) #Legg til enemy som en child
				enemy.progress = 0 #Enemy starter fra 0 på path2d
				
			for i in range(enemy_smallteacher):
				await get_tree().create_timer(0.5).timeout #1 sek pause mellom hvert spawn
				var enemy = enemy_smallteacher_scene.instantiate() #Enemy er en ny forekomst av enemyTest scenen
				add_child(enemy) #Legg til enemy som en child
				enemy.progress = 0 #Enemy starter fra 0 på path2d
		if defines.wave > 5:
			get_tree().change_scene_to_file("res://Levels/game_won.tscn")
