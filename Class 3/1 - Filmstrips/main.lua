-- Class 3 Program 1
-- http://www.moosader.com/resources/tutorials/love-lua/1
-- (c) Rachel J. Morris, 2012
-- zlib license

player = {
	x = 400,
	y = 300,
	width = 32,
	height = 48,
	direction = 0,
	frame = 0,
	speed = 0.5
}
function player:Setup()
	self.image = love.graphics.newImage( "Ayne.png" )
	self.frameQuad = love.graphics.newQuad(
		0, 0, -- Current frame position
		self.width, self.height, -- Width/Height of a frame
		self.image:getWidth(), self.image:getHeight() -- Width/Height of entire image
	)
end

function player:GetInput()
	-- Direction based on the layout of the filmstrip
	if ( love.keyboard.isDown( "up" ) ) then
		self.direction = 1
		self.y = self.y - self.speed
	elseif ( love.keyboard.isDown( "down" ) ) then
		self.direction = 0
		self.y = self.y + self.speed
	elseif ( love.keyboard.isDown( "left" ) ) then
		self.direction = 2
		self.x = self.x - self.speed
	elseif ( love.keyboard.isDown( "right" ) ) then
		self.direction = 3
		self.x = self.x + self.speed
	end
end

function player:UpdateFrame()
	self.frame = self.frame + 0.01
	if ( self.frame >= 4 ) then
		self.frame = 0
	end
	
	self.frameQuad:setViewport(
		math.floor( self.frame ) * self.width, -- X coordinate on image
		self.direction * self.height, -- Y coordinate on image
		self.width,
		self.height
	)
end

function player:Draw()
	love.graphics.drawq( self.image, self.frameQuad, self.x, self.y )
end

function love.load()
	player:Setup()
end

function love.update()
	player:GetInput()
	player:UpdateFrame()
end

function love.draw()
	player:Draw()
end
