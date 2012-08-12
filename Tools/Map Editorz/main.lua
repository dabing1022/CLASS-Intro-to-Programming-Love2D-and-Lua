require "userinput"
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
    GetUserInput()
	editor:Update()
end

function love.draw()
    editor:DrawBackground()
	DrawMap()
	editor:DrawHUD()
	editor:DrawPhantomCursor()
end
