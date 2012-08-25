-- Class 3 Program 4
-- http://www.moosader.com/resources/tutorials/love-lua/1
-- (c) Rachel J. Morris, 2012
-- zlib license

require "collisionObject"
require "animatedSprite"
require "camera"

enemies = {
	{
		x = 100, y = 100, width = 32, height = 48, direction = 0, frame = 0, speed = 1.5, visible = true
	},
	{
		x = 300, y = 100, width = 32, height = 48, direction = 0, frame = 0, speed = 0.5, visible = true
	},
	{
		x = 100, y = 300, width = 32, height = 48, direction = 0, frame = 0, speed = 1.0, visible = true
	}
}

function enemies:Setup()
	LoadAnimatedSprite( enemies[1], "Images/Baurn.png" )
	LoadCollidableObject( enemies[1], "full" )
	
	LoadAnimatedSprite( enemies[2], "Images/Delphine.png" )
	LoadCollidableObject( enemies[2], "full" )
	
	LoadAnimatedSprite( enemies[3], "Images/Coa.png" )
	LoadCollidableObject( enemies[3], "full" )	
end

function enemies:Update( playerObj, swordObj )
	for index = 1, #enemies do
		if ( enemies[index].visible ) then
			if ( playerObj.x < enemies[index].x ) then
				MoveCollidableObject( enemies[index], "west" )
				
			elseif ( playerObj.x > enemies[index].x ) then
				MoveCollidableObject( enemies[index], "east" )
				
			elseif ( playerObj.y < enemies[index].y ) then
				MoveCollidableObject( enemies[index], "north" )
				
			elseif ( playerObj.y > enemies[index].y ) then
				MoveCollidableObject( enemies[index], "south" )
			end
			
			UpdateAnimatedSprite( enemies[index] )
			
			if ( WiderCollision( enemies[index], swordObj ) 
				and swordObj.life > 0 ) then
				swordObj.life = 0
				enemies[index].visible = false
				SetDoesntCollideWith( swordObj, enemies[index] )
				SetDoesntCollideWith( playerObj, enemies[index] )
			end
		end
	end
end

function enemies:Draw()
	for index = 1, #enemies do
		if ( enemies[index].visible ) then
			DrawAnimatedSprite( enemies[index], camera.x, camera.y )
		end
	end
end
