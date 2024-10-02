extends Area2D

func _process(delta):
	position.y -= Global.bullet_speed * delta
	if position.y < -10:
		queue_free()
		
func _on_Bullet_body_entered(body: Node):
	if body.is_in_group("Enemies"):
		print("Bullet hit an enemy!")
		body.queue_free()
		queue_free()
