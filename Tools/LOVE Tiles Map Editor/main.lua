-- LOVE Tiles
-- Really simple map editor for my LOVE/Lua class
-- http://www.moosader.com/resources/tutorials/love-lua/1
-- (c) Rachel J. Morris, 2012
-- zlib license

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
    userinput:GetInput()
	editor:Update()
end

function love.draw()
    editor:DrawBackground()
	DrawMap()
	editor:DrawHUD()
	editor:DrawPhantomCursor()
end
