require "animatedSprite"
require "collisionObject"
require "camera"

-- The Link sprites are 32x32,
-- the other characters are 32x48.
player = {
	x = 0, 		y = 0,
	frame = 0, 	direction = 0,
	width = 32, height = 48,
	walkSpeed = 0.5,
	runSpeed = 2,
	speed = walkSpeed
}

function player:Load()
	LoadAnimatedSprite( self, "Coa.png" )
	LoadCollidableObject( self, "feet" )
end

function player:Update()
	-- Keyboard Input		
	if 		( love.keyboard.isDown( "left" ) ) then
		MoveCollidableObject( self, "west" )
		UpdateAnimatedSprite( player )
		
	elseif 	( love.keyboard.isDown( "right" ) ) then
		MoveCollidableObject( self, "east" )
		UpdateAnimatedSprite( player )
	
	elseif 	( love.keyboard.isDown( "up" ) ) then
		MoveCollidableObject( self, "north" )
		UpdateAnimatedSprite( player )
	
	elseif 	( love.keyboard.isDown( "down" ) ) then
		MoveCollidableObject( self, "south" )
		UpdateAnimatedSprite( player )
	end
	-- RUN
	if ( love.keyboard.isDown( "lshift" ) ) then
		player.speed = player.runSpeed
	else
		player.speed = player.walkSpeed
	end
end

function player:Draw()
	DrawAnimatedSprite( self, camera.x, camera.y )
end


npc = {
	x = 0, 		y = 100,
	frame = 0, 	direction = 0,
	width = 32, height = 48,
	speed = 0.001,
	dialog = {
		"OW!", 
		"Why are you hitting me??",
		"Go away!"
	}
}

function npc:Load()
	LoadAnimatedSprite( self, "Elliot.png" )
	LoadCollidableObject( self, "feet" )
	dialogIdx = 1
end

function npc:Update()
	UpdateAnimatedSprite( npc )
	if ( player.x < self.x ) then
		MoveCollidableObject( self, "west" )
	elseif ( player.x > self.x ) then
		MoveCollidableObject( self, "east" )
	end
	if ( player.y < self.y ) then
		MoveCollidableObject( self, "north" )
	elseif ( player.y > self.y ) then
		MoveCollidableObject( self, "south" )
	end
end

function npc:Draw()
	DrawAnimatedSprite( npc, camera.x, camera.y )
	
	if ( WiderCollision( self, player ) ) then
		love.graphics.setColor( 0, 0, 0, 255 ) -- black
		love.graphics.print( 
			self.dialog[math.floor(dialogIdx)], 
			self.x - camera.x, self.y - camera.y - 10 )
	end
	love.graphics.setColor( 255, 255, 255, 255 )
	dialogIdx = dialogIdx + 0.01
	if ( dialogIdx > 3 ) then dialogIdx = 1 end
end