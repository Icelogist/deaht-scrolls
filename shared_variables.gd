extends Node

# Player Variables

var set_lives:int = 3
var death_timer:int
var lives:int
var player_death:bool = false

# Level Variables

var spawn_location:Vector2 = Vector2(0, 0)
var level_id:int = 0
var test_level_location:String = "null"
var levelnames = ["Test Level", "First Scroll", "Leaps of Faht", "Monkey Bars", "Amaze", "Tramp Fest"]
var minlevels:int = 0
var maxlevels:int = 5

# Stat Variables

var livesdestroyed:int = 0
var timesdied:int = 0
var livescollected:int = 0
var livescollectedmax:int = 0
var time:String

# Ui Variables

var KeyHideList:bool = false
