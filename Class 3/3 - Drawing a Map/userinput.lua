-- Class 3 Program 3
-- http://www.moosader.com/resources/tutorials/love-lua/1
-- (c) Rachel J. Morris, 2012
-- zlib license

require "camera"

userinput = {}

function userinput:GetInput()
    self:CheckForChangeOffset()
end

function userinput:CheckForChangeOffset()
	-- Adjust offset
	if ( love.keyboard.isDown( "left" ) ) then
		camera:MoveCamera( -5, 0 )
	elseif ( love.keyboard.isDown( "right" ) ) then
		camera:MoveCamera( 5, 0 )
	end
	if ( love.keyboard.isDown( "up" ) ) then
		camera:MoveCamera( 0, -5 )
	elseif ( love.keyboard.isDown( "down" ) ) then
		camera:MoveCamera( 0, 5 )
	end
end

