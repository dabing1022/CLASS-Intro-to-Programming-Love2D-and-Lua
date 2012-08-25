-- Class 4 Program 2
-- http://www.moosader.com/resources/tutorials/love-lua/1
-- (c) Rachel J. Morris, 2012
-- zlib license

-- REQUIREMENTS
-- Object being passed in must contain:
-- myCharacter = {
--		x, y, width, height, speed, direction
-- }

-- USAGE
-- 1. LoadCollidableObject( object, regionType ) 
-- 		* Call this during love.load()
-- 		* Pass in a character object
--		* and the regionType - Either "full" or "feet".
--
-- 2. MoveCollidableObject( object, dierction )
--		* Call this if the character is going to move (ie, with keyboard input or AI)
--		* Handles checking whether there is a collision and moves the object based on its speed
--		* Pass in a character object
--		* and direction - "north", "south", "east", "west".
--		* Direction assumptions on filmstrip are same as for animatedSprite.lua
--

collisionItems = {}

function DebugPrint()
	y = 0
	for index, ob in pairs (collisionItems) do
		love.graphics.setColor( 255, 255, 255, 255 )
		love.graphics.print( "Object " .. index .. ": ", 0, y )
		y = y + 15
		love.graphics.print( "Object x, y, w, h: " .. ob.x .. "," .. ob.y .. "," .. ob.width .. "," .. ob.height, 10, y )
		y = y + 15
		love.graphics.print( "collision region x, y, w, h: " .. 
			ob.collisionRegion.x .. "," .. ob.collisionRegion.y .. "," .. ob.collisionRegion.width .. "," .. ob.collisionRegion.height, 10, y )
		y = y + 30
		
		love.graphics.setColor( 255, 255, 0, 255 )
		-- Draw bounding rectangle
		love.graphics.rectangle( "line", 
			ob.x + ob.collisionRegion.x, ob.y + ob.collisionRegion.y, 
			ob.collisionRegion.width,
			ob.collisionRegion.height )
	end
	love.graphics.setColor( 255, 255, 255, 255 )
end

-- Sets up the quad for the image based on filepath
-- CREATES:
-- 	* Creates "collisionRegion{}", collisionRegion.x, collisionRegion.y,
--  * collisionRegion.width, collisionRegion.height, "collisionId", "doesntCollideWith"
-- IN:
--  * object - must have "width", "height".
--  * regionType - must be "full" or "feet".
-- OUT:
--	None
function LoadCollidableObject( object, regionType )
	-- Create "Collision Region" area
	object.collisionRegion = {}
	if ( regionType == "full" ) then
		-- FULL IMAGE COLLISION
		object.collisionRegion.x = 0
		object.collisionRegion.y = 0
		object.collisionRegion.width = object.width
		object.collisionRegion.height = object.height
	else
		-- FOOT-REGION COLLISION
		object.collisionRegion.x = math.floor(object.width / 4)
		object.collisionRegion.y = object.height - math.floor(object.height / 6)
		object.collisionRegion.width = math.floor(object.width / 4) * 2
		object.collisionRegion.height = math.floor(object.height / 6)
	end
	
	table.insert( collisionItems, object )
	object.collisionId = #collisionItems
	object.doesntCollideWith = {}
end

function SetDoesntCollideWith( obj1, obj2 )
	if ( obj2.collisionId ~= nil ) then
		table.insert( obj1.doesntCollideWith, obj2.collisionId )
	end
end

-- Moves the object based on its speed and whether it's colliding with anything
-- IN:
--  * object - must have "speed", "direction", "x", "y", and collisionRegion.
--  * direction - must be "north", "south", "east", or "west".
-- OUT:
--	None
function MoveCollidableObject( object, direction )
	
	-- CREATE DUMMY OBJECT TO HOLD WHERE PLAYER WILL BE IF THEY MOVE
	local dummyObject = {
		x = object.x,
		y = object.y,
		collisionRegion = {
			x = object.collisionRegion.x,
			y = object.collisionRegion.y,
			width = object.collisionRegion.width,
			height = object.collisionRegion.height
		}
	}
	
	-- SET FACING DIRECTION AND MOVE DUMMY OBJECT
	dummyObject.collisionId = object.collisionId
	if 		( direction == "north" ) then 
		object.direction = 1
		dummyObject.y = dummyObject.y - object.speed
		
	elseif	( direction == "south" ) then 
		object.direction = 0
		dummyObject.y = dummyObject.y + object.speed
		
	elseif	( direction == "west" ) then 
		object.direction = 2
		dummyObject.x = dummyObject.x - object.speed
		
	elseif	( direction == "east" ) then 
		object.direction = 3
		dummyObject.x = dummyObject.x + object.speed
	end
	
	-- CHECK COLLISION WITH EVERYTHING
	collision = false
	for index, currentObject in pairs ( collisionItems ) do
		if ( dummyObject.collisionId ~= currentObject.collisionId 
				and TableContains( object.doesntCollideWith, currentObject.collisionId ) == false
				and Collision( dummyObject, currentObject ) ) then
			collision = true
			love.graphics.print( "Object " .. dummyObject.collisionId .. " collides with Object " .. currentObject.collisionId, 100, 0 )
		end
	end
	
	-- IF THERE WASN'T A COLLISION, MOVE THE ACTUAL OBJECT
	if ( collision == false ) then
		object.x = dummyObject.x
		object.y = dummyObject.y
	end
end

function TableContains( tbl, val )
	if ( #tbl > 0 ) then
		for key, value in pairs( tbl ) do
			if ( value == val ) then return true end
		end
	end
	return false
end


-- Checks for collision between objects
-- IN:
--  * obj1 - Must have "collisionRegion { x, y, width, height }"
--  * obj2 - Must have same as above
-- OUT:
--	boolean "true" or "false".
function Collision( obj1, obj2 )
	-- Add position x (based on screen) + region x (based on frame) + width of region
	left1 	= obj1.x + obj1.collisionRegion.x
	right1 	= obj1.x + obj1.collisionRegion.x + obj1.collisionRegion.width
	top1 	= obj1.y + obj1.collisionRegion.y
	bottom1 = obj1.y + obj1.collisionRegion.y + obj1.collisionRegion.height
	
	left2 	= obj2.x + obj2.collisionRegion.x
	right2 	= obj2.x + obj2.collisionRegion.x + obj2.collisionRegion.width
	top2 	= obj2.y + obj2.collisionRegion.y
	bottom2 = obj2.y + obj2.collisionRegion.y + obj2.collisionRegion.height
	
	if ( 	left1 	< 	right2 and
			right1 	> 	left2 and
			top1 	< 	bottom2 and
			bottom1 > 	top2 ) then
		return true	
	end
	
	return false
end