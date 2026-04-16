extends Control

var score = 0
var Coffee = 0





func _ready():
	update_score()


func _on_button_pressed():
	score += 1
	update_score()
	if score == 10:
		score = 0
		Coffee += 1
		$Coffee.text = "Coffee: " + str(Coffee)

func update_score():
	$Score.text = "Score: " + str(score)
	
