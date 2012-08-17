-- Class 3 Program 2
-- http://www.moosader.com/resources/tutorials/love-lua/1
-- (c) Rachel J. Morris, 2012
-- zlib license

require "player"
require "house"

function love.load()
	player:Setup()
	house:Setup()
end

function love.update()
	player:GetInput()
	player:UpdateFrame()
end

function love.draw()
	player:Draw()
	house:Draw()
end
