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

require "characters"
require "map"			
require "tileset"
require "camera"

function love.load()	
	player:Load()
	npc:Load()
	
	song = love.audio.newSource( "EgyptianDance_MerrillGrady.ogg", "stream" )
	plop = love.audio.newSource( "Plopp_jh.mp3", "stream" )
	
	tileset:Setup()
	SetupMap()
	
	--love.audio.play( song )
end

function love.update()								-- UPDATE!	
	player:Update()
	npc:Update()
	
	camera:CenterCameraOn( player )
end

function love.draw()									-- DRAW!
	DrawMap()
	player:Draw()
	npc:Draw()
	--DebugPrint(camera.x, camera.y) -- Output this to get the yellow rectangles!
end