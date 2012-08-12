require "update"
require "objects"

function love.load()
    player.Image = love.graphics.newImage( "Cat.png" )    
    npc.Image = love.graphics.newImage( "BlueCat.png" )
    npc2.Image = love.graphics.newImage( "BlueCat.png" )
    gem.Image = love.graphics.newImage( "Gem.png" )
end

function love.draw()
    love.graphics.draw( player.Image, player.X, player.Y )
    love.graphics.draw( npc.Image, npc.X, npc.Y )
    love.graphics.draw( npc2.Image, npc2.X, npc2.Y )
    love.graphics.draw( gem.Image, gem.X, gem.Y )
    love.graphics.print( "Score: " .. player.Score, 0, 0 ) -- new
end
