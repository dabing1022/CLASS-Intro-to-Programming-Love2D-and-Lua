-- Class 4 Program 2
-- http://www.moosader.com/resources/tutorials/love-lua/1
-- (c) Rachel J. Morris, 2012
-- zlib license

-- Sets up the quad for the image based on filepath
-- CREATES:
-- 	* Creates "image", "frameQuad", and "maxFrames" members of the object
-- IN:
--  * object - must have "width", "height".
--  * filepath - a filename ("bob.png") or path ("images/bob.png") to the file
-- OUT:
--	None
function LoadAnimatedSprite( object, filepath )
	object.image = love.graphics.newImage( filepath )
	object.frameQuad = love.graphics.newQuad(
		0, 0,
		object.width, object.height,
		object.image:getWidth(), object.image:getHeight()
	)
	
	-- Determine maximum frames
	object.maxFrames = object.image:getWidth() / object.width
end

-- Increments the current frame and updates the quad viewport
-- IN:
--  * object - must have "width", "height", "direction", "frame",
--				and "maxFrames" (created in LoadAnimatedSprite).
-- OUT:
--	None
function UpdateAnimatedSprite( object )
	object.frame = object.frame + 0.01
	if ( object.frame >= object.maxFrames ) then
		object.frame = 0
	end
	
	object.frameQuad:setViewport(
		math.floor( object.frame ) * object.width,		-- X Coord of image
		object.direction * object.height,				-- Y Coord of image
		object.width,									-- Width of one frame
		object.height									-- Height of one frame
	)
end

-- Draws the image at the current frame to the screen.
-- IN:
--  * object - must have "image", "frameQuad", "x", and "y".
-- OUT:
--	None
function DrawAnimatedSprite( object )
	love.graphics.drawq( object.image, object.frameQuad, object.x, object.y )
end



