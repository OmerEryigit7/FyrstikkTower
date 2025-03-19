extends Button

func _on_pressed():
	var node = get_node("/root/Main")
	for child in node.get_children():
		if child.name.begins_with("Path2"):
			child.spawn()
			return  
