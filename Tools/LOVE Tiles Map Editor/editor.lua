require "tileset"
require "map"

editor = {
    currentBrush = {
        tile = tileset.blueHouse,
        name = "Blue House"
    } ,
    mouseCooldown = 0,
    mouseCooldownMax = 1
}

function editor:Update()
	if ( editor.mouseCooldown > 0 ) then
		editor.mouseCooldown = editor.mouseCooldown - 0.1
	end
end

function editor:DrawBackground()
	love.graphics.setColor( 131, 164, 214, 255 )
	love.graphics.rectangle( "fill", 0, 100, 800, 600 )
end

function editor:DrawHUD()
    -- HUD
	love.graphics.setColor( 0, 0, 0, 255 )
	love.graphics.rectangle( "fill", 0, 0, 800, 100 )
	
	love.graphics.setColor( 153, 176, 209, 255 )
	love.graphics.print( "Current Brush: " .. editor.currentBrush.name, 0, 0 )
	love.graphics.print( "Total Tiles: " .. #map, 0, 15 )
	love.graphics.print( "X Offset: " .. viewOffset.x, 0, 30 )
	love.graphics.print( "Y Offset: " .. viewOffset.y, 0, 45 )
	
	love.graphics.print( "Press 1 through 7 to choose a tile", 400, 0 )
	love.graphics.print( "Press 'Z' to undo tiles", 400, 15 )
	love.graphics.print( "Press 'S' to save the map", 400, 30 )
	love.graphics.print( "Use the arrow keys to scroll through the map", 400, 45 )
    
    if ( mapProperties.noUnsavedChanges == true ) then
        love.graphics.setColor( 0, 255, 0, 255 )
        love.graphics.print( "No unsaved changes", 0, 60 )
    else
        love.graphics.setColor( 255, 0, 0, 255 )
        love.graphics.print( "UNSAVED CHANGES", 0, 60 )
    end
	love.graphics.setColor( 153, 176, 209, 255 )
    
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

function editor:DrawPhantomCursor()
	-- Highlight tile
	love.graphics.setColor( 255, 255, 255, 100 )
	love.graphics.draw( editor.currentBrush.tile.image,
		love.mouse.getX() - editor.currentBrush.tile.width/2,
		love.mouse.getY() - editor.currentBrush.tile.height/2 )
	love.graphics.setColor( 255, 255, 255, 255 )
end

function editor:PaintTile()
	if ( editor.mouseCooldown <= 0 ) then
        AppendTileToMap( 
            love.mouse.getX() - editor.currentBrush.tile.width / 2 + viewOffset.x,
            love.mouse.getY() - editor.currentBrush.tile.height / 2 + viewOffset.y,
            editor.currentBrush.tile )
		editor.mouseCooldown = editor.mouseCooldownMax
	end
end


