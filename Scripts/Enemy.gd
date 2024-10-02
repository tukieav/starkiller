extends Area2D

func _process(delta):
	position.y += Global.enemy_speed * delta
	if position.y > 600:
		queue_free()

# Funkcja wykrywania kolizji z pociskiem gracza
func _on_Enemy_body_entered(body):
	# Sprawdź, czy obiekt, z którym nastąpiła kolizja, jest pociskiem gracza
	if body.is_in_group("PlayerBullets"):
		print("Enemy hit by bullet!")  # Komunikat debugowy
		body.queue_free()  # Usuwa pocisk po kolizji
		queue_free()  # Usuwa wroga po kolizji
