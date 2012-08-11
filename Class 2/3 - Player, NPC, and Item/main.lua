-- Class 2 Program 3
-- http://www.moosader.com/resources/tutorials/love-lua/1
-- (c) Rachel J. Morris, 2012
-- zlib license

require "collision"

function love.load()
    -- Player
    playerImage = love.graphics.newImage( "Cat.png" )
    playerX = 800 / 2
    playerY = 600 / 2
    playerSpeed = 0.5
    playerScore = 0
    
    -- NPC
    npcImage = love.graphics.newImage( "BlueCat.png" )
    npcX = 200
    npcY = 200
    npcSpeed = 0.1
    npcScore = 0
    
    -- Item
    itemImage = love.graphics.newImage( "Gem.png" )
    itemX = 500
    itemY = 500
end

function love.update()
    -- Move Player with Keyboard
    if ( love.keyboard.isDown( "up" ) ) then
        playerY = playerY - playerSpeed
    elseif ( love.keyboard.isDown( "down" ) ) then
        playerY = playerY + playerSpeed
    end
    
    if ( love.keyboard.isDown( "left" ) ) then
        playerX = playerX - playerSpeed
    elseif ( love.keyboard.isDown( "right" ) ) then
        playerX = playerX + playerSpeed
    end
    
    -- NPC Move towards item
    if ( npcX < itemX ) then
        npcX = npcX + npcSpeed
    elseif ( npcX > itemX ) then
        npcX = npcX - npcSpeed
    end
    
    if ( npcY < itemY ) then
        npcY = npcY + npcSpeed
    elseif ( npcY > itemY ) then
        npcY = npcY - npcSpeed
    end
    
    -- Check collision between Player and Item
    if ( collision( playerX, playerY, itemX, itemY ) ) then
        playerScore = playerScore + 1
        -- New Coordinates for item
        itemX = math.random( 0, 700 )
        itemY = math.random( 0, 500 )
    end
    
    -- Check collision between NPC and Item
    if ( collision( npcX, npcY, itemX, itemY ) ) then
        npcScore = npcScore + 1 
        -- New Coordinates for item - Notice how this is duplicate code
        itemX = math.random( 0, 700 )
        itemY = math.random( 0, 500 )
    end
end

function love.draw()
    -- Draw characters & item
    love.graphics.draw( playerImage,    playerX,    playerY )
    love.graphics.draw( npcImage,       npcX,       npcY )
    love.graphics.draw( itemImage,      itemX,      itemY )
    
    -- Draw the scores
    love.graphics.print( "Player score: ", 0, 0 )
    love.graphics.print( playerScore, 0, 10 )
    
    love.graphics.print( "NPC score: ", 700, 0 )
    love.graphics.print( npcScore, 700, 10 )
end


