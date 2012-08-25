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

npc = {
	x = 0, 		y = 100,
	frame = 0, 	direction = 0,
	width = 32, height = 48,
	speed = 1
}

function UpdateCharacters()
	-- Keyboard Input		
	if 		( love.keyboard.isDown( "left" ) ) then
		MoveCollidableObject( player, "west" )
		
	elseif 	( love.keyboard.isDown( "right" ) ) then
		MoveCollidableObject( player, "east" )
	
	elseif 	( love.keyboard.isDown( "up" ) ) then
		MoveCollidableObject( player, "north" )
	
	elseif 	( love.keyboard.isDown( "down" ) ) then
		MoveCollidableObject( player, "south" )
	end
	
	-- Player run
	if ( love.keyboard.isDown( "lshift" ) ) then
		player.speed = player.runSpeed
	else
		player.speed = player.walkSpeed
	end
	
	UpdateAnimatedSprite( player )
	UpdateAnimatedSprite( npc )
end