extends Panel

@onready var tower = preload("res://Tower.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

var tile1
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_gui_input(event):
	var tempTower = tower.instantiate() 
	if event is InputEventMouseButton and event.button_mask == 1:
		add_child(tempTower)	
		tempTower.global_position = event.global_position
		tempTower.process_mode = Node.PROCESS_MODE_DISABLED
	elif event is InputEventMouseMotion and event.button_mask == 1:
		if get_child_count() > 1:
			get_child(1).global_position = event.global_position
			
	elif event is InputEventMouseButton and event.button_mask == 0:
		if event.global_position.x >= 2944:
			if get_child_count() > 1:
				get_child(1).quee_free()
		
	print(event)
