-- Luha, sample platformer made with LÖVE. Rachel J. Morris, moosader.com. zlib license

Velocity = { x, y }
Keyboard = { left, right, jump, attack }

Character = {
	x = 64,
	y = 64,
	w = 48,
	h = 48,
	frame = 0,
	action = 0,
	hp = 100,
	attacking = false,
	walking = false,
	vel,
	key,
	hudSide = "left"
}

function Character:new( obj )
	obj = obj or {}
	setmetatable( obj, self )
	self.__index = self
	
	obj.vel = Velocity:new()
	obj.key = Keyboard:new()
	return obj
end

function Velocity:new( obj )
	obj = obj or {}
	setmetatable( obj, self )
	self.__index = self
	obj.x = 0
	obj.y = 0
	return obj
end

function Keyboard:new( obj )
	obj = obj or {}
	setmetatable( obj, self )
	self.__index = self
	return obj
end

function Character:Init( imagePath, beginX, beginY, hudSide )
	self.image = love.graphics.newImage( imagePath )
	self.x = beginX
	self.y = beginY
	self.hudSide = hudSide
end

function Character:SetControls( btnLeft, btnRight, btnJump, btnAttack )
	self.key.left = btnLeft
	self.key.right = btnRight
	self.key.jump = btnJump
	self.key.attack = btnAttack
end

function Character:Draw()
	-- Draw character
	qFrame = love.graphics.newQuad(
		math.floor(self.frame) * self.w, self.action * self.h,
		self.w, self.h,
		self.image:getWidth(), self.image:getHeight() )
	love.graphics.drawq( self.image, qFrame, self.x, self.y )
	
	-- Draw HUD image
	hudX = 0
	hudY = 0
	if ( self.hudSide == "right" ) then
		hudX = love.graphics.getWidth() - 64
	end
	
	-- Background is based on HP
	if ( self.hp >= 75 ) then
		love.graphics.setColor( 0, 200, 0, 255 )
	elseif ( self.hp >= 50 ) then
		love.graphics.setColor( 200, 150, 0, 255 )
	elseif ( self.hp >= 25 ) then
		love.graphics.setColor( 200, 0, 0, 255 )
	elseif ( self.hp <= 0 ) then
		love.graphics.setColor( 0, 0, 0, 255 )
	end
	love.graphics.rectangle( "fill", 
		hudX, hudY,
		64, 64 )
		
	love.graphics.setColor( 255, 255, 255 )
	qHead = love.graphics.newQuad(
		192, 0, 64, 64, self.image:getWidth(), self.image:getHeight() )
	love.graphics.drawq( self.image, qHead, 
		hudX, hudY )
end

function Character:HandleInput()
	-- Left/Right movement
	if love.keyboard.isDown( self.key.left ) then
		self:MoveLeft()
	elseif love.keyboard.isDown( self.key.right ) then
		self:MoveRight()
	else
		self.walking = false
	end
	
	-- Jump
	if love.keyboard.isDown( self.key.jump ) and
		physics:GroundCollision( self, level ) then
		self:BeginJump()
	end
	
	-- Attack
	if love.keyboard.isDown( self.key.attack ) and
		self.attacking == false then
		self:BeginAttack()
	end
	
	self:UpdateAnimation()
end

function Character:MoveLeft()
	self.vel.x = self.vel.x - physics.accelerateRate
	self.action = 0
	self.walking = true
end

function Character:MoveRight()
	self.vel.x = self.vel.x + physics.accelerateRate
	self.action = 1
	self.walking = true
end

function Character:BeginAttack()
	self.frame = 0
	self.attacking = true
	self.action = self.action + 2	-- Change to appropriate direction attack
end

function Character:BeginJump()
	self.vel.y = self.vel.y + physics.maximumVelocity.jump
end

function Character:UpdateAnimation( walked )
	animIncRate = 0.05

	-- Loop animations
	if ( self.action <= 1 ) then 
		if ( self.walking ) then self.frame = self.frame + animIncRate end
		if (  self.frame >= 4 ) then 
			self.frame = 0 
		end
	-- Adjust animation if not walking
	elseif ( self.action > 1 ) then
		self.frame = self.frame + animIncRate
		if ( self.frame >= 3 ) then
			-- Go from Attack to normal
			self.frame = 0
			self.action = self.action - 2
			self.attacking = false
		end
	end
end

function Character:Update()
	-- Adjust velocity
	if ( self.vel.x > physics.maximumVelocity.x ) then 
		self.vel.x = physics.maximumVelocity.x 
	elseif ( self.vel.x < -physics.maximumVelocity.x ) then 
		self.vel.x = -physics.maximumVelocity.x 
	end
	if ( self.vel.y > physics.maximumVelocity.y ) then 
		self.vel.y = physics.maximumVelocity.y 
	elseif ( self.vel.y < physics.maximumVelocity.jump ) then 
		self.vel.y = -physics.maximumVelocity.y 
	end

	-- Move
	if ( physics:SideCollision( self, level ) == false ) then
		self.x = self.x + self.vel.x	
	end
	
	self.y = self.y + self.vel.y
	
	-- Friction
	if ( self.vel.x > 0.5 ) then
		self.vel.x = self.vel.x - physics.frictionRate
	elseif ( self.vel.x < -0.5 ) then
		self.vel.x = self.vel.x + physics.frictionRate
	else
		self.vel.x = 0
	end
	
	self:UpdateAnimation()
end
