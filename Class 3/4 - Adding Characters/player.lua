-- Class 3 Program 4
-- http://www.moosader.com/resources/tutorials/love-lua/1
-- (c) Rachel J. Morris, 2012
-- zlib license

require "collision"

viewOffset = { 
	x = 0,
	y = 0
}

player = {
	x = 200,
	y = 300,
	width = 32,
	height = 48,
	direction = 0,
	frame = 0,
	speed = 1
}
function player:Setup()
	self.image = love.graphics.newImage( "Images/Ayne.png" )
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
	
    -- Check collision between tiles on map
	if ( MapCollision( self ) == false ) then
		self.x = dummyPlayer.x
		self.y = dummyPlayer.y
        self:UpdateFrame()
        UpdateScreenOffset()
	end
end

function player:UpdateFrame()
	self.frame = self.frame + 0.1
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
	love.graphics.drawq( self.image, self.frameQuad, self.x - viewOffset.x, self.y - viewOffset.y )
end

function UpdateScreenOffset()
    -- Player should be in the center of the screen
    viewOffset.x = player.x + (player.width / 2) - (love.graphics.getWidth() / 2)
    viewOffset.y = player.y + (player.height / 2) - (love.graphics.getHeight() / 2)
end
