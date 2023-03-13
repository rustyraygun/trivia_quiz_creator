extends Node2D

var speed: int = 3
var target: Vector2

func _physics_process(delta):
	target =  get_global_mouse_position()
	self.global_position = self.global_position.linear_interpolate(target, speed * delta)
	if self.global_position.distance_to(target) <= 150:
		self._explode()
		self.set_physics_process(false)




func _explode():
	$Sprite.hide()
	$CPUParticles2D.emitting = true
	$CPUParticles2D2.emitting = true
	print("explode!!!")
