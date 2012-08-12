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
    CheckForDraw()
end

function love.draw()
    DrawBackground()
	DrawMap()
	DrawEditor()
	DrawPhantomCursor()
end
