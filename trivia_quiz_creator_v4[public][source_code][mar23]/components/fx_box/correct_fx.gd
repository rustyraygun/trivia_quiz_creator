extends Node2D
export(PackedScene) var ball_follower
onready var points_box = $points_box
onready var follower = get_node("Sprite")
var speed: int = 3
var target: Vector2

func _ready():
	create_followers(1)
	
func _physics_process(delta):
	target =  get_global_mouse_position()
	follower.global_position = follower.global_position.linear_interpolate(target, speed * delta)
	if follower.global_position.x < target.x:
		follower.flip_h = false
	else:
		follower.flip_h = true



func create_followers(count: int):
	#add #followers[count] to each points box position 2d
	for i in count:
		for _i in points_box.get_children():
			var new_follower = ball_follower.instance()
			self.add_child(new_follower)
			new_follower.global_position = _i.global_position
			new_follower.speed = round(rand_range(2,4))
	
