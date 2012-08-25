-- Class 4 Program 1
-- http://www.moosader.com/resources/tutorials/love-lua/1
-- (c) Rachel J. Morris, 2012
-- zlib license

require "animatedSprite"

player = {
	x = 400,
	y = 300,
	width = 32,
	height = 48,
	direction = 0,
	frame = 0,
	speed = 0.5
}

function player:GetInput()
	-- Direction based on the layout of the filmstrip
	if ( love.keyboard.isDown( "up" ) ) then
		self.direction = 1
		self.y = self.y - self.speed
	elseif ( love.keyboard.isDown( "down" ) ) then
		self.direction = 0
		self.y = self.y + self.speed
	elseif ( love.keyboard.isDown( "left" ) ) then
		self.direction = 2
		self.x = self.x - self.speed
	elseif ( love.keyboard.isDown( "right" ) ) then
		self.direction = 3
		self.x = self.x + self.speed
	end
end

function player:UpdateFrame()
end

function player:Draw()
end

function love.load()
	LoadAnimatedSprite( player, "Ayne.png" )
end

function love.update()
	player:GetInput()
	UpdateAnimatedSprite( player )
end

function love.draw()
	DrawAnimatedSprite( player )
end
