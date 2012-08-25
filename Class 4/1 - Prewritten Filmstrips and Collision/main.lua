-- Class 4 Program 1
-- http://www.moosader.com/resources/tutorials/love-lua/1
-- (c) Rachel J. Morris, 2012
-- zlib license

require "animatedSprite"
require "collisionObject"

--------------------------------------------------
-- *** PLAYER OBJECT
--------------------------------------------------

player = {
	x = 400,
	y = 300,
	width = 32,
	height = 48,
	direction = 0,
	frame = 0,
	speed = 0.5
}

function player:GetInput()
	-- With the keyboard movement
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

--------------------------------------------------
-- *** KNIGHT OBJECT
--------------------------------------------------

knight = {
	x = 100,
	y = 100,
	width = 32,
	height = 32,
	direction = 0,
	frame = 0,
	speed = 0.5
}

function knight:GetInput()
	-- With the keyboard movement
	if ( love.keyboard.isDown( "w" ) ) then
		MoveCollidableObject( self, "north" )
		UpdateAnimatedSprite( self )
		
	elseif ( love.keyboard.isDown( "s" ) ) then
		MoveCollidableObject( self, "south" )
		UpdateAnimatedSprite( self )
		
	elseif ( love.keyboard.isDown( "a" ) ) then
		MoveCollidableObject( self, "west" )
		UpdateAnimatedSprite( self )
		
	elseif ( love.keyboard.isDown( "d" ) ) then
		MoveCollidableObject( self, "east" )
		UpdateAnimatedSprite( self )
	end
end

--------------------------------------------------
-- *** HOUSE OBJECT
--------------------------------------------------

house = {
	x = 200,
	y = 200,
	width = 96,
	height = 128
}

--------------------------------------------------
-- *** <3 GAME LOOP
--------------------------------------------------

function love.load()
	-- Load animated sprite Ayne
	LoadAnimatedSprite( player, "Ayne.png" )
	LoadAnimatedSprite( knight, "Knight.png" )
	LoadCollidableObject( player, "feet" ) -- Only collides at her feet
	LoadCollidableObject( knight, "feet" ) -- Only collides at her feet
	
	-- Load the house image
	house.image = love.graphics.newImage( "House1.png" )
	house.width = house.image:getWidth()
	house.height = house.image:getHeight()
	LoadCollidableObject( house, "full" ) -- Entire building is collidable
end

function love.update()
	player:GetInput()
	knight:GetInput()
end

function love.draw()
	-- Draw house
	love.graphics.draw( house.image, house.x, house.y )
	
	-- Draw players
	DrawAnimatedSprite( player )
	DrawAnimatedSprite( knight )
	
	DebugPrint()
end
