function ShoulderArm(s) constructor {
	xPos = x+32
	yPos = y+32
	sprite = Spr_Arm
	side = s // left = -1, right = 1
	angle = 90 - 90*side
	
	static GetShoulderPositionX = function(){
		return x+32
	}
	static GetShoulderPositionY = function(){
		return y+32
	}
	
	static DrawArm = function() {
		draw_sprite_ext(sprite, 0, xPos, yPos, side, 1, angle, c_white, 1)
	}
}

function ForeArm(s) : ShoulderArm(s) constructor {
	distanceToPoint = sprite_get_width(sprite)/2
	static GetForearmPositions = function(sAngle) {
		var a = degtorad(sAngle); var xP = distanceToPoint*cos(a); var yP = distanceToPoint*sin(a)
		xP += GetShoulderPositionX(); yP += GetShoulderPositionY()

		xPos = xP
		yPos = yP
	}
	GetForearmPositions(angle)
	sprite = Spr_Arm
}

function FullArm(s) constructor {
	shoulderArm = ShoulderArm(s)
	foreArm = ForeArm(s)
	
	static DrawFullArm = function() {
		shoulderArm.DrawArm()
		foreArm.DrawArm()
	}
}