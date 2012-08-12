require "tileset"
require "map"

currentBrush = tileset.blueHouse
currentBrushName = "Blue House"
mouseDownCounted = 0

function UpdateEditor()
	if ( mouseDownCounted > 0 ) then
		mouseDownCounted = mouseDownCounted - 0.1
	end
end

function DrawBackground()
	love.graphics.setColor( 131, 164, 214, 255 )
	love.graphics.rectangle( "fill", 0, 100, 800, 600 )
end

function DrawEditor()
    -- HUD
	love.graphics.setColor( 0, 0, 0, 255 )
	love.graphics.rectangle( "fill", 0, 0, 800, 100 )
	
	love.graphics.setColor( 153, 176, 209, 255 )
	love.graphics.print( "Current Brush: " .. currentBrushName, 0, 0 )
	love.graphics.print( "Total Tiles: " .. #map, 0, 15 )
	love.graphics.print( "X Offset: " .. viewOffset.x, 0, 30 )
	love.graphics.print( "Y Offset: " .. viewOffset.y, 0, 45 )
	
	love.graphics.print( "Press 1 through 7 to choose a tile", 400, 0 )
	love.graphics.print( "Press 'Z' to undo tiles", 400, 15 )
	love.graphics.print( "Press 'S' to save the map", 400, 30 )
	love.graphics.print( "Use the arrow keys to scroll through the map", 400, 45 )
    
    love.graphics.print( "1: Bush", 0, 80 )
    love.graphics.print( "2: Tree", 100, 80 )
    love.graphics.print( "3: Gold", 200, 80 )
    love.graphics.print( "4: Sand", 300, 80 )
    love.graphics.print( "5: Blue House", 400, 80 )
    love.graphics.print( "6: Tan House", 500, 80 )
    love.graphics.print( "7: Red House", 600, 80 )
    
    -- Draw the coordinate overlay
	love.graphics.setColor( 255, 255, 255, 255 )
    for x = 0, 800*2/32, 5 do
        love.graphics.print( x, x*32 - viewOffset.x, 100 )
    end
    for y = 0, 600*2/32, 5 do
        if ( y*32 - viewOffset.y >= 100 ) then
            love.graphics.print( y, 0, y*32 - viewOffset.y )
        end
    end
end

function DrawPhantomCursor()
	-- Highlight tile
	love.graphics.setColor( 255, 255, 255, 100 )
	love.graphics.draw( currentBrush.image,
		love.mouse.getX() - currentBrush.width/2,
		love.mouse.getY() - currentBrush.height/2 )
	love.graphics.setColor( 255, 255, 255, 255 )
end

function GetBrush()
	if ( love.keyboard.isDown( "1" ) ) then
		currentBrush = tileset.bush
		currentBrushName = "Bush"
	elseif ( love.keyboard.isDown( "2" ) ) then
		currentBrush = tileset.tree
		currentBrushName = "Tree"
	elseif ( love.keyboard.isDown( "3" ) ) then
		currentBrush = tileset.gold
		currentBrushName = "Gold"
	elseif ( love.keyboard.isDown( "4" ) ) then
		currentBrush = tileset.sand
		currentBrushName = "Sand"
	elseif ( love.keyboard.isDown( "5" ) ) then
		currentBrush = tileset.blueHouse
		currentBrushName = "Blue House"
	elseif ( love.keyboard.isDown( "6" ) ) then
		currentBrush = tileset.tanHouse
		currentBrushName = "Tan House"
	elseif ( love.keyboard.isDown( "7" ) ) then
		currentBrush = tileset.redHouse
		currentBrushName = "Red House"
	end
end

function CheckUndoLast()
	if ( mouseDownCounted <= 0 ) then
		if ( love.keyboard.isDown( "z" ) ) then
            RemoveLastTile()
		end
		mouseDownCounted = 3
	end
end

function DrawTile()
	if ( mouseDownCounted <= 0 ) then
        AppendTileToMap( love.mouse.getX() - currentBrush.width / 2 + viewOffset.x,
            love.mouse.getY() - currentBrush.height / 2 + viewOffset.y,
            currentBrush )
		mouseDownCounted = 3
	end
end

function CheckForDraw()
	if ( love.mouse.isDown( "l" ) ) then
		DrawTile()
	end
end


