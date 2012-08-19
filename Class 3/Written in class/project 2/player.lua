-- player.lua

require "collision"

player = {
	x = 200,
	y = 0
}

function player:Setup()
	self.image = love.graphics.newImage("Images/BlueCat.png")
end

function player:GetInput()
	if ( love.keyboard.isDown( "left" ) ) then
		player.x = player.x - 1
	elseif ( love.keyboard.isDown( "right" ) ) then
		player.x = player.x + 1
	elseif ( love.keyboard.isDown( "up" ) ) then
		player.y = player.y - 1
	elseif ( love.keyboard.isDown( "down" ) ) then
		player.y = player.y + 1
	end
end

function player:Draw()
	love.graphics.draw( player.image, player.x, player.y )
end