-- Luha, sample platformer made with LÖVE. Rachel J. Morris, moosader.com. zlib license

require "level"
require "Character"
require "physics"

function love.load()
	level:Init()
	
	player = Character:new()
	player:Init( "content/images/Luha.png", 64, 64, "left" )
	player:SetControls( "left", "right", "up", " " )
	
	enemy = Character:new()
	enemy:Init( "content/images/Hula.png", 256, 64, "right" ) 
	enemy:SetControls( "a", "d", "w", "f" )
end

function love.update( timeDelta )	
	physics:ApplyGravity( player, level )
	player:HandleInput()	
	player:Update()
	
	physics:ApplyGravity( enemy, level )
	enemy:HandleInput()
	enemy:Update()
end

function love.draw()
	love.graphics.setColor( 155, 180, 200, 255 )
	love.graphics.rectangle( "fill", 0, 0, 
		love.graphics.getWidth(), love.graphics.getHeight() )
		
	love.graphics.setColor( 255, 255, 255 )
	level:Draw()
	enemy:Draw()
	player:Draw()
end

