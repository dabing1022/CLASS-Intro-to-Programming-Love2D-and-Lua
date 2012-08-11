-- PONG with LOVE/Lua
-- Rachel J. Morris
-- zlib license

require "Paddles"
require "PongBall"
require "Collision"

function love.load()
    PaddleA.image = love.graphics.newImage( "Images/PurplePaddle.png" )
    PaddleB.image = love.graphics.newImage( "Images/RedPaddle.png" )
    PongBall.image = love.graphics.newImage( "Images/Ball.png" )
    background = love.graphics.newImage( "Images/Volcano.jpg" )
end

function love.update()
    PaddleA:Move()
    PaddleB:Move()
    PongBall:Move()
    
    -- If a paddle hits the ball
    if ( Collision( PaddleA, PongBall ) ) then
        PongBall:Reverse( PaddleA )
    elseif ( Collision( PaddleB, PongBall ) ) then
        PongBall:Reverse( PaddleB )
    end
    
    PongBall:ScreenCollision( PaddleA, PaddleB )
end

function love.draw()
    -- Draw background FIRST
    love.graphics.draw( background, 0, 0 )
    
    -- Draw Paddles then Item
    love.graphics.draw( PaddleA.image, PaddleA.x, PaddleA.y )
    love.graphics.draw( PaddleB.image, PaddleB.x, PaddleB.y )
    love.graphics.draw( PongBall.image, PongBall.x, PongBall.y )
    
    -- Draw overlay score text
    love.graphics.print( "Player 1: ", 10, 10 )
    love.graphics.print( PaddleA.score, 80, 10 )
    love.graphics.print( "Player 2: ", 700, 10 )
    love.graphics.print( PaddleB.score, 770, 10 )
end
