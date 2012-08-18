-- Class 3 Program 4
-- http://www.moosader.com/resources/tutorials/love-lua/1
-- (c) Rachel J. Morris, 2012
-- zlib license

require "collision"
require "camera"

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
	speed = 2,
    sword = {
        x = 0,
        y = 0,
        width = 32,
        height = 32,
        speed = 10,
        direction = 0,
        maxLifetime = 100,
        life = 0
    }
}

function player:Setup()
    -- Ayne Graphics
	self.image = love.graphics.newImage( "Images/Ayne.png" )
	self.frameQuad = love.graphics.newQuad(
		0, 0, -- Current frame position
		self.width, self.height, -- Width/Height of a frame
		self.image:getWidth(), self.image:getHeight() -- Width/Height of entire image
	)
    
    -- Sword Graphics
    self.sword.image = love.graphics.newImage( "Images/Sword.png" )
    self.sword.frameQuad = love.graphics.newQuad(
        0, 0, -- Current frame position
        self.sword.width, self.sword.height,
        self.sword.image:getWidth(), self.sword.image:getHeight()
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
    
    if ( love.keyboard.isDown( " " ) ) then
        -- Attack!
        self:ThrowSword()
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
	if ( MapCollision( dummyPlayer ) == false ) then
		self.x = dummyPlayer.x
		self.y = dummyPlayer.y
        self:UpdateFrame()
        self:UpdateSword()
    else
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

function player:UpdateSword()
    if ( self.sword.life > 0 ) then
        if ( self.sword.direction == 0 ) then           -- down
            self.sword.y = self.sword.y + self.sword.speed
        elseif ( self.sword.direction == 1 ) then   -- up
            self.sword.y = self.sword.y - self.sword.speed
        elseif ( self.sword.direction == 2 ) then   -- left
            self.sword.x = self.sword.x - self.sword.speed
        elseif ( self.sword.direction == 3 ) then   -- right
            self.sword.x = self.sword.x + self.sword.speed
        end
        
        self.sword.life = self.sword.life - 1
    
        self.sword.frameQuad:setViewport(
            0, -- X coordinate on image
            self.sword.direction * self.sword.height, -- Y coordinate on image
            self.sword.width,
            self.sword.height
        )
    end
end

function player:Draw()
	love.graphics.drawq( self.image, self.frameQuad, self.x - camera.x, self.y - camera.y )
    if ( self.sword.life > 0 ) then
        love.graphics.drawq( self.sword.image, self.sword.frameQuad, self.sword.x - camera.x, self.sword.y - camera.y )
    end
end

function player:ThrowSword()
    if ( self.sword.life <= 0 ) then
        self.sword.direction = self.direction
        self.sword.x = self.x
        self.sword.y = self.y
        self.sword.life = self.sword.maxLifetime
    end
end
