-- Class 3 Program 4
-- http://www.moosader.com/resources/tutorials/love-lua/1
-- (c) Rachel J. Morris, 2012
-- zlib license

require "map"
require "tileset"
require "userinput"
require "player"
require "camera"
require "enemies" 
require "collisionObject"

showDebug = false

function love.load()
    tileset:Setup()
    SetupMap()
    player:Setup()
    camera:CenterCameraOn( player )
	enemies:Setup()
end

function love.update()
	enemies:Update( player, player.sword )
    userinput:GetInput()
    player:UpdateSword()
    camera:CenterCameraOn( player )
	
	if ( love.keyboard.isDown( "d" ) ) then
		if ( showDebug ) then showDebug = false else showDebug = true end
	end
end

function love.draw()
    DrawMap()
	enemies:Draw()
    player:Draw()
    
    if ( showDebug ) then DebugPrint( camera.x, camera.y ) end
end
