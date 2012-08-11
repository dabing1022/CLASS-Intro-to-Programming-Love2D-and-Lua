
PaddleA = {
    x = 800/2,
    y = 32,
    width = 76,
    height = 24,
    speed = 0.5,
    score = 0
}
function PaddleA:Move()
    if ( love.keyboard.isDown( "left" ) ) then
        PaddleA.x = PaddleA.x - PaddleA.speed
    elseif ( love.keyboard.isDown( "right" ) ) then
        PaddleA.x = PaddleA.x + PaddleA.speed
    end
    
    -- Not sure why I have this, just random. :P
    if ( love.keyboard.isDown( "down" ) ) then
        PaddleA.y = 48
    else
        PaddleA.y = 32
    end
    
    -- Don't go off the screen!
    if ( PaddleA.x < 0 ) then
        PaddleA.x = 0
    elseif ( PaddleA.x > 800 - PaddleA.width ) then
        PaddleA.x = 800 - PaddleA.width
    end
end

PaddleB = {
    x = 800/2,
    y = 600 - 64,
    width = 76,
    height = 24,
    speed = 0.5,
    score = 0
}
function PaddleB:Move()
    if ( love.keyboard.isDown( "a" ) ) then
        PaddleB.x = PaddleB.x - PaddleB.speed
    elseif ( love.keyboard.isDown( "d" ) ) then
        PaddleB.x = PaddleB.x + PaddleB.speed
    end
    
    if ( love.keyboard.isDown( "w" ) ) then
        PaddleB.y = 600 - 64 - 16
    else
        PaddleB.y = 600 - 64
    end
    
    -- Don't go off the screen!
    if ( PaddleB.x < 0 ) then
        PaddleB.x = 0
    elseif ( PaddleB.x > 800 - PaddleB.width ) then
        PaddleB.x = 800 - PaddleB.width
    end
end
