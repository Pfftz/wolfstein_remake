extends CharacterBody3D

@onready var player : CharacterBody3D = get_tree().get_first_node_in_group("player")

const SPEED = 5.0
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var dead = false
var is_attacking = false
var attack_range = 5

func _ready():
    add_to_group("enemy")

func _physics_process(delta):
    if dead:
        return

    if player == null:
        return

    # Apply gravity regardless of state
    if not is_on_floor():
        velocity.y -= gravity * delta

    # Only move towards player if not attacking
    if not is_attacking:
        var dir = player.global_position - global_position
        dir.y = 0.8
        dir = dir.normalized()
        velocity.x = dir.x * SPEED
        velocity.z = dir.z * SPEED
    else:
        # Stop horizontal movement during attack
        velocity.x = 0
        velocity.z = 0
    
    move_and_slide()
    
    if not is_attacking:
        attack()

func attack():
    var dist_to_player = global_position.distance_to(player.global_position)
    if dist_to_player > attack_range:
        return
    else:
        is_attacking = true
        $AnimatedSprite3D.play("shoot")
        await $AnimatedSprite3D.animation_finished
        is_attacking = false

func die():
    dead = true
    $AnimatedSprite3D.play("die")
    await $AnimatedSprite3D.animation_finished
    queue_free()