extends Label

func _ready():
	text = "Wave" + str(defines.wave)

func updatelabel():
	text = "Wave" + str(defines.wave)
