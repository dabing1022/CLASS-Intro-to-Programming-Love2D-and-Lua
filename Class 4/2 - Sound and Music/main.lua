-- Class 4 Program 2
-- http://www.moosader.com/resources/tutorials/love-lua/1
-- (c) Rachel J. Morris, 2012
-- zlib license

notes = {
	c = {
		file = "c.mid",
		heldDown = false,
		sound = nil,
		x = 0
	},
	
	d = {
		file = "d.mid",
		heldDown = false,
		sound = nil,
		x = 1
	},
	
	e = {
		file = "e.mid",
		heldDown = false,
		sound = nil,
		x = 2
	},
	
	f = {
		file = "f.mid",
		heldDown = false,
		sound = nil,
		x = 3
	},
	
	g = {
		file = "g.mid",
		heldDown = false,
		sound = nil,
		x = 4
	},
	
	a = {
		file = "a.mid",
		heldDown = false,
		sound = nil,
		x = 5
	},
	
	b = {
		file = "b.mid",
		heldDown = false,
		sound = nil,
		x = 6
	}
}

function love.load()
	for index, note in pairs( notes ) do
		note.sound = love.audio.newSource( note.file, "stream" )
	end
end

function love.update()
	for index, note in pairs( notes ) do
		note.heldDown = false
	end

	if ( love.keyboard.isDown( "z" ) ) then		-- C
		love.audio.play( notes.c.sound )
		notes.c.heldDown = true
		
	elseif ( love.keyboard.isDown( "x" ) ) then	-- D
		love.audio.play( notes.d.sound )
		notes.d.heldDown = true
		
	elseif ( love.keyboard.isDown( "c" ) ) then	-- E
		love.audio.play( notes.e.sound )
		notes.e.heldDown = true
		
	elseif ( love.keyboard.isDown( "v" ) ) then	-- F
		love.audio.play( notes.f.sound )
		notes.f.heldDown = true
		
	elseif ( love.keyboard.isDown( "b" ) ) then	-- G
		love.audio.play( notes.g.sound )
		notes.g.heldDown = true
		
	elseif ( love.keyboard.isDown( "n" ) ) then	-- A
		love.audio.play( notes.a.sound )
		notes.a.heldDown = true
		
	elseif ( love.keyboard.isDown( "m" ) ) then	-- B
		love.audio.play( notes.b.sound )
		notes.b.heldDown = true
	end
end

function love.draw()
	x = 0
	y = 50
	keyWidth = 25
	keyHeight = 60
	for index, note in pairs( notes ) do
		x = 50 + note.x * keyWidth
	
		if ( note.heldDown ) then
			love.graphics.setColor( 200, 200, 200, 255 )
		else
			love.graphics.setColor( 255, 255, 255, 255 )
		end
		
		love.graphics.rectangle( "fill", x, y, keyWidth, keyHeight )
		love.graphics.setColor( 100, 100, 100, 255 )
		love.graphics.rectangle( "line", x, y, keyWidth, keyHeight )
	end
end


