
require "collision"

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
		self:Move( 0, -self.speed )
	elseif ( love.keyboard.isDown( "down" ) ) then
		self.direction = 0
		self:Move( 0, self.speed )
	elseif ( love.keyboard.isDown( "left" ) ) then
		self.direction = 2
		self:Move( -self.speed, 0 )
	elseif ( love.keyboard.isDown( "right" ) ) then
		self.direction = 3
		self:Move( self.speed, 0 )
	end
end

function player:Move( xMovement, yMovement )
	-- Check collision first
	-- Create a "Dummy Player" to hold where the
	-- player would be if they moved, then check
	-- to see if that causes a collision. If not,
	-- move the player!
	dummyPlayer = {
		x = self.x,
		y = self.y,
		width = self.width,
		height = self.height
	}
	
	dummyPlayer.x = dummyPlayer.x + xMovement
	dummyPlayer.y = dummyPlayer.y + yMovement
	
	if ( Collision( dummyPlayer, house ) == false ) then
		player.x = dummyPlayer.x
		player.y = dummyPlayer.y
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