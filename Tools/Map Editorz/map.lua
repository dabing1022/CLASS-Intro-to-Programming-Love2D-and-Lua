require "tileset"

map = {
}

mapProperties = {
    maximum = {
        x = 800*2,
        y = 800*2
    }
}

function SetupMap()
	for y = 0, 600/32 * 2 do
		for x = 0, 800/32 * 2 do			
			AppendTileToMap( math.floor(x) * 32, math.floor(y) * 32, tileset.grass )
		end
	end
end

function AppendTileToMap( newx, newy, tileType )
    newTile = {
        tile = tileType,
        x = newx,
        y = newy
    }
    table.insert( map, newTile )
end

function RemoveLastTile()
    table.remove( map )
end

function DrawMap()
	love.graphics.setColor( 255, 255, 255, 255 )
	for index, mapTile in pairs( map ) do
		love.graphics.draw( mapTile.tile.image, mapTile.x - viewOffset.x, mapTile.y - viewOffset.y )
	end
end	
