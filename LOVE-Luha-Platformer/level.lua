-- Luha, sample platformer made with LÖVE. Rachel J. Morris, moosader.com. zlib license

-- If game is 640x480 and tiles are 32x32, then
-- one-screen of map is 20x15 tiles.
-- Tiles: 0: Cobblestone, 1: Wood Planks,
-- 2: Sand, 3: Ooze, 4: Dirt

level = {
	imagePath = "content/images/TempTiles.png",
	tileW = 32,
	tileH = 32,
	map = {
		tile0 = { x = 0, y = 448, image = 2, solid = true },
		tile1 = { x = 32, y = 448, image = 2, solid = true },
		tile2 = { x = 64, y = 448, image = 2, solid = true },
		tile3 = { x = 96, y = 448, image = 2, solid = true },
		tile4 = { x = 128, y = 448, image = 0, solid = true },
		tile5 = { x = 160, y = 448, image = 0, solid = true },
		tile6 = { x = 192, y = 448, image = 0, solid = true },
		tile7 = { x = 224, y = 448, image = 2, solid = true },
		tile8 = { x = 256, y = 448, image = 2, solid = true },
		tile9 = { x = 288, y = 448, image = 2, solid = true },
		tile10 = { x = 320, y = 448, image = 4, solid = true },
		tile11 = { x = 352, y = 448, image = 4, solid = true },
		tile12 = { x = 384, y = 448, image = 4, solid = true },
		tile13 = { x = 416, y = 448, image = 4, solid = true },
		tile14 = { x = 448, y = 448, image = 4, solid = true },
		tile15 = { x = 0, y = 416, image = 1, solid = true },
		tile16 = { x = 448, y = 416, image = 1, solid = true }
	}
}

function level:Init()
	level.image = love.graphics.newImage( level.imagePath )
end

function level:Draw()
	for key, value in pairs( level.map ) do
		qTile = love.graphics.newQuad(
			value.image * level.tileW, 0,
			level.tileW, level.tileH,
			level.image:getWidth(), level.image:getHeight() )
		love.graphics.drawq( level.image, qTile, 
			value.x, value.y )
	end
end
