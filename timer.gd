extends Node2D

@onready var timer: Label = $timer

var time: float = 0.0

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	timer.text = str(snapped(time, 0.1))

func start_timer(start_time: float) -> void:
	time = start_time

	while time > 0.0:
		await wait(0.1)
		time -= 0.1

	time = 0.0

func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout
