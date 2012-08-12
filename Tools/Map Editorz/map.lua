require "tileset"

map = {
}

maxX = 800*2
maxY = 600*2

function SetupMap()
	for y = 0, 600/32 * 2 do
		for x = 0, 800/32 * 2 do
			newTile = {
				x = math.floor(x) * 32,
				y = math.floor(y) * 32,
				tile = tileset.grass
			}
			
			table.insert( map, newTile )
		end
	end
end

function DrawMap()
	love.graphics.setColor( 255, 255, 255, 255 )
	for index, mapTile in pairs( map ) do
		love.graphics.draw( mapTile.tile.image, mapTile.x - viewOffset.x, mapTile.y - viewOffset.y )
	end
end	