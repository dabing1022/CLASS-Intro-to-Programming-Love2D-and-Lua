-- LOVE Tiles
-- Really simple map editor for my LOVE/Lua class
-- http://www.moosader.com/resources/tutorials/love-lua/1
-- (c) Rachel J. Morris, 2012
-- zlib license

config = {
	mapSavePath = {
		filepath = "",
		filename = "GeneratedMap.lua"
	}
}

function love.conf(t)
    t.title = "LOVE Tiles by Rachel J. Morris"
    t.author = "Rachel J. Morris"
    t.url = "http://www.moosader.com/"
end
