extends CharacterBody2D
var hot_potato : bool = false
const SPEED : float = 300.0
const JUMP_VELOCITY : float = -600.0
@onready var sprite_2d : Sprite2D = $Sprite2D
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@export var E1 : int = 0
@export var E2 : int = 0
@export var E3 : int = 0
@onready var e_1_texture = $"../CanvasLayer/Panel/Element_Container/E1"
@onready var e_2_texture = $"../CanvasLayer/Panel/Element_Container/E2"
@onready var e_3_texture = $"../CanvasLayer/Panel/Element_Container/E3"
var earth_platform = preload("res://Scenes/earth_platform.tscn")
var wood_spear = preload("res://Scenes/wood_spear.tscn")
@onready var scene_nodes := $".."
var slip : bool = false
const acc: int = 10
var input_suspend : bool = false
@onready var color_rect = $"../CanvasLayer/Panel/Element_Container/E1/ColorRect"
@onready var fire_shader : ShaderMaterial = color_rect.material as ShaderMaterial
var i : float;
var cinematic_mode : bool
var potential: float
@onready var fire_covered : bool = false
var water_covered : bool = false
@onready var main_guy = $"."
var dash : bool = false
var earth_dampened : bool = false
var air_dampened : bool = false
var fire_dampened : bool = false
var water_dampened : bool = false
signal move_hydro
signal earth_convey

func _ready():
	color_rect.visible = false
	
func _process(delta):
	if(cinematic_mode == true):
		e_1_texture.visible = false
		e_2_texture.visible = false
		e_3_texture.visible = false
	else:
		e_1_texture.visible = true
		e_2_texture.visible = true
		e_3_texture.visible = true
	if(Input.is_action_just_pressed("Fire") and cinematic_mode == false && fire_dampened == false):
		if(E1 == 0):
			E1 = 1
			i= 0.0
			color_rect.visible = true
			#e_1_texture.texture = preload("res://assets/future_fire.png")
			while(i < 0.45):
				fire_shader.set_shader_parameter("burn_amt", i)
				await get_tree().create_timer(0.05).timeout
				i += 0.05
		elif(E2 == 0):
			E2 = 1
			e_2_texture.texture = preload("res://assets/fire_temp.png")
		elif(E3 == 0):
			E3 = 1
			e_3_texture.texture = preload("res://assets/fire_temp.png")
	if(Input.is_action_just_pressed("Water") and cinematic_mode == false && water_dampened == false):
		if(E1 == 0):
			E1 = 2
			e_1_texture.texture = preload("res://assets/water_temp.png")
		elif(E2 == 0):
			E2 = 2
			e_2_texture.texture = preload("res://assets/water_temp.png")
		elif(E3 == 0):
			E3 = 2
			e_3_texture.texture = preload("res://assets/water_temp.png")
	if(Input.is_action_just_pressed("Air") and cinematic_mode == false && air_dampened == false):
		if(E1 == 0):
			E1 = 3
			e_1_texture.texture = preload("res://assets/air.png")
		elif(E2 == 0):
			E2 = 3
			e_2_texture.texture = preload("res://assets/air.png")
		elif(E3 == 0):
			E3 = 3
			e_3_texture.texture = preload("res://assets/air.png")
	if(Input.is_action_just_pressed("Earth") and cinematic_mode == false && earth_dampened == false):
		if(E1 == 0):
			E1 = 4
			e_1_texture.texture = preload("res://assets/earth_temp.png")
		elif(E2 == 0):
			E2 = 4
			e_2_texture.texture = preload("res://assets/earth_temp.png")
		elif(E3 == 0):
			E3 = 4
			e_3_texture.texture = preload("res://assets/earth_temp.png")
	if(Input.is_action_just_pressed("Cast") and cinematic_mode == false):
		color_rect.visible = false
		e_1_texture.texture = preload("res://assets/empty_E.png")
		e_2_texture.texture = preload("res://assets/empty_E.png")
		e_3_texture.texture = preload("res://assets/empty_E.png")
		cast_master()
	if(Input.is_action_just_pressed("Left")):
		sprite_2d.flip_h = true
	elif(Input.is_action_just_pressed("Right")):
		sprite_2d.flip_h = false

