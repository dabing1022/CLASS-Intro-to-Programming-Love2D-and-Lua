function love.load()
    imgGirl = love.graphics.newImage( "Ayne.png" )
    
    -- The spritesheet is made up of many frames of animation
    -- and directions
    frameWidth = 32
    frameHeight = 48
    
    currentFrame = 0

    currentDirection = 0
    
    counter = 0
end

function love.update()
    counter = counter + 1

    currentFrame = currentFrame + 0.01
    
    if ( currentFrame >= 4 ) then
        -- End of the animation loop, restart at beginning
        currentFrame = 0
    end
    
    if ( counter == 1000 ) then
        currentDirection = 1
    elseif ( counter == 2000 ) then
        currentDirection = 2
    elseif ( counter == 3000 ) then
        currentDirection = 3
    elseif ( counter == 4000 ) then
        currentDirection = 0
        -- Reset
        counter = 0
    end
    
    -- Turn the image into a quad
    quad = love.graphics.newQuad(
        math.floor( currentFrame ) * frameWidth,    -- Start X coord on image
        currentDirection * frameHeight,                  -- Start Y coord on image
        frameWidth,                                             -- Width of frame we're pulling out
        frameHeight,                                            -- Height of frame we're pulling out
        imgGirl:getWidth(),                                   -- Get FULL width of entire image
        imgGirl:getHeight()                                     -- Get FULL height of entire image
    )
end

function love.draw()
    -- Background
    love.graphics.setColor( 100, 200, 255, 255 )
    love.graphics.rectangle( "fill", 0, 0, 800, 600 )
    
    -- Reset color tint
    love.graphics.setColor( 255, 255, 255, 255 )
    
    -- Draw girl
    love.graphics.drawq( imgGirl, quad, 800/2, 600/2 )
    
    -- Draw info
    love.graphics.print( counter, 0, 0 )
end
