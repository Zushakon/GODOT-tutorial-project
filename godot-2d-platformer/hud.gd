extends CanvasLayer

#sets the label for the level to the current level
func level(num):
	$CurrentLevel.text = "Level: " + str(num)
	
#sets the label for the gems collected
func gems(num):
	$GemsLabel.text = "Gems: " + str(num)
