extends Control


var score_bean = 0
var bean_value = 1
var coffee = 0
var water = 0
var hotcoffee = 0
var money = 0
var boiler_busy = false
var grinder = false

func _on_button_pressed():
	score_bean += bean_value
	$bean.text = "Bean: " + str(score_bean)
	if score_bean >= 10 and water >= 2:
		score_bean -= 10
		water -= 2
		coffee += 1
		$bean.text = "Bean: " + str(score_bean)
		$water.text = "Water: " + str(water)
		$coffee.text = "Coffee: " + str(coffee)


func _on_timer_timeout():
	water += 1
	$water.text = "Water: " + str(water)


func _on_sell_coffee_pressed():
	if hotcoffee >= 1:
		hotcoffee -= 1
		money += 5
		$hotcoffee.text = "Hotcoffee: " + str(hotcoffee)
		$money.text = "Cash $: " + str(money)
	if coffee >= 1:
		coffee -= 1
		money += 1
		$coffee.text = "coffee: " + str(coffee)
		$money.text = "Cash $: " + str(money)


func _on_upgrade_water_pressed() -> void:
	if money >= 5:
		money -= 5
		$Timer.wait_time = max(0.5, $Timer.wait_time * 0.8)
		$Timer.stop()
		$Timer.start()
		$money.text = "Cash $: " + str(money)


func _on_upgrade_bean_pressed() -> void:
	if money >= 10:
		money -= 10
		bean_value += 1
		$money.text = "Cash $: " + str(money)


func start_boiler() -> void:
	if coffee >= 1 and not boiler_busy:
		coffee -= 1
		boiler_busy = true
		$coffee.text = "Coffee: " + str(coffee)
		$boiler_timer.wait_time = 20
		$boiler_timer.start()


func _on_boiler_timer_timeout():
	hotcoffee += 1
	boiler_busy = false
	$hotcoffee.text = "Hotcoffee: " + str(hotcoffee)
	if coffee >= 1:
		start_boiler()


func _on_buy_grinder_pressed():
	if money >= 10 and not grinder:
		money -= 10
		grinder = true
		$money.text = "Cash $: " + str(money)
		$grinder_timer.wait_time = 5
		$grinder_timer.start()
		

func _on_grinder_timer_timeout():
	if grinder:
		score_bean += 1
		$bean.text = "Bean: " + str(score_bean)
		$grinder_timer.start()
	else:
		$grinder_timer.stop()
		
