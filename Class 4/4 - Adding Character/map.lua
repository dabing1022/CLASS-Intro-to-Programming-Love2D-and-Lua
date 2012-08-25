-- Class 4 Program 4
-- http://www.moosader.com/resources/tutorials/love-lua/1
-- (c) Rachel J. Morris, 2012
-- zlib license

require "GeneratedMap"
require "tileset"
require "collisionObject"
require "camera"

-- This needs to be refactored!!
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
        y = newy,
        width = 0,
        height = 0
    }
    table.insert( map, 1, newTile )
end

function LinkTilesToMap()
	-- Link tileset to map, also setup collision
	for mapIdx, mapTile in pairs( map ) do
        -- I'm lazy, doing this for now.
		if ( mapTile.tile == "Bush" ) then
            mapTile.image = tileset.bush.image
			LoadCollidableObject( mapTile, "full" )
			
        elseif ( mapTile.tile == "Gold" ) then
            mapTile.image = tileset.gold.image
			LoadCollidableObject( mapTile, "full" )
			
        elseif ( mapTile.tile == "Sand" ) then
            mapTile.image = tileset.sand.image
			
        elseif ( mapTile.tile == "Tree" ) then
            mapTile.image = tileset.tree.image
			LoadCollidableObject( mapTile, "full" )
			
        elseif ( mapTile.tile == "House1" ) then
            mapTile.image = tileset.blueHouse.image
			LoadCollidableObject( mapTile, "full" )
			
        elseif ( mapTile.tile == "House2" ) then
            mapTile.image = tileset.tanHouse.image
			LoadCollidableObject( mapTile, "full" )
			
        elseif ( mapTile.tile == "House3" ) then
            mapTile.image = tileset.redHouse.image
			LoadCollidableObject( mapTile, "full" )
			
        else
            mapTile.image = tileset.grass.image
        end
	end -- for mapIdx, mapTile in pairs( map ) do
end

function DrawMap()
	love.graphics.setColor( 255, 255, 255, 255 )
	for index, mapTile in pairs( map ) do
        -- Only draw map if it's within the screen's viewable area
        if ( camera:CoordinateIsVisible( mapTile.x, mapTile.y ) ) then
            love.graphics.draw( mapTile.image, mapTile.x - camera.x, mapTile.y - camera.y )
        end
	end
end	
