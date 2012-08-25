-- github.com/moosader
-- Download "Class 4 Downloads.zip"
-- Copy one character sprite from
-- 		the "Graphics" folder,
-- and copy the prewritten code
--		"animatedSprite.lua" and
--		"collisionObject.lua"

require "animatedSprite"
require "collisionObject"
require "characters"

function love.load()								-- LOAD!
	-- Load the image for each character
	LoadAnimatedSprite( player, "Coa.png" )
	LoadAnimatedSprite( npc, "Elliot.png" )
	
	-- Setup the characters as collidable objects
	LoadCollidableObject( player, "feet" )
	LoadCollidableObject( npc, "feet" )
end

function love.update()								-- UPDATE!
	-- Keyboard Input		
	if 		( love.keyboard.isDown( "left" ) ) then
		MoveCollidableObject( player, "west" )
		
	elseif 	( love.keyboard.isDown( "right" ) ) then
		MoveCollidableObject( player, "east" )
	
	elseif 	( love.keyboard.isDown( "up" ) ) then
		MoveCollidableObject( player, "north" )
	
	elseif 	( love.keyboard.isDown( "down" ) ) then
		MoveCollidableObject( player, "south" )
	end
	
	UpdateAnimatedSprite( player )
	UpdateAnimatedSprite( npc )
end

function love.draw()									-- DRAW!
	DrawAnimatedSprite( player, 0, 0 )
	DrawAnimatedSprite( npc, 0, 0 )
	DebugPrint(0, 0) -- Output this to get the yellow rectangles!
end