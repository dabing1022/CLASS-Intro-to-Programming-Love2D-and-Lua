-- Luha, sample platformer made with LÖVE. Rachel J. Morris, moosader.com. zlib license

physics = {
	accelerateRate = 1,
	frictionRate = 0.1,
	maximumVelocity = { x = 2, y = 3, jump = -10 }
}

function physics:ApplyGravity( obj, lvl )
	-- If there is no collision from the bottom, then have the object fall.
	-- Find any collisions
	collision = physics:GroundCollision( obj, lvl )
	-- If there was no collision, then drop the object
	if ( collision == false ) then
		obj.vel.y = obj.vel.y + physics.accelerateRate
	end
end

function physics:GroundCollision( obj, lvl )	
	collision = false
	for key, value in pairs( lvl.map ) do
		if ( obj.x < value.x + lvl.tileW and
			 obj.x + obj.w > value.x and
			 obj.y + obj.vel.y < value.y + lvl.tileH and
			 obj.y + obj.h + obj.vel.y > value.y ) then
			 collision = true
			 obj.vel.y = 0
		end
	end	
	return collision
end

function physics:SideCollision( obj, lvl )	
	collision = false
	for key, value in pairs( lvl.map ) do
		if ( obj.x + obj.vel.x < value.x + lvl.tileW and
			 obj.x + obj.w + obj.vel.x > value.x and
			 obj.y - 6 < value.y + lvl.tileH and
			 obj.y + obj.h - 6 > value.y ) then
			 collision = true
		end
	end	
	return collision
end
