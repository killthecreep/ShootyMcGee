extends CanvasLayer

func _ready() -> void:
	ScoreManager.score_updated.connect(_update_score)
	
	
func _update_score(new_score: int):
	$Label.text = "Score: " + str(new_score) 

func _update_bombs(bomb_count: int):
	$Bombs.text = str(bomb_count)

var score = 0
