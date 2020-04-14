extends KinematicBody

# stats
var curHp: int = 10
var maxHp: int = 10
var ammo: int = 15
var score: int = 0

# physics
var moveSpeed: float = 5.0
var jumpForce: float = 5.0
var gravity: float = 12.0

# cam look
var minLookAngle: float = -90.0
var maxLookAngle: float = 90.0
var lookSensitivity: float = 10.0

# vectors
var vel: Vector3 = Vector3()
var mouseDelta: Vector2 = Vector2()

# components
onready var camera: Camera = get_node('Camera')
onready var muzzle: Spatial = get_node('Camera/GunModel/Muzzle')


func _physics_process(delta):
  # reset x and z velocity
  vel.x = 0
  vel.z = 0

  var input = Vector2()

  # movement inputs
  if Input.action_press("move_forward"):
    input.y -= 1
  if Input.is_action_pressed('move_backward'):
    input.y += 1
  if Input.is_action_pressed('move_left'):
    input.x -= 1
  if Input.is_action_pressed('move_right'):
    input.x += 1

  input = input.normalized()

  var forward = global_transform.basis.z
  var right = global_transform.basis.x
