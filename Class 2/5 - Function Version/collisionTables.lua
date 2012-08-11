-- Simple distance-based collision function
-- http://www.moosader.com/resources/tutorials/love-lua/1
-- (c) Rachel J. Morris, 2012
-- zlib license

function collision( objA, objB )
    distance = ( (objA.X - objB.X)^2 + (objA.Y - objB.Y)^2 )^(0.5)
    
    if ( distance < 32 ) then
        return true
    end
    
    return false
end
