extends CharacterBody2D

@export var bullet_scene: PackedScene = preload("res://Scenes/Bullet.tscn")  # Upewnij się, że ścieżka jest poprawna
var time_since_last_shot: float = 0.0  

func _process(delta):
	velocity = Vector2.ZERO

	if Input.is_action_pressed("ui_left"):
		velocity.x -= Global.player_speed
	if Input.is_action_pressed("ui_right"):
		velocity.x += Global.player_speed
	move_and_slide()
	time_since_last_shot += delta

	if Input.is_action_pressed("ui_select") and time_since_last_shot >= Global.fire_rate:
		shoot()
		time_since_last_shot = 0.0  


func shoot():
	print("Shooting!")  
	var bullet = bullet_scene.instantiate()
	bullet.position = position
	get_parent().add_child(bullet)
