-- Class 4 Program 4
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
	speed = 2
}

function player:Setup()
	LoadAnimatedSprite( self, "Images/Ayne.png" )
	LoadCollidableObject( self, "feet" )
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
end

function player:Draw()
	DrawAnimatedSprite( self, camera.x, camera.y )
end
