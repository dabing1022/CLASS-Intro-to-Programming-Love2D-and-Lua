function love.load()
    -- Player
    playerImage = love.graphics.newImage( "Cat.png" )
    playerX = 800 / 2
    playerY = 600 / 2
    playerSpeed = 0.5
    
    -- NPC
    npcImage = love.graphics.newImage( "BlueCat.png" )
    npcX = 200
    npcY = 200
    npcSpeed = 0.5
    
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
    
    -- NPC Move randomly
    moveChoice = math.random( 0, 3 )
    if ( moveChoice == 0 ) then
        npcY = npcY - npcSpeed
    elseif ( moveChoice == 1 )  then
        npcY = npcY + npcSpeed
    elseif ( moveChoice == 2 ) then
        npcX = npcX - npcSpeed
    else
        npcX = npcX + npcSpeed
    end
end

function love.draw()
    love.graphics.draw( playerImage,    playerX,    playerY )
    love.graphics.draw( npcImage,       npcX,       npcY )
    love.graphics.draw( itemImage,      itemX,      itemY )
end


function iscollision( x1, y1, x2, y2 )

end
