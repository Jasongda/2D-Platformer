extends Area2D

var rotate_speed : float = 3.0
var bob_height : float = 5.0
var bob_speed : float = 5.0

@onready var start_pos : Vector2 = global_position

@onready var sprite : Sprite2D = $Sprite

func _physics_process(_delta):
	var _time = Time.get_unix_time_from_system()
	
	
	sprite.scale.x = sin(_time * rotate_speed)
	
	
	var _y_pos = ((1 + sin(_time * bob_speed)) / 2) * bob_height
	global_position.y = start_pos.y - _y_pos

func _on_body_entered(body):
	if not body.is_in_group("player"):
		return
	body._increase_score(1)
	queue_free()
