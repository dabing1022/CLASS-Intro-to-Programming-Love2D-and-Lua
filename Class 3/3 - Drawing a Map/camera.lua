camera = { 
	x = 0,
	y = 0,
    width = 800, -- screen res
    height = 600
}

function camera:MoveCamera( xAmount, yAmount )
    self.x = self.x + xAmount
    self.y = self.y + yAmount
end

function camera:CenterCameraAt( xCoord, yCoord )
end

function camera:CenterCameraOn( object )
end
