extends Panel

@onready var tower = preload("res://Tower.tscn")
func _ready() -> void:
	var parentnode = get_parent()


var tile1
var isPlacingTower = false
var tempTower
@onready var parentnode = get_node("/root/Main/Label")


func _process(delta: float) -> void:
	pass

func _on_gui_input(event):
	if event is InputEventMouseButton and event.button_mask == 1 and not isPlacingTower:
		if defines.money >= 30:
			tempTower = tower.instantiate() 
			parentnode.add_child(tempTower)
			tempTower.global_position = get_viewport().get_mouse_position()
			tempTower.process_mode = Node.PROCESS_MODE_DISABLED
			defines.money -= 30
			get_node("/root/Main/Label3").updatelabel()
			isPlacingTower = true
		
func _input(event):
	if isPlacingTower:
			tempTower.global_position = get_viewport().get_mouse_position()
	if event is InputEventMouseButton:
		if isPlacingTower:
			tempTower.global_position = get_viewport().get_mouse_position()
			if event.button_mask == 0 and isPlacingTower:
				if tempTower:
					tempTower.process_mode = Node.PROCESS_MODE_ALWAYS
					isPlacingTower = false
					tempTower = null
					if get_child_count() > 1:
						get_child(1).global_position = event.global_position
