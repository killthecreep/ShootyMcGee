extends CanvasLayer

#signal score_updated
#signal bombs_updated

func _ready() -> void:
	ScoreManager.score_updated.connect(_update_score)
	ScoreManager.bombs_updated.connect(_update_bombs)
	ScoreManager.decrease_health.connect(_decrease_Health)
	
func _update_score(new_score: int):
	$Label.text = "Score: " + str(new_score) 

func _update_bombs(bomb_count: int):
	$Bombs.text = "Bombs: " + str(bomb_count)
	print("Attempting Bomb change")

var score = 0

@export var hearts : Array[Node]

var current_score: int = 0;
var current_bombs: int = 0;
#var lives = 3

func _decrease_Health(lives: int):
	print("Testing Health")
	print(lives)
	for h in range(3):
		if (h < lives):
			hearts[h].show()
		else:
			hearts[h].hide()
	#if(lives == 0 || lives < 0):
		#lives = 3
		#get_tree().reload_current_scene()
#
#
#func add_score(num: int):
	#current_score += num
	#score_updated.emit(current_score)
	#
#func add_bomb(num: int):
	#print("running")
	#current_bombs += num
	#bombs_updated.emit(current_bombs)
