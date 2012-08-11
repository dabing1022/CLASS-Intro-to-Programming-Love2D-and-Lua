PongBall = {
    x = 800/2,
    y = 600/2,
    width = 24,
    height = 24,
    velocityX = 0,
    velocityY = 0.2,
    speedUpAmount = 0.1
}

function PongBall:Move()
    PongBall.x = PongBall.x + PongBall.velocityX
    PongBall.y = PongBall.y + PongBall.velocityY
end

function PongBall:Reverse( paddle )
    -- Adjust bounce-back based on where on the paddle was hit
    -- LEFT SIDE, RIGHT SIDE, STRAIGHT-ON.
    
    paddleCenterPoint = paddle.x + paddle.width / 2
    
    PongBall.velocityY = -PongBall.velocityY
    
    if ( PongBall.x < paddleCenterPoint ) then
        PongBall.velocityX = -PongBall.speedUpAmount
    elseif ( PongBall.x > paddleCenterPoint ) then
        PongBall.velocityX = PongBall.speedUpAmount
    else
        PongBall.velocityX = 0
    end
    
    PongBall:IncreaseVelocity()
end

function PongBall:IncreaseVelocity()
    if ( PongBall.velocityY < 0 ) then
        PongBall.velocityY = PongBall.velocityY - PongBall.speedUpAmount
    elseif ( PongBall.velocityY > 0 ) then
        PongBall.velocityY = PongBall.velocityY + PongBall.speedUpAmount
    end
    
    if ( PongBall.velocityX < 0 ) then
        PongBall.velocityX = PongBall.velocityX - PongBall.speedUpAmount
    elseif ( PongBall.velocityX > 0 )  then
        PongBall.velocityX = PongBall.velocityX + PongBall.speedUpAmount
    end
end

function PongBall:ScreenCollision( PaddleA, PaddleB )
    -- If the ball hits the right/left edge of screen, bounce
    if ( PongBall.x < 0 or PongBall.x > 800 - PongBall.width ) then
        PongBall.velocityX = -PongBall.velocityX
    end
    
    -- If the ball flies off the screen, add to score
    if ( PongBall.y < 0 - PongBall.width ) then
        -- PaddleB scored
        PaddleB.score = PaddleB.score + 1
        PongBall:Reset()
        PongBall.velocityY = 0.2
    elseif ( PongBall.y > 600 ) then
        -- PaddleA scored
        PaddleA.score = PaddleA.score + 1
        PongBall:Reset()
        PongBall.velocityY = -0.2
    end
end

function PongBall:Reset()
    PongBall.x = 800/2
    PongBall.y = 600/2
    PongBall.velocityX = 0
end
