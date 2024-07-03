function ShoulderArm(s, c) constructor {
	creator = c
	side = s // left = -1, right = 1
	xPos = creator.x+32*side
	yPos = creator.y-32
	sprite = Spr_ShoulderArm
	angle = 0
	gotoAngle = 0
	
	static GetShoulderPositionX = function(){
		return creator.x+32*side
	}
	static GetShoulderPositionY = function(){
		return creator.y-32
	}
	
	static DrawArm = function() {
		draw_sprite_ext(sprite, 0, xPos, yPos, side, 1, gotoAngle, c_white, 1)
		//draw_text(xPos, yPos, side)
	}
}

function ForeArm(s, c) : ShoulderArm(s, c) constructor {
	distanceToPoint = sprite_get_width(sprite)/2
	static SetForearmPositions = function(sAngle) {
		var a = degtorad(sAngle)
		var xP = distanceToPoint*cos(a)*side; var yP = distanceToPoint*sin(a)*(-side)
		xP += GetShoulderPositionX(); yP += GetShoulderPositionY()

		xPos = xP
		yPos = yP
	}
	SetForearmPositions(angle)
	sprite = Spr_ForeArm
}

function FullArm(s, c) constructor {
	shoulderArm = new ShoulderArm(s, c)
	foreArm = new ForeArm(s, c)
	
	static DrawFullArm = function() {
		shoulderArm.DrawArm()
		foreArm.DrawArm()
	}
	static SetAngles = function(a1, a2) {
		shoulderArm.angle = a1
		foreArm.angle = a2
	}
	static SetPositions = function() {
		shoulderArm.xPos = shoulderArm.GetShoulderPositionX()
		shoulderArm.yPos = shoulderArm.GetShoulderPositionY()
		foreArm.SetForearmPositions(shoulderArm.gotoAngle)
	}
	static SetArm = function() {
		shoulderArm.gotoAngle += 3*sin(degtorad(shoulderArm.angle - shoulderArm.gotoAngle));
		foreArm.gotoAngle += 3*sin(degtorad(foreArm.angle - foreArm.gotoAngle))
		
		SetPositions()
	}
}