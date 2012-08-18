require "player"

function love.load() 
	player.image = love.graphics.newImage("Ayne.png")
	
	-- Player is 32x48
	player.width = player.image:getWidth() / player.totalFrames
	player.height = player.image:getHeight() / player.totalDirections
	
	-- Create subsection of graphic
	player.frameQuad = love.graphics.newQuad(
		player.currentFrame, 			-- Starting X on image, NOT IN GAME X
		player.currentDirection,		-- Starting Y on image, not in-game Y
		player.width, 					-- Width of one frame		(32)
		player.height, 					-- Height of one frame		(48)
		player.image:getWidth(), 		-- Width of entire image 	(128?)
		player.image:getHeight() 		-- Height of entire image 	(192)
	)
end

function love.update() 
	player.currentFrame = player.currentFrame + 0.001
	if ( player.currentFrame >= player.totalFrames ) then
		player.currentFrame = 0 -- Reset the frame
	end
	
	player.frameQuad:setViewport(
		math.floor(player.currentFrame) * player.width, 
		player.currentDirection,
		player.width,
		player.height
	)
end

function love.draw() 	
	-- Draw QUAD ("drawq") instead of normal "draw" function.
	love.graphics.drawq( player.image, player.frameQuad, player.x, player.y )
	love.graphics.print( "Frame: " .. player.currentFrame, player.x, 60 )
	love.graphics.print( "Adjusted Frame: " .. math.floor( player.currentFrame ), player.x, 80 )
	love.graphics.print( "Image frame X: " .. math.floor(player.currentFrame) * player.width, player.x, 100 )
	
	DontWriteThis()
end

function DontWriteThis()
	love.graphics.setColor( 255, 0, 0, 255 ) -- R, G, B, A
	love.graphics.rectangle( "fill", math.floor( player.currentFrame ) * player.width,
		0, player.width, player.height )
	love.graphics.setColor( 255, 255, 255, 255 )
	love.graphics.draw( player.image, 0, 0 )
end