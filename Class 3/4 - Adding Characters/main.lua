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
    player:UpdateSword()
end

function love.draw()
    DrawMap()
    player:Draw()
    
    love.graphics.print( love.graphics.getWidth(), 0, 0 )
    love.graphics.print( "OffsetX: " .. viewOffset.x, 0, 15 )
    love.graphics.print( "Player Coordinates: " .. player.x .. ", " .. player.y, 0, 30 )
    love.graphics.print( "Sword Coordinates: " .. player.sword.x .. ", " .. player.sword.y, 0, 45 )
    love.graphics.print( "Sword Dimensions: " .. player.sword.width .. ", " .. player.sword.height, 0, 60 )
    love.graphics.print( "Sword Life: " .. player.sword.life, 0, 75 )
end
