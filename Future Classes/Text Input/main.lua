-- From: https://love2d.org/wiki/love.keypressed
name = ""

function love.load()
end

function love.update()
end

function love.keypressed( key, unicode )
	if ( unicode > 31 and unicode < 127 ) then
		name = name .. string.char( unicode )
	end
end

function love.draw()
	love.graphics.print( "Type in letters to enter your name. Hit ENTER when you're done.", 0, 0 )
	
	love.graphics.print( "Name: " .. name, 800/2, 600/2 )
end
