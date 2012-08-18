function love.load()
    particleImage = love.graphics.newImage( "Heart.png" )
    
    -- 256 maximum particles
    particleSystem = love.graphics.newParticleSystem( particleImage, 256 )
    
    particleSystem:setEmissionRate( 5 )
    particleSystem:setLifetime( 10 )
    particleSystem:setParticleLife( 10 )
    particleSystem:setPosition( 800/2, 600/2 )
    particleSystem:setSpeed( 10, 10)
    particleSystem:setGravity( 5, 25 )
    particleSystem:setRadialAcceleration( 10 )
    particleSystem:setTangentialAcceleration( 10 )
    particleSystem:setSizes( 1 )
    particleSystem:setRotation( 1 )
    particleSystem:setSpread( 10 )
    particleSystem:stop()
    
    particleX = 800/2
    particleY = 600/2
    movementSpeed = 0.2
    rotation = 1
end

function love.update( dt )    
    if ( love.keyboard.isDown( "up" ) ) then
        particleY = particleY - movementSpeed
    elseif (  love.keyboard.isDown( "down" ) ) then
        particleY = particleY + movementSpeed
    end
    if ( love.keyboard.isDown( "left" ) ) then
        particleX = particleX - movementSpeed
    elseif ( love.keyboard.isDown( "right" ) ) then
        particleX = particleX + movementSpeed
    end
    
    rotation = rotation + 1
    
    particleSystem:start()
    particleSystem:update( dt )
    particleSystem:setPosition( particleX, particleY )
    particleSystem:setRotation( rotation )
end

function love.draw()
    love.graphics.draw( particleSystem,  20, 20 )
    
    love.graphics.print( "X: " .. particleX .. ", Y: " .. particleY, 0, 0 )
end
