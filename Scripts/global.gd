extends Node

var ammo = 100
var current_weapon
var current_level = 1
var lives = 3

func _ready():
    current_weapon = "knife"

func _process(delta):
    if Input.is_action_just_pressed("knife"):
        current_weapon = "knife"
    elif Input.is_action_just_pressed("gun"):
        current_weapon = "gun"
    elif Input.is_action_just_pressed("minigun"):
        current_weapon = "minigun"
    elif Input.is_action_just_pressed("machinegun"):
        current_weapon = "machinegun"