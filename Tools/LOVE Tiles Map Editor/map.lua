-- LOVE Tiles
-- Really simple map editor for my LOVE/Lua class
-- http://www.moosader.com/resources/tutorials/love-lua/1
-- (c) Rachel J. Morris, 2012
-- zlib license

require "tileset"
require "conf"

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

function ClearMap()
    for idx in pairs (map) do
        map[idx] = nil
    end
    
    SetupMap()
end

function AppendTileToMap( newx, newy, tileType )
    newTile = {
        tile = tileType,
        x = newx,
        y = newy,
        width = tileType.width,
        height = tileType.height
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

-- Map format:
-- map = {
--      tile0 = {
--          x = mapTile.x,
--          y = mapTile.y,
--          width = mapTile.width,
--          height = mapTile.height,
--          tile = mapTile.tile.name
--      }
-- }

function SaveMap() -- map.lua
    local file = io.open( config.mapSavePath.filepath .. config.mapSavePath.filename, "w" )
    
    count = 1
    file:write( "map = {") -- Beginning of generated map table
	for index, mapTile in pairs( map ) do
        -- Don't save grass tiles
        if ( mapTile.tile.name ~= "Grass" ) then
            file:write( "\n" )
            file:write( "   tile" .. count .. " = {" ) -- beginning of map[i]
            file:write( "\n" )
            file:write( "       x = " .. mapTile.x .. "," )
            file:write( "\n" )
            file:write( "       y = " .. mapTile.y .. "," )
            file:write( "\n" )
            file:write( "       width = " .. mapTile.width .. "," )
            file:write( "\n" )
            file:write( "       height = " .. mapTile.height .. "," )
            file:write( "\n" )
            file:write( "       tile = \"" .. mapTile.tile.name .. "\"" )
            file:write( "\n" )
            file:write( "   }" ) -- end of map[i]
            if ( index ~= #map ) then
                file:write(",") -- Elements are separated by commas
            end
            count = count + 1
        end
	end
    file:write( "\n" )
    file:write( "}" ) -- end of map table
    
    file:close()
    mapProperties.noUnsavedChanges = true
end


