extends Node

signal score_updated
signal bombs_updated

var current_score: int = 0;
var current_bombs: int = 0;

func add_score(num: int):
	current_score += num
	score_updated.emit(current_score)
func add_bomb(num: int):
	current_bombs += num
	bombs_updated.emit(current_bombs)
