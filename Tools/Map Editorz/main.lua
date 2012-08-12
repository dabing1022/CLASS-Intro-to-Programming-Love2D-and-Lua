require "tileset"
require "editor"

viewOffset = { 
	x = 0,
	y = 0
}

function love.load()
	tileset:Setup()
	SetupMap()
end

function love.update()
	if ( love.mouse.isDown( "l" ) ) then
		DrawTile()
	end
	
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
	
	GetBrush()
	CheckUndoLast()
	UpdateEditor()
end

function love.draw()
	DrawEditor()
	DrawMap()
	DrawPhantomCursor()
	
	love.graphics.print( "Current Brush: " .. currentBrushName, 0, 0 )
	love.graphics.print( "Total Tiles: " .. #map, 0, 15 )
	love.graphics.print( "X Offset: " .. viewOffset.x, 0, 30 )
	love.graphics.print( "Y Offset: " .. viewOffset.y, 0, 45 )
	
	love.graphics.print( "Press 1 through 7 to choose a tile", 400, 0 )
	love.graphics.print( "Press 'Z' to undo tiles", 400, 15 )
	love.graphics.print( "Press 'S' to save the map", 400, 30 )
	love.graphics.print( "Use the arrow keys to scroll through the map", 400, 45 )
end