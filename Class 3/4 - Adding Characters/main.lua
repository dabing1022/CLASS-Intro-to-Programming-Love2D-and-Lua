-- Class 3 Program 4
-- http://www.moosader.com/resources/tutorials/love-lua/1
-- (c) Rachel J. Morris, 2012
-- zlib license

require "map"
require "tileset"
require "userinput"
require "player"

function love.load()
    tileset:Setup()
    SetupMap()
    player:Setup()
    UpdateScreenOffset()
end

function love.update()
    userinput:GetInput()
end

function love.draw()
    DrawMap()
    player:Draw()
    
    love.graphics.print( love.graphics.getWidth(), 0, 0 )
    love.graphics.print( "OffsetX: " .. viewOffset.x, 0, 15 )
    love.graphics.print( "PlayerX: " .. player.x, 0, 30 )
end
