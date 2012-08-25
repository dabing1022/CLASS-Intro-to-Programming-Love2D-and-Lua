-- github.com/moosader
-- Download "Class 4 Downloads.zip"
-- Copy one character sprite from
-- 		the "Graphics" folder,
-- and copy the prewritten code
--		"animatedSprite.lua" and
--		"collisionObject.lua"

-- Grab music from art.devsader.com
-- Grab sound effect from the 
-- "Sound effects" folder in
-- the Class 4 Downloads

require "animatedSprite"
require "collisionObject"
require "characters"

function love.load()	
	-- Load the image for each character
	LoadAnimatedSprite( player, "Coa.png" )
	LoadAnimatedSprite( npc, "Elliot.png" )
	
	-- Setup the characters as collidable objects
	LoadCollidableObject( player, "feet" )
	LoadCollidableObject( npc, "feet" )
	
	song = love.audio.newSource( "EgyptianDance_MerrillGrady.ogg", "stream" )
	plop = love.audio.newSource( "Plopp_jh.mp3", "stream" )
	
	love.audio.play( song )
end

function love.update()								-- UPDATE!
	UpdateCharacters()
	
	if ( WiderCollision( player, npc ) ) then
		love.audio.play( plop )
	end
end

function love.draw()									-- DRAW!
	DrawAnimatedSprite( player, 0, 0 )
	DrawAnimatedSprite( npc, 0, 0 )
	DebugPrint(0, 0) -- Output this to get the yellow rectangles!
end