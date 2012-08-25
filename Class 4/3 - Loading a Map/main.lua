-- Class 4 Program 3
-- http://www.moosader.com/resources/tutorials/love-lua/1
-- (c) Rachel J. Morris, 2012
-- zlib license

require "map"
require "tileset"

function love.load()
    tileset:Setup()
    SetupMap()
end

function love.update()
end

function love.draw()
    DrawMap()
end
