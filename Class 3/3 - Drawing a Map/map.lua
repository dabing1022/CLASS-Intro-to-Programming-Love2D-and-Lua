-- Class 3 Program 3
-- http://www.moosader.com/resources/tutorials/love-lua/1
-- (c) Rachel J. Morris, 2012
-- zlib license

require "GeneratedMap.lua"

mapProperties = {
    maximum = {
        x = 800*2,
        y = 800*2
    },
}

viewOffset = { 
	x = 0,
	y = 0
}

function DrawMap()
	love.graphics.setColor( 255, 255, 255, 255 )
	for index, mapTile in pairs( map ) do
		love.graphics.draw( mapTile.tile.image, mapTile.x - viewOffset.x, mapTile.y - viewOffset.y )
	end
end	
