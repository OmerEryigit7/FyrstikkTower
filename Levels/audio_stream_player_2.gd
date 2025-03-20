extends AudioStreamPlayer

func _ready():
	play_sound()
	
func play_sound():
	if defines.remaining_enemy > 1:
		get_node("%AudioStreamPlayer2").play()
