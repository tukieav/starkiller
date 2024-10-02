extends Node2D

@export var enemy_scene: PackedScene = preload("res://Scenes/Enemy.tscn") 
@export var screen_width: float = 1440.0
@export var screen_height: float = 2560.0  

var spawn_timer: Timer

func _ready():
	spawn_timer = Timer.new()
	spawn_timer.wait_time = Global.spawn_interval
	spawn_timer.autostart = true
	spawn_timer.connect("timeout", Callable(self, "_on_spawn_timer_timeout"))
	add_child(spawn_timer)

func _on_spawn_timer_timeout():
	var enemy_instance = enemy_scene.instantiate()
	
	var random_x = randf_range(0, screen_width)  
	enemy_instance.position = Vector2(random_x, 0)  
	add_child(enemy_instance)
