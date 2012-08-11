function love.load()
    playerImage = love.graphics.newImage( "Cat.png" )
    playerX = 800 / 2
    playerY = 600 / 2
    playerSpeed = 0.5
end

function love.update()
    
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
end

function love.draw()
    love.graphics.draw( playerImage, playerX, playerY )
end
