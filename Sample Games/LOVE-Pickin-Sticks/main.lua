-- Love Pickin' Sticks
-- Rachel J. Morris, July 2012
-- www.Moosader.com

----------------------
-- Player ------------
----------------------
player = {
	x = love.graphics.getWidth() / 2,
	y = love.graphics.getHeight() / 2,
	w = 32,
	h = 48,
	speed = 2,
	imagePath = "images/Ayne_Moosader.png",
	frame = 0,
	direction = 0,
	score = 0
}

function player:HandleInput()
	if love.keyboard.isDown( "up" ) then
		player:Move( 0, -1 )
		player.direction = 1
	elseif love.keyboard.isDown( "down" ) then
		player:Move( 0, 1 )
		player.direction = 0
	elseif love.keyboard.isDown( "left" ) then
		player:Move( -1, 0 )
		player.direction = 2
	elseif love.keyboard.isDown( "right" ) then
		player:Move( 1, 0 )
		player.direction = 3
	end
end

function player:Move( xDir, yDir )
	xMovement = player.x + ( xDir * player.speed )
	yMovement = player.y + ( yDir * player.speed )

	-- Horiz movement: Keep within screen region	
	if ( xMovement < love.graphics.getWidth() - player.w and
		xMovement > 0 ) then
		player.x = xMovement
	end
	if ( yMovement < love.graphics.getHeight() - player.h and
		yMovement > 0 ) then
		player.y = yMovement
	end
	
	-- Increment Frame
	player.frame = player.frame + 0.1
	if ( player.frame >= 4 ) then player.frame = 0 end
end

function player:Draw()
	--love.graphics.draw( player.image, 0, 0 )

	qFrame = love.graphics.newQuad( 
		math.floor(player.frame) * player.w, player.direction * player.h, 
		player.w, player.h,
		player.image:getWidth(), player.image:getHeight() )
	love.graphics.drawq( player.image, qFrame, player.x, player.y )
end

----------------------
-- Stick -------------
----------------------

stick = {
	w = 32,
	h = 32,
	imagePath = "images/Stick_Moosader.png"
}

function stick:Draw()
	love.graphics.draw( stick.image, stick.x, stick.y )
end

function stick:GenerateCoordinates()
	stick.x = math.random( 0, love.graphics.getWidth() - stick.w )
	stick.y = math.random( stick.h * 2, love.graphics.getHeight() - stick.h )
end

----------------------
-- Tileset -----------
----------------------
tileset = {
	imagePath = "images/EnvironmentTiles_Moosader.png",
	grass = {
		w = 64,
		h = 64,
		sx = 0,
		sy = 0
	}
}

function tileset:Draw()
	-- Draw the grass terrain
	qGrass = love.graphics.newQuad( 
		tileset.grass.sx, tileset.grass.sy, 
		tileset.grass.w, tileset.grass.h, 
		tileset.image:getWidth(), tileset.image:getHeight() )
	for xIdx = 0, love.graphics.getWidth() / tileset.grass.w, 1 do
		for yIdx = 0, love.graphics.getHeight() / tileset.grass.h, 1 do
			love.graphics.drawq( tileset.image, qGrass, 
				xIdx * tileset.grass.w, yIdx * tileset.grass.h )
		end
	end
end

----------------------
-- Game Callbacks ----
----------------------

function love.load()
	-- Raw images
	tileset.image = love.graphics.newImage( tileset.imagePath )
	player.image = love.graphics.newImage( player.imagePath )	
	stick.image = love.graphics.newImage( stick.imagePath )
	
	-- Setup random stick coordinates
	stick:GenerateCoordinates()
	
	fntHeader = love.graphics.newFont( 24 )
	fntText = love.graphics.newFont( 14 )
end

function love.update( dt )
	player:HandleInput()
	
	if ( Collision( player, stick ) ) then
		stick:GenerateCoordinates()
		player.score = player.score + 1
	end
end

function love.draw()
	tileset:Draw()
	stick:Draw()
	player:Draw()
	
	-- HUD
	love.graphics.setFont( fntHeader )
    love.graphics.print("Love Pickin' Sticks", 0, 0)
    love.graphics.setFont( fntText )
    love.graphics.print( "Rachel J. Morris - Moosader.com", 0, 25 )
    love.graphics.print( "Score: " .. player.score, 0, 50 )
end

function Collision( itemA, itemB )
	if ( itemA.x < itemB.x + itemB.w and
		 itemA.x + itemA.w > itemB.x and
		 itemA.y < itemB.y + itemB.h and
		 itemA.y + itemA.h > itemB.y ) then
		return true
	end
	return false
end

