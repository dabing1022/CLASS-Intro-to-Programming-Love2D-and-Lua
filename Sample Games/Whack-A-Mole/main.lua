-- Sample love Whack-A-Mole game
-- (c) Rachel J. Morris, 2012
-- zlib license

require "player"
require "moles"

playerWins = false
hitsToWin = 20

function love.load()
	fntHeader = love.graphics.newFont( 24 )
	fntText = love.graphics.newFont( 14 )
    
    player:Setup()
    SetupMoles()
    backgroundImage = love.graphics.newImage( "Images/Background.png" )
end

function love.update()
    if ( playerWins == false ) then
        player:Update()
        UpdateMoles()
    end
end

function love.draw()
    if ( playerWins == true ) then
        love.graphics.setColor( 0, 0, 0, 255 )
        love.graphics.rectangle( "fill", 0, 0, 800, 600 )
        
        love.graphics.setColor( 255, 255, 255, 255 )
        love.graphics.setFont( fntHeader )
        love.graphics.print( "YOU WIN!", 325, 250 )
        love.graphics.setFont( fntText )
        love.graphics.print( "Hits: " .. player.hits, 300, 320 )
        love.graphics.print( "Misses: " .. player.misses, 300, 340 )
        hitRatio = math.floor( (player.hits/(player.hits + player.misses) * 100) )
        love.graphics.print( "Ratio: " .. hitRatio .. "%", 300, 360 )
    else
        love.graphics.draw( backgroundImage, 0, 0 )
        DrawMoles()
        player:Draw()

        love.graphics.setFont( fntText )
        love.graphics.print( "WHACK-A-MOLE", 0, 0 )
        love.graphics.print( "Click on a mole to whack it!", 10, 15 )
        love.graphics.print( "Hits: " .. player.hits, 10, 30 )
        love.graphics.print( "Misses: " .. player.misses, 10, 45 )
    end
end
