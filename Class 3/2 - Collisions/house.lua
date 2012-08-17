house = {
	x = 200,
	y = 200,
	width = 96,
	height = 128
}

function house:Setup()
	self.image = love.graphics.newImage( "House1.png" )
	self.width = self.image:getWidth()
	self.height = self.image:getHeight()
end

function house:Draw()
	love.graphics.draw( self.image, self.x, self.y )
end
