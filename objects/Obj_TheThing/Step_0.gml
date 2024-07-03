for(var i = 0; i < array_length(poses); i++) {
//for(var i = 0; i < 8; i++) {
	if keyboard_check_pressed(ord(string(i))) {
		rightArm.SetAngles(poses[i][0], poses[i][1])
		leftArm.SetAngles(-poses[i][2], -poses[i][3])
		//rightArm.SetAngles(45*i, 45*i)
		//leftArm.SetAngles(45*i, 45*i)
	}
}

rightArm.SetArm()
leftArm.SetArm()
