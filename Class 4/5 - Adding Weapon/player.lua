-- Class 3 Program 4
-- http://www.moosader.com/resources/tutorials/love-lua/1
-- (c) Rachel J. Morris, 2012
-- zlib license

require "collisionObject"
require "animatedSprite"
require "camera"

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
		frame = 0,
        width = 32,
        height = 32,
        speed = 10,
        direction = 0,
        maxLifetime = 100,
        life = 0
    }
}

function player:Setup()
	LoadAnimatedSprite( self, "Images/Ayne.png" )
	LoadCollidableObject( self, "feet" )
	
	LoadAnimatedSprite( self.sword, "Images/Sword.png" )
	LoadCollidableObject( self.sword, "full" )
	
	-- Sword and player shouldn't collide
	SetDoesntCollideWith( self.sword, self )
end

function player:GetInput()
	-- Direction based on the layout of the filmstrip
	if ( love.keyboard.isDown( "up" ) ) then
		MoveCollidableObject( self, "north" )
		UpdateAnimatedSprite( self )
		
	elseif ( love.keyboard.isDown( "down" ) ) then
		MoveCollidableObject( self, "south" )
		UpdateAnimatedSprite( self )
		
	elseif ( love.keyboard.isDown( "left" ) ) then
		MoveCollidableObject( self, "west" )
		UpdateAnimatedSprite( self )
		
	elseif ( love.keyboard.isDown( "right" ) ) then
		MoveCollidableObject( self, "east" )
		UpdateAnimatedSprite( self )
		
	end
    
    if ( love.keyboard.isDown( " " ) ) then
        -- Attack!
        self:ThrowSword()
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

function player:UpdateSword()
    if ( self.sword.life > 0 ) then
        if ( self.sword.direction == 0 ) then       -- down
            MoveCollidableObject( self.sword, "south" )
			UpdateAnimatedSprite( self.sword )
			
        elseif ( self.sword.direction == 1 ) then   -- up
            MoveCollidableObject( self.sword, "north" )
			UpdateAnimatedSprite( self.sword )
			
        elseif ( self.sword.direction == 2 ) then   -- left
            MoveCollidableObject( self.sword, "west" )
			UpdateAnimatedSprite( self.sword )
			
        elseif ( self.sword.direction == 3 ) then   -- right
            MoveCollidableObject( self.sword, "east" )
			UpdateAnimatedSprite( self.sword )
        end
        
        self.sword.life = self.sword.life - 1
    end
end

function player:Draw()
	DrawAnimatedSprite( self, camera.x, camera.y )
	DrawAnimatedSprite( self.sword, camera.x, camera.y )
end
