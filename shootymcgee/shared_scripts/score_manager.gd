extends Panel

signal score_updated
signal bombs_updated

signal decrease_health

@export var hearts : Array[Node]


var current_score: int = 0;
var current_bombs: int = 0;
var current_lives: = 3

	

func decrease_Health():
	print("Testing Health")
	current_lives -= 1
	print(current_lives)
	decrease_health.emit(current_lives)
	#for h in range(3):
		#if (h < lives):
			#hearts[h].show()
		#else:
			#hearts[h].hide()
	if(current_lives == 0 || current_lives < 0):
		current_lives = 3
		get_tree().change_scene_to_file("res://game_over.tscn")


func add_score(num: int):
	current_score += num
	score_updated.emit(current_score)
	
func add_bomb(num: int):
	print("running")
	current_bombs += num
	bombs_updated.emit(current_bombs)
	
#func decrease_Health():
	#print("Testing Health")
	#lives -= 1
	#print(lives)
#
	## Ensure that the hearts array has the expected number of elements
	#if hearts.size() < 3:
		#print("Error: Not enough heart elements in array")
	#return
#
	## Iterate over the hearts array safely
	#for h in range(hearts.size()):
		#if h < lives:
			#hearts[h].show()
		#else:
			#hearts[h].hide()
#
	## Handle zero or negative lives
	#if lives <= 0:
		#lives = 3
		#get_tree().reload_current_scene()
