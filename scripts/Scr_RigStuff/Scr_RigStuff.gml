function ShoulderArm(s, c) constructor {
	creator = c
	side = s // left = -1, right = 1
	xPos = creator.x+32*side
	yPos = creator.y+32*side
	sprite = Spr_Arm
	angle = 90 - 90*side
	
	static GetShoulderPositionX = function(){
		return creator.x+32*side
	}
	static GetShoulderPositionY = function(){
		return creator.y+32*side
	}
	
	static DrawArm = function() {
		draw_sprite_ext(sprite, 0, xPos, yPos, side, 1, angle, c_white, 1)
	}
}

function ForeArm(s, c) : ShoulderArm(s, c) constructor {
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

function FullArm(s, c) constructor {
	shoulderArm = new ShoulderArm(s, c)
	foreArm = new ForeArm(s, c)
	
	static DrawFullArm = function() {
		shoulderArm.DrawArm()
		foreArm.DrawArm()
	}
}