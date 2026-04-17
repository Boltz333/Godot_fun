extends Control

var bean = 0
var coffee = 0
var water = 0
var cupofcoffee = 0
var money = 0


func _on_button_pressed():
	bean += 1
	$bean.text = "Bean: " + str(bean)
	if bean == 10:
		bean = 0
		coffee += 1
		$coffee.text = "coffee: " + str(coffee)


func _on_timer_timeout():
	print("Water generated!")
	water += 1
	$water.text = "Water: " + str(water)
	_create_hot_coffee()

func _create_hot_coffee():
	while coffee >= 10 and water >= 2:
		coffee -= 10 
		water -= 2
		$water.text = "Water: " + str(water)
		cupofcoffee += 1
		print("completed")
		$cupofcoffee.text = "Cupofcoffee: " + str(cupofcoffee)

func _on_sell_coffee_pressed():
	if cupofcoffee >=1:
		cupofcoffee -= 1
		money += 1
		$cupofcoffee.text = "Cupofcoffee: " + str(cupofcoffee)
		$money.text = "Cash $: " + str(money)