func cast_master():
	if(E1 == 1 && E2 == 0 && E3 == 0):
		E1 = 0
		input_suspend = true
		fire_covered = true
		hot_potato = true
		await get_tree().create_timer(3.0).timeout
		input_suspend = false
		hot_potato = false
		fire_covered = false
	elif(E1 == 4 && E2 == 0 && E3 == 0):
		E1 = 0
		emit_signal("earth_convey")
		var earth_platform_temp = earth_platform.instantiate()
		earth_platform_temp.spawn_position.x = position.x
		earth_platform_temp.spawn_position.y = position.y + 50
		scene_nodes.add_child(earth_platform_temp)
		await get_tree().create_timer(1.0).timeout
		earth_platform_temp.queue_free()
	elif(E1 == 1 && E2 == 3 && E3 == 0):
		E1 = 0
		E2 = 0
		velocity.y = JUMP_VELOCITY * 1.5
	elif(E1 == 4 && E2 == 2 && E3 == 3):
		E1 = 0 
		E2 = 0 
		E3 = 0
		var wood_spear_temp = wood_spear.instantiate()
		wood_spear_temp.spawnpos = position
		if sprite_2d.flip_h == false:
			wood_spear_temp.direction = 1
		else:
			wood_spear_temp.direction = -1
		scene_nodes.add_child(wood_spear_temp)
	elif(E1 == 2 && E2 == 0 && E3 == 0 and water_covered == false):
		E1=0
		E2=0
		E3=0
		water_covered = true
		slip = true
		input_suspend  = true
		print(water_covered)
		await get_tree().create_timer(3.0).timeout
		water_covered = false
		input_suspend = false
		slip = false
	elif(E1 == 3 && E2 == 0 && E3 == 0):
		E1=0
		E2=0
		E3=0
		if(sprite_2d.flip_h == true):
			input_suspend = true
			dash = true
			velocity.x = 2500 * -1
			await get_tree().create_timer(0.1).timeout
			dash = false
			input_suspend = false
		elif(sprite_2d.flip_h == false):
			input_suspend = true
			dash = true
			velocity.x = 2500
			await get_tree().create_timer(0.1).timeout
			dash = false
			input_suspend = false
	else:
		print("nah")
		E1=0
		E2=0
		E3=0
	pass
	if(velocity.x == 0):
		potential = 0

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor() and dash == false:
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_pressed("ui_accept") and is_on_floor() and cinematic_mode == false:
		velocity.y = JUMP_VELOCITY 
	if Input.is_action_just_released("ui_accept") and velocity.y < 0:
		velocity.y *= 0.1

	var direction = Input.get_axis("Left", "Right")
	if(slip == false):
		if(hot_potato == false):
			if direction and input_suspend == false:
				velocity.x = SPEED * direction
				potential = velocity.x * 0.03
			else:
				velocity.x = move_toward(velocity.x, 0, SPEED)
		else:
			if(sprite_2d.flip_h == false):
				velocity.x = move_toward(velocity.x, SPEED * 1.8, SPEED)
			else:
				velocity.x = move_toward(velocity.x, SPEED * 1.8 * -1, SPEED)
	else:
		if direction == 1:
			velocity.x = min(velocity.x + acc , 500)
		elif(direction == -1):
			velocity.x = max(velocity.x - acc , -500)
		else:
			velocity.x = move_toward(velocity.x , 0 , 4)
	if(Input.is_action_pressed("Crouch") and velocity.x != 0):
		velocity.x = move_toward(velocity.x , 0 , potential)
		
	move_and_slide()

func _on_fire_wall_body_entered(body):
	if (body == main_guy and fire_covered == false):
		get_tree().reload_current_scene()


func _on_hydro_plant_platform_hydro_mover():
	if water_covered == true:
		print("yes")
		emit_signal("move_hydro")
