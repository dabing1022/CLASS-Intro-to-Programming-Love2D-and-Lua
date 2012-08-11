-- Class 1 Program 2
-- http://www.moosader.com/resources/tutorials/love-lua/1
-- (c) Rachel J. Morris, 2012
-- zlib license

function love.load()
    playerX = 0
    playerSpeed = 1
	screenWidth = 800
end

function love.update()
    -- Move the player
    playerX = playerX + playerSpeed
	
	-- Change direction if player goes off-screen
	if ( playerX > screenWidth ) then 	-- Off the right side
		playerSpeed = -1
	elseif ( playerX < 0 ) then 		-- Off the left side
		playerSpeed = 1
	end
end

function love.draw()
    love.graphics.print( "(O_O)", playerX, 20 )
end 
