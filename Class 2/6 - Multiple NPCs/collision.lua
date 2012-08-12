-- Simple distance-based collision function
-- http://www.moosader.com/resources/tutorials/love-lua/1
-- (c) Rachel J. Morris, 2012
-- zlib license

function collision( x1, y1, x2, y2 )
    distance = ( (x2 - x1)^2 + (y2 - y1)^2 )^(0.5)
    
    if ( distance < 32 ) then
        return true
    else
        return false
    end
end
