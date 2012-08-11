function Collision( paddle, ball )
    if ( paddle.x < ball.x + ball.width and
            paddle.x + paddle.width > ball.x and
            paddle.y < ball.y + ball.height and
            paddle.y + paddle.height > ball.y ) then
        return true
    end
    return false
end
