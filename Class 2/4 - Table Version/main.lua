-- Class 2 Program 4
-- http://www.moosader.com/resources/tutorials/love-lua/1
-- (c) Rachel J. Morris, 2012
-- zlib license

require "collision"

player = {
    X = 800 / 2,
    Y = 600 / 2,
    Speed = 0.5,
    Score = 0
}

npc = {
    X = 200,
    Y = 200,
    Speed = 0.1,
    Score = 0
}

item = {
    X = 500,
    Y = 500
}

function love.load()
    -- Player
    player.Image = love.graphics.newImage( "Cat.png" )
    
    -- NPC
    npc.Image = love.graphics.newImage( "BlueCat.png" )
    
    -- Item
    item.Image = love.graphics.newImage( "Gem.png" )
end

function love.update()
    -- Move Player with Keyboard
    if ( love.keyboard.isDown( "up" ) ) then
        player.Y = player.Y - player.Speed
    elseif ( love.keyboard.isDown( "down" ) ) then
        player.Y = player.Y + player.Speed
    end
    
    if ( love.keyboard.isDown( "left" ) ) then
        player.X = player.X - player.Speed
    elseif ( love.keyboard.isDown( "right" ) ) then
        player.X = player.X + player.Speed
    end
    
    -- NPC Move towards item
    if ( npc.X < item.X ) then
        npc.X = npc.X + npc.Speed
    elseif ( npc.X > item.X ) then
        npc.X = npc.X - npc.Speed
    end
    
    if ( npc.Y < item.Y ) then
        npc.Y = npc.Y + npc.Speed
    elseif ( npc.Y > item.Y ) then
        npc.Y = npc.Y - npc.Speed
    end
    
    -- Check collision between Player and Item
    if ( collision( player.X, player.Y, item.X, item.Y ) ) then
        player.Score = player.Score + 1
        -- New Coordinates for item
        item.X = math.random( 0, 700 )
        item.Y = math.random( 0, 500 )
    end
    
    -- Check collision between NPC and Item
    if ( collision( npc.X, npc.Y, item.X, item.Y ) ) then
        npc.Score = npc.Score + 1 
        -- New Coordinates for item - Notice how this is duplicate code
        item.X = math.random( 0, 700 )
        item.Y = math.random( 0, 500 )
    end
end

function love.draw()
    -- Draw characters & item
    love.graphics.draw( player.Image,    player.X,    player.Y )
    love.graphics.draw( npc.Image,       npc.X,       npc.Y )
    love.graphics.draw( item.Image,      item.X,      item.Y )
    
    -- Draw the scores
    love.graphics.print( "Player score: ", 0, 0 )
    love.graphics.print( player.Score, 0, 10 )
    
    love.graphics.print( "NPC score: ", 700, 0 )
    love.graphics.print( npc.Score, 700, 10 )
end


