extends Node

signal reflect_ball(body)
signal reset_position(body)

const SCREEN_WIDTH: int = 640
const SCREEN_HEIGHT: int = 360

var rng: RandomNumberGenerator = RandomNumberGenerator.new()
