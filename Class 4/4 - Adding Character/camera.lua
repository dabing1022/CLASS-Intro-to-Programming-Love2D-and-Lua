-- Class 4 Program 4
-- http://www.moosader.com/resources/tutorials/love-lua/1
-- (c) Rachel J. Morris, 2012
-- zlib license

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
    self.x = xCoord - self.width / 2
    self.y = yCoord - self.height / 2
end

function camera:CenterCameraOn( object )
    self.x = object.x + (object.width / 2) - (self.width / 2)
    self.y = object.y + (object.height / 2) - (self.height / 2)
end

function camera:CoordinateIsVisible( x, y )
    if ( x > self.x - 32 and
            x < self.x + self.width and
            y > self.y - 32 and
            y < self.y + self.height ) then
            return true
    end
    return false
end
