-- Class 3 Program 3
-- http://www.moosader.com/resources/tutorials/love-lua/1
-- (c) Rachel J. Morris, 2012
-- zlib license

require "GeneratedMap"
require "tileset"
require "camera"

mapProperties = {
    maximum = {
        x = 800*2,
        y = 800*2
    },
}

function SetupMap()
	for y = 0, mapProperties.maximum.y / 32 do
		for x = 0, mapProperties.maximum.x / 32 do			
			AppendTileToMap( math.floor(x) * 32, math.floor(y) * 32, tileset.grass )
		end
	end
    
    LinkTilesToMap()
end

function AppendTileToMap( newx, newy, tileType )
    newTile = {
        tile = tileType,
        x = newx,
        y = newy
    }
    table.insert( map, 1, newTile )
    mapProperties.noUnsavedChanges = falseeex
end

function LinkTilesToMap()
	for mapIdx, mapTile in pairs( map ) do
        -- I'm lazy, doing this for now.
		if ( mapTile.tile == "Bush" ) then
            mapTile.image = tileset.bush.image
        elseif ( mapTile.tile == "Gold" ) then
            mapTile.image = tileset.gold.image
        elseif ( mapTile.tile == "Sand" ) then
            mapTile.image = tileset.sand.image
        elseif ( mapTile.tile == "Tree" ) then
            mapTile.image = tileset.tree.image
        elseif ( mapTile.tile == "House1" ) then
            mapTile.image = tileset.blueHouse.image
        elseif ( mapTile.tile == "House2" ) then
            mapTile.image = tileset.tanHouse.image
        elseif ( mapTile.tile == "House3" ) then
            mapTile.image = tileset.redHouse.image
        else
            mapTile.image = tileset.grass.image
        end
	end -- for mapIdx, mapTile in pairs( map ) do
end

function DrawMap()
	love.graphics.setColor( 255, 255, 255, 255 )
	for index, mapTile in pairs( map ) do
		love.graphics.draw( mapTile.image, mapTile.x - camera.x, mapTile.y - camera.y )
	end
end	
