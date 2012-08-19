-- main.lua

require "player"
require "tileset"
require "map"

function love.load() 
	player:Setup()
	tileset:Setup()	-- Prewritten
	SetupMap()		-- Prewritten
end

function love.update() 
	player:GetInput()
end

function love.draw() 	
	DrawMap()		-- Prewritten
	player:Draw()
end
