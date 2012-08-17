require "tileset"

map = {
}

mapProperties = {
    maximum = {
        x = 800*2,
        y = 800*2
    },
    noUnsavedChanges = false
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
    mapProperties.noUnsavedChanges = falseeex
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

function SaveMap()
    filename = "Map.txt" 
    file = io.open( filename, "w" )
    
	for index, mapTile in pairs( map ) do
        file:write( "\ntile " .. index .. " x " .. mapTile.x .. " y " .. mapTile.y .. " tile " .. mapTile.tile.name .. " end" )
	end
    
    file:close()
    
    mapProperties.noUnsavedChanges = true
end


