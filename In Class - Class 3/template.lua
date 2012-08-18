function love.load()
    -- Storing new variables
    playerImage = love.graphics.newImage( "Cat.png" )
    playerX = 0
    playerY = 0
end

function love.update()
    -- Get input to change the player's coordinates
end

function love.draw()
    -- Draw player image
    love.graphics.draw( playerImage, playerX, playerY )
    -- Draw text
    love.graphics.print( "Player X:" .. playerX, 100, 0 )
end
