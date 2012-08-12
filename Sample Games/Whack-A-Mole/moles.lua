-- Sample love Whack-A-Mole game
-- (c) Rachel J. Morris, 2012
-- zlib license

moleDelay = 0

minimumTimeVisible = 20
maximumTimeVisible = 200
minimumTimeDelay = 10
maximumTimeDelay = 50

-- This seems like a good place for Arrays :)
mole1 = {
    x = 170,
    y = 50,
    width = 123,
    height = 139,
    poppedUp = false,
    visibleCounter = 0
}
mole2 = {
    x = 460,
    y = 50,
    width = 123,
    height = 139,
    poppedUp = false,
    visibleCounter = 0
}
mole3 = {
    x = 125,
    y = 290,
    width = 123,
    height = 139,
    poppedUp = false,
    visibleCounter = 0
}
mole4 = {
    x = 520,
    y = 290,
    width = 123,
    height = 139,
    poppedUp = false,
    visibleCounter = 0
}

function SetupMoles()
    moleImage = love.graphics.newImage( "Images/Mole.png" )
    mole1.image = moleImage
    mole2.image = moleImage
    mole3.image = moleImage
    mole4.image = moleImage
end

function UpdateMoles()
    moleDelay = moleDelay - 0.1
    
    if ( moleDelay <= 0 ) then 
        -- Pop up new mole
        popMole = math.random( 1, 4 )
        if ( popMole == 1 ) then
            PopUpMole( mole1 )
        elseif ( popMole == 2 ) then
            PopUpMole( mole2 )
        elseif ( popMole == 3 ) then
            PopUpMole( mole3 )
        elseif ( popMole == 4 ) then
            PopUpMole( mole4 )
        end        
        
        -- Set new delay
        moleDelay = math.random( minimumTimeDelay, maximumTimeDelay )
    end
    
    CoolDownMole( mole1 )
    CoolDownMole( mole2 )
    CoolDownMole( mole3 )
    CoolDownMole( mole4 )
end

function DrawMoles()
    DrawMole( mole1 )
    DrawMole( mole2 )
    DrawMole( mole3 )
    DrawMole( mole4 )
end

function CheckMoleHits()
    gotAHit = false
    if ( Collision( player, mole1 ) ) then
        gotAHit = true
        PopDownMole( mole1 )
    end
    
    if ( Collision( player, mole2 ) ) then
        gotAHit = true
        PopDownMole( mole2 )
    end
    
    if ( Collision( player, mole3 ) ) then
        gotAHit = true
        PopDownMole( mole3 )
    end
    
    if ( Collision( player, mole4 ) ) then
        gotAHit = true
        PopDownMole( mole4 )
    end
    
    return gotAHit
end

function Collision( hammer, mole )
    if ( mole.poppedUp == true and
            hammer.x < mole.x + mole.width and
            hammer.x + hammer.width > mole.x and
            hammer.y < mole.y + mole.height and
            hammer.y + hammer.height > mole.y 
        ) then
        return true
    end
    return false
end


function PopUpMole( mole )
    if ( mole.poppedUp == false ) then
        mole.poppedUp = true
        mole.visibleCounter = math.random( minimumTimeVisible, maximumTimeVisible )
    end
end

function PopDownMole( mole ) 
    mole.poppedUp = false
end

function CoolDownMole( mole )
    if ( mole.poppedUp == true ) then
        mole.visibleCounter = mole.visibleCounter - 0.1
    end
    
    if ( mole.poppedUp == true and mole.visibleCounter <= 0 ) then
        player.misses = player.misses + 1
        PopDownMole( mole )
    end
end

function DrawMole( mole )
    if ( mole.poppedUp == true ) then
        love.graphics.draw( mole.image, mole.x, mole.y )
    end
end
