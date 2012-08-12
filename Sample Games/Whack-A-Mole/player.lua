-- Sample love Whack-A-Mole game
-- (c) Rachel J. Morris, 2012
-- zlib license

player = {
    x = 0,
    y = 0,
    width = 64,
    height = 64,
    isDown = false,
    hits = 0,
    misses = 0,
    hitAlready = false
}

function player:Setup()
    love.mouse.setVisible( false )
    self.image = love.graphics.newImage( "Images/Hammer.png" )
    self.imageQuad = love.graphics.newQuad( 
        0, 0, -- Current position of the frame
        self.width, self.height, -- Width/Height of one frame
        self.image:getWidth(), self.image:getHeight()  -- Width/Height of the ENTIRE image
    )
end

function player:Update()
    -- Check whether mouse button is hit
    -- Get the correct frame for the filmstrip
    if ( love.mouse.isDown( "l" ) ) then
        self.isDown = true
        self.imageQuad:setViewport( self.width, 0, self.width, self.height )
        
        -- Check to see if you're clicking a mole!
        if ( self.hitAlready == false ) then
            if ( CheckMoleHits() == true ) then
                player.hits = player.hits + 1
            end
            -- Only count one hit per click
            self.hitAlready = true 
        end
        
    else
        self.isDown = false
        self.hitAlready = false
        self.imageQuad:setViewport( 0, 0, self.width, self.height )
    end  
      
    player.x = love.mouse.getX() - 32
    player.y = love.mouse.getY() - 32
    
    if ( playerWins == false and player.hits == hitsToWin ) then
        playerWins = true
    end
end

function player:Draw()
    love.graphics.drawq( self.image, self.imageQuad, self.x, self.y )
    
    love.graphics.setColor( 0, 0, 255, 255 )
    love.graphics.setColor( 255, 255, 255, 255 )
end
