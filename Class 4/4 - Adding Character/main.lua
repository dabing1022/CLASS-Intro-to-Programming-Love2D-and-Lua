-- Class 4 Program 4
-- http://www.moosader.com/resources/tutorials/love-lua/1
-- (c) Rachel J. Morris, 2012
-- zlib license

require "map"
require "tileset"
require "player"

function love.load()
    tileset:Setup()
    SetupMap()
	player:Setup()
	camera:CenterCameraOn( player )
end

function love.update()
	player:GetInput()
	camera:CenterCameraOn( player )
end

function love.draw()
    DrawMap()
	player:Draw()
end
