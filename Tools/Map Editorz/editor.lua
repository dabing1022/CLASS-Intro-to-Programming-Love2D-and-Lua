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

function DrawEditor()
	love.graphics.setColor( 131, 164, 214, 255 )
	love.graphics.rectangle( "fill", 0, 0, 800, 600 )
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
			table.remove( map )
		end
		mouseDownCounted = 5
	end
end

function DrawTile()
	if ( mouseDownCounted <= 0 ) then
		newTile = {
			x = love.mouse.getX() - currentBrush.width / 2 + viewOffset.x,
			y = love.mouse.getY() - currentBrush.height / 2 + viewOffset.y,
			tile = currentBrush
		}
		
		table.insert( map, newTile )
		mouseDownCounted = 5
	end
end


