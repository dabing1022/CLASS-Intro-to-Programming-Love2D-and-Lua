-- Class 3 Program 3
-- http://www.moosader.com/resources/tutorials/love-lua/1
-- (c) Rachel J. Morris, 2012
-- zlib license

userinput = {}

function userinput:GetInput()
    self:CheckForChangeOffset()
end

function userinput:CheckForChangeOffset()
	-- Adjust offset
	if ( love.keyboard.isDown( "left" ) ) then
		viewOffset.x = viewOffset.x - 5
	elseif ( love.keyboard.isDown( "right" ) ) then
		viewOffset.x = viewOffset.x + 5
	end
	if ( love.keyboard.isDown( "up" ) ) then
		viewOffset.y = viewOffset.y - 5
	elseif ( love.keyboard.isDown( "down" ) ) then
		viewOffset.y = viewOffset.y + 5
	end
end

