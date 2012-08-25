-- Class 4 Program 2
-- http://www.moosader.com/resources/tutorials/love-lua/1
-- (c) Rachel J. Morris, 2012
-- zlib license

-- Loads in a filmstrip and makes and handles quad sprite loading and updates!
-- Filmstrip must be in the order (Vertically): 0 = South, 1 = North, 2 = West, 3 = East
-- Filmstrip can be any size, any amount of frames per direction

-- REQUIREMENTS
-- Object being passed in must contain:
-- myCharacter = {
--		x, y, width, height, direction, frame
-- }

-- USAGE
-- 1. LoadAnimatedSprite( object, filepath ) 
-- 		* Call this during love.load()
-- 		* Pass in a character object and the string to the image file (path + filename or just filename)
--
-- 2. UpdateAnimatedSprite( object )
--		* Call this if the character moves
--		* Handles animating the sprite to look like its walking
--		* If you just throw it in love.update() on its own, 
--		* the character will continually walk (like in old RPGs)
--
-- 3. DrawAnimatedSprite( object )
--		* Call this during love.draw()
--		* Draws the quad to the screen

animationSpeed = 0.05

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
	object.frame = object.frame + animationSpeed
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
function DrawAnimatedSprite( object, offsetX, offsetY )
	love.graphics.drawq( object.image, object.frameQuad, object.x - offsetX, object.y - offsetY )
end



